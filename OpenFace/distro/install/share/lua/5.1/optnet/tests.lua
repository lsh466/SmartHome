local optnet = require 'optnet.env'
local models = require 'optnet.models'
local utils = require 'optnet.utils'
local countUsedMemory = optnet.countUsedMemory

local optest = torch.TestSuite()
local tester = torch.Tester()

local use_cudnn = false
local backward_tol = 1e-6

local function resizeAndConvert(input, type)
  local res
  local s = 64
  if torch.isTensor(input) then
    local iSize = torch.Tensor(input:size():totable())[{{2,-1}}]
    res = torch.rand(s,table.unpack(iSize:totable())):type(type)
  else
    res = {}
    for k, v in ipairs(input) do
      res[k] = resizeAndConvert(v,type)
    end
  end
  return res
end

local function cudnnSetDeterministic(net)
  net:apply(function(m)
    if m.setMode then m:setMode(1, 1, 1) end
  end)
end

local function genericTestForward(model,opts)
  local net, input = models[model](opts)
  net:evaluate()

  if use_cudnn then
    cudnn.convert(net,cudnn);
    net:cuda();

    input = resizeAndConvert(input,'torch.CudaTensor')
  end

  local out_orig = utils.recursiveClone(net:forward(input))

  local mems1 = optnet.countUsedMemory(net)

  optnet.optimizeMemory(net, input)

  local out = utils.recursiveClone(net:forward(input))
  local mems2 = countUsedMemory(net)
  tester:eq(out_orig, out, 'Outputs differ after optimization of '..model)

  local mem1 = mems1.total_size
  local mem2 = mems2.total_size

  local omem1 = mems1.outputs
  local omem2 = mems2.outputs

  local bmem1 = mems1.buffers
  local bmem2 = mems2.buffers

  local pmem1 = mems1.params
  local pmem2 = mems2.params

  tester:assertle(mem2, mem1, 'Optimized model uses more memory! '..
  'Before: '.. mem1..' bytes, After: '..mem2..' bytes')
  print('Memory use')
  print('Total',  mem1/1024/1024,  mem2/1024/1024, 1-mem2/mem1)
  print('Outputs',omem1/1024/1024,omem2/1024/1024, 1-omem2/omem1)
  print('Buffers',bmem1/1024/1024,bmem2/1024/1024, 1-bmem2/bmem1)
  print('Params', pmem1/1024/1024,pmem2/1024/1024, 1-pmem2/pmem1)
end

-------------------------------------------------
-- Backward
-------------------------------------------------

local function genericTestBackward(model,opts)
  local net, input = models[model](opts)
  net:training()

  if use_cudnn then
    cudnn.convert(net,cudnn);
    cudnnSetDeterministic(net)
    net:cuda();

    input = resizeAndConvert(input,'torch.CudaTensor')
  end

  local out_orig = utils.recursiveClone(net:forward(input))
  local grad_orig = utils.recursiveClone(out_orig)
  net:zeroGradParameters()
  local gradInput_orig = utils.recursiveClone(net:backward(input, grad_orig))
  local _, gradParams_orig = net:getParameters()
  gradParams_orig = gradParams_orig:clone()

  local mems1 = optnet.countUsedMemory(net)

  optnet.optimizeMemory(net, input, {mode='training'})

  local out = utils.recursiveClone(net:forward(input))
  local grad = utils.recursiveClone(out)
  net:zeroGradParameters()
  local gradInput = utils.recursiveClone(net:backward(input, grad))
  local _, gradParams = net:getParameters()
  gradParams = gradParams:clone()

  local mems2 = countUsedMemory(net)
  tester:eq(out_orig, out, 'Outputs differ after optimization of '..model)
  tester:eq(gradInput_orig, gradInput, backward_tol, 'GradInputs differ after optimization of '..model)
  tester:eq(gradParams_orig, gradParams, backward_tol, 'GradParams differ after optimization of '..model)

  local mem1 = mems1.total_size
  local mem2 = mems2.total_size

  local omem1 = mems1.outputs
  local omem2 = mems2.outputs

  local imem1 = mems1.gradInputs
  local imem2 = mems2.gradInputs

  local bmem1 = mems1.buffers
  local bmem2 = mems2.buffers

  local pmem1 = mems1.params
  local pmem2 = mems2.params

  tester:assertle(mem2, mem1, 'Optimized model uses more memory! '..
  'Before: '.. mem1..' bytes, After: '..mem2..' bytes')
  print('Memory use')
  print('Total',  mem1/1024/1024,  mem2/1024/1024, 1-mem2/mem1)
  print('Outputs',omem1/1024/1024,omem2/1024/1024, 1-omem2/omem1)
  print('gradInputs',imem1/1024/1024,imem2/1024/1024, 1-imem2/imem1)
  print('Buffers',bmem1/1024/1024,bmem2/1024/1024, 1-bmem2/bmem1)
  print('Params', pmem1/1024/1024,pmem2/1024/1024, 1-pmem2/pmem1)
end

-------------------------------------------------
-- removing optimization
-------------------------------------------------

local function genericTestRemoveOptim(model,opts)
  local net, input = models[model](opts)
  net:training()

  if use_cudnn then
    cudnn.convert(net,cudnn);
    cudnnSetDeterministic(net)
    net:cuda();

    input = resizeAndConvert(input,'torch.CudaTensor')
  end

  local out_orig = utils.recursiveClone(net:forward(input))
  local grad_orig = utils.recursiveClone(out_orig)
  net:zeroGradParameters()
  local gradInput_orig = utils.recursiveClone(net:backward(input, grad_orig))
  local _, gradParams_orig = net:getParameters()
  gradParams_orig = gradParams_orig:clone()

  optnet.optimizeMemory(net, input)
  optnet.removeOptimization(net)

  local out = utils.recursiveClone(net:forward(input))
  local grad = utils.recursiveClone(out)
  net:zeroGradParameters()
  local gradInput = utils.recursiveClone(net:backward(input, grad))
  local _, gradParams = net:getParameters()
  gradParams = gradParams:clone()

  tester:eq(out_orig, out, 'Outputs differ after optimization of '..model)
  tester:eq(gradInput_orig, gradInput, backward_tol, 'GradInputs differ after optimization of '..model)
  tester:eq(gradParams_orig, gradParams, backward_tol, 'GradParams differ after optimization of '..model)
end

for k, v in pairs(models) do
  if k ~= 'resnet' and k ~= 'preresnet' then
    optest[k] = function()
      genericTestForward(k)
    end
    optest[k..'_backward'] = function()
      genericTestBackward(k)
    end
    optest[k..'_remove'] = function()
      genericTestRemoveOptim(k)
    end
  end
end

for _, v in ipairs({20,32,56,110}) do
  for _, k in ipairs{'resnet', 'preresnet'} do
    local opts = {dataset='cifar10',depth=v}
    optest[k..v] = function()
      genericTestForward(k, opts)
    end
    optest[k..v..'_backward'] = function()
      genericTestBackward(k, opts)
    end
    optest[k..v..'_remove'] = function()
      genericTestRemoveOptim(k, opts)
    end
  end
end

tester:add(optest)

function optnet.test(tests, opts)
  opts = opts or {}

  local tType = torch.getdefaulttensortype()
  torch.setdefaulttensortype('torch.FloatTensor')

  if opts.only_basic_tests then
    local disable = {
      'alexnet','vgg','googlenet',
      'resnet20','resnet32','resnet56','resnet110',
      'preresnet20','preresnet32','preresnet56','preresnet110'
    }
    local toDisable = {}
    for _, v in ipairs(disable) do
      table.insert(toDisable,v)
      table.insert(toDisable,v..'_backward')
      table.insert(toDisable,v..'_remove')
    end
    tester:disable(toDisable)
  end
  if opts.use_cudnn then
    use_cudnn = true
    require 'cudnn'
    require 'cunn'
  end
  tester:run(tests)
  torch.setdefaulttensortype(tType)
  return tester
end
