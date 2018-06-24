require 'nn'

local models = {}
models.basic_parallel = function()
  local m = nn.Sequential()
  local prl = nn.ParallelTable()
  prl:add(nn.Linear(2,2))
  prl:add(nn.Sequential():add(nn.Linear(2,1)):add(nn.Sigmoid()):add(nn.Linear(1,1)))
  m:add(prl)
  m:add(nn.JoinTable(2))
  m:add(nn.Linear(3,2))
  m:add(nn.ReLU(true))

  local input = {torch.rand(2,2), torch.rand(2,2)}
  return m, input
end
models.basic_conv = function()
  local m = nn.Sequential()
  m:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  --  m:add(nn.ReLU(true))
  --  m:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  --  m:add(nn.ReLU(true))
  m:add(nn.View(32*32):setNumInputDims(3))
  m:add(nn.Linear(32*32,100))
  --  m:add(nn.ReLU(true))
  --  m:add(nn.Linear(100,10))
  local input = torch.rand(1,1,32,32)
  return m, input
end

models.basic_deep_conv = function()
  local inplace = true
  local m = nn.Sequential()
  m:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  m:add(nn.ReLU(inplace))
  m:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  m:add(nn.ReLU(inplace))
  m:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  m:add(nn.ReLU(inplace))
  m:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  m:add(nn.ReLU(inplace))
  m:add(nn.View(32*32):setNumInputDims(3))
  m:add(nn.Linear(32*32,100))
  m:add(nn.ReLU(inplace))
  m:add(nn.Linear(100,10))
  local input = torch.rand(1,1,32,32)
  return m, input
end

models.basic_unpooling = function()
  local inplace = true
  local m = nn.Sequential()
  m:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  m:add(nn.ReLU(inplace))
  local mp1 = nn.SpatialMaxPooling(2,2,2,2)
  m:add(mp1)
  m:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  m:add(nn.ReLU(inplace))
  local mp2 = nn.SpatialMaxPooling(2,2,2,2)
  m:add(mp2)
  m:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  m:add(nn.ReLU(inplace))
  m:add(nn.SpatialMaxUnpooling(mp2))
  m:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  m:add(nn.ReLU(inplace))
  m:add(nn.SpatialMaxUnpooling(mp1))
  m:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  local input = torch.rand(1,1,32,32)
  return m, input
end

models.siamese = function()
  local inplace = false
  local b1 = nn.Sequential()
  b1:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  b1:add(nn.ReLU(inplace))
  b1:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  b1:add(nn.ReLU(inplace))
  b1:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  b1:add(nn.ReLU(inplace))
  b1:add(nn.SpatialConvolution(1,1,3,3,1,1,1,1))
  b1:add(nn.ReLU(inplace))
  b1:add(nn.View(-1):setNumInputDims(3))

  local b2 = b1:clone('weight','bias','gradWeight','gradBias')
  local prl = nn.ParallelTable()
  prl:add(b1)
  prl:add(b2)

  m = nn.Sequential()
  m:add(prl)
  m:add(nn.PairwiseDistance(2))
  local input = {torch.rand(1,1,32,32), torch.rand(1,1,32,32)}
  return m, input
end

models.basic_concat = function()
  local m = nn.Sequential()
  local cat = nn.ConcatTable()
  local b1 = nn.Sequential():add(nn.Linear(2,1)):add(nn.ReLU(true)):add(nn.Linear(1,1))
  local b2 = nn.Sequential():add(nn.Linear(2,2)):add(nn.ReLU())
  local b3 = nn.Sequential():add(nn.Linear(2,3)):add(nn.ReLU(true)):add(nn.Linear(3,2))
  cat:add(b1):add(b2):add(b3)
  local cat2 = nn.ConcatTable()
  local bb1 = nn.SelectTable(1)
  local bb2 = nn.NarrowTable(2,2)
  cat2:add(bb1):add(bb2)
  local prl = nn.ParallelTable()
  local bbb1 = nn.Sequential():add(nn.Linear(1,2))
  local bbb2 = nn.CAddTable()
  prl:add(bbb1):add(bbb2)
  local final = nn.CMulTable()
  m:add(cat):add(cat2):add(prl):add(final)

  local input = torch.rand(2,2)
  return m, input

end

models.basic_multiOutput = function()
  local m = nn.Sequential()
  m:add(nn.Linear(2,2))
  m:add(nn.ReLU())
  m:add(nn.Linear(2,2))
  m:add(nn.ReLU())
  m:add(nn.Linear(2,2))
  m:add(nn.ReLU())
  local p = nn.ConcatTable()
  p:add(nn.Linear(2,2))
  p:add(nn.Linear(2,2))
  p:add(nn.Linear(2,2))

  m:add(p)

  local input = torch.rand(2,2)
  return m, input
end

models.alexnet = function()
  -- taken from soumith's imagenet-multiGPU
  -- https://github.com/soumith/imagenet-multiGPU.torch/blob/master/models/alexnet.lua
  local features = nn.Concat(2)
  local fb1 = nn.Sequential() -- branch 1
  fb1:add(nn.SpatialConvolution(3,48,11,11,4,4,2,2))       -- 224 -> 55
  fb1:add(nn.ReLU(true))
  fb1:add(nn.SpatialMaxPooling(3,3,2,2))                   -- 55 ->  27
  fb1:add(nn.SpatialConvolution(48,128,5,5,1,1,2,2))       --  27 -> 27
  fb1:add(nn.ReLU(true))
  fb1:add(nn.SpatialMaxPooling(3,3,2,2))                   --  27 ->  13
  fb1:add(nn.SpatialConvolution(128,192,3,3,1,1,1,1))      --  13 ->  13
  fb1:add(nn.ReLU(true))
  fb1:add(nn.SpatialConvolution(192,192,3,3,1,1,1,1))      --  13 ->  13
  fb1:add(nn.ReLU(true))
  fb1:add(nn.SpatialConvolution(192,128,3,3,1,1,1,1))      --  13 ->  13
  fb1:add(nn.ReLU(true))
  fb1:add(nn.SpatialMaxPooling(3,3,2,2))                   -- 13 -> 6

  local fb2 = fb1:clone() -- branch 2
  for k,v in ipairs(fb2:findModules('nn.SpatialConvolution')) do
    v:reset() -- reset branch 2's weights
  end

  features:add(fb1)
  features:add(fb2)

  -- 1.3. Create Classifier (fully connected layers)
  local classifier = nn.Sequential()
  classifier:add(nn.View(256*6*6))
  --classifier:add(nn.Dropout(0.5))
  classifier:add(nn.Linear(256*6*6, 4096))
  classifier:add(nn.Threshold(0, 1e-6))
  --classifier:add(nn.Dropout(0.5))
  classifier:add(nn.Linear(4096, 4096))
  classifier:add(nn.Threshold(0, 1e-6))
  classifier:add(nn.Linear(4096, 1000))
  classifier:add(nn.LogSoftMax())

  -- 1.4. Combine 1.1 and 1.3 to produce final model
  local model = nn.Sequential():add(features):add(classifier)
  model.imageSize = 256
  model.imageCrop = 224

  local input = torch.rand(1,3,model.imageCrop,model.imageCrop)

  return model, input
end

models.googlenet = function()
  -- taken from soumith's imagenet-multiGPU
  -- https://github.com/soumith/imagenet-multiGPU.torch/blob/master/models/googlenet.lua
  local function inception(input_size, config)
    local concat = nn.Concat(2)
    if config[1][1] ~= 0 then
      local conv1 = nn.Sequential()
      conv1:add(nn.SpatialConvolution(input_size, config[1][1],1,1,1,1)):add(nn.ReLU(true))
      concat:add(conv1)
    end

    local conv3 = nn.Sequential()
    conv3:add(nn.SpatialConvolution(  input_size, config[2][1],1,1,1,1)):add(nn.ReLU(true))
    conv3:add(nn.SpatialConvolution(config[2][1], config[2][2],3,3,1,1,1,1)):add(nn.ReLU(true))
    concat:add(conv3)

    local conv3xx = nn.Sequential()
    conv3xx:add(nn.SpatialConvolution(  input_size, config[3][1],1,1,1,1)):add(nn.ReLU(true))
    conv3xx:add(nn.SpatialConvolution(config[3][1], config[3][2],3,3,1,1,1,1)):add(nn.ReLU(true))
    conv3xx:add(nn.SpatialConvolution(config[3][2], config[3][2],3,3,1,1,1,1)):add(nn.ReLU(true))
    concat:add(conv3xx)

    local pool = nn.Sequential()
    pool:add(nn.SpatialZeroPadding(1,1,1,1)) -- remove after getting nn R2 into fbcode
    if config[4][1] == 'max' then
      pool:add(nn.SpatialMaxPooling(3,3,1,1):ceil())
    elseif config[4][1] == 'avg' then
      pool:add(nn.SpatialAveragePooling(3,3,1,1):ceil())
    else
      error('Unknown pooling')
    end
    if config[4][2] ~= 0 then
      pool:add(nn.SpatialConvolution(input_size, config[4][2],1,1,1,1)):add(nn.ReLU(true))
    end
    concat:add(pool)

    return concat
  end

  local nClasses = 1000

  local features = nn.Sequential()
  features:add(nn.SpatialConvolution(3,64,7,7,2,2,3,3)):add(nn.ReLU(true))
  features:add(nn.SpatialMaxPooling(3,3,2,2):ceil())
  features:add(nn.SpatialConvolution(64,64,1,1)):add(nn.ReLU(true))
  features:add(nn.SpatialConvolution(64,192,3,3,1,1,1,1)):add(nn.ReLU(true))
  features:add(nn.SpatialMaxPooling(3,3,2,2):ceil())
  features:add(inception( 192, {{ 64},{ 64, 64},{ 64, 96},{'avg', 32}})) -- 3(a)
  features:add(inception( 256, {{ 64},{ 64, 96},{ 64, 96},{'avg', 64}})) -- 3(b)
  features:add(inception( 320, {{  0},{128,160},{ 64, 96},{'max',  0}})) -- 3(c)
  features:add(nn.SpatialConvolution(576,576,2,2,2,2))
  features:add(inception( 576, {{224},{ 64, 96},{ 96,128},{'avg',128}})) -- 4(a)
  features:add(inception( 576, {{192},{ 96,128},{ 96,128},{'avg',128}})) -- 4(b)
  features:add(inception( 576, {{160},{128,160},{128,160},{'avg', 96}})) -- 4(c)
  features:add(inception( 576, {{ 96},{128,192},{160,192},{'avg', 96}})) -- 4(d)

  local main_branch = nn.Sequential()
  main_branch:add(inception( 576, {{  0},{128,192},{192,256},{'max',  0}})) -- 4(e)
  main_branch:add(nn.SpatialConvolution(1024,1024,2,2,2,2))
  main_branch:add(inception(1024, {{352},{192,320},{160,224},{'avg',128}})) -- 5(a)
  main_branch:add(inception(1024, {{352},{192,320},{192,224},{'max',128}})) -- 5(b)
  main_branch:add(nn.SpatialAveragePooling(7,7,1,1))
  main_branch:add(nn.View(1024):setNumInputDims(3))
  main_branch:add(nn.Linear(1024,nClasses))
  main_branch:add(nn.LogSoftMax())

  -- add auxillary classifier here (thanks to Christian Szegedy for the details)
  local aux_classifier = nn.Sequential()
  aux_classifier:add(nn.SpatialAveragePooling(5,5,3,3):ceil())
  aux_classifier:add(nn.SpatialConvolution(576,128,1,1,1,1))
  aux_classifier:add(nn.View(128*4*4):setNumInputDims(3))
  aux_classifier:add(nn.Linear(128*4*4,768))
  aux_classifier:add(nn.ReLU())
  aux_classifier:add(nn.Linear(768,nClasses))
  aux_classifier:add(nn.LogSoftMax())

  local splitter = nn.Concat(2)
  splitter:add(main_branch):add(aux_classifier)
  local model = nn.Sequential():add(features):add(splitter)

  model.imageSize = 256
  model.imageCrop = 224

  local input = torch.rand(1,3,model.imageCrop,model.imageCrop)

  return model, input


end

models.vgg = function(modelType)
  -- taken from soumith's imagenet-multiGPU
  -- https://github.com/soumith/imagenet-multiGPU.torch/blob/master/models/vgg.lua

  local nClasses = 1000

  local modelType = modelType or 'A' -- on a titan black, B/D/E run out of memory even for batch-size 32

  -- Create tables describing VGG configurations A, B, D, E
  local cfg = {}
  if modelType == 'A' then
    cfg = {64, 'M', 128, 'M', 256, 256, 'M', 512, 512, 'M', 512, 512, 'M'}
  elseif modelType == 'B' then
    cfg = {64, 64, 'M', 128, 128, 'M', 256, 256, 'M', 512, 512, 'M', 512, 512, 'M'}
  elseif modelType == 'D' then
    cfg = {64, 64, 'M', 128, 128, 'M', 256, 256, 256, 'M', 512, 512, 512, 'M', 512, 512, 512, 'M'}
  elseif modelType == 'E' then
    cfg = {64, 64, 'M', 128, 128, 'M', 256, 256, 256, 256, 'M', 512, 512, 512, 512, 'M', 512, 512, 512, 512, 'M'}
  else
    error('Unknown model type: ' .. modelType .. ' | Please specify a modelType A or B or D or E')
  end

  local features = nn.Sequential()
  do
    local iChannels = 3;
    for k,v in ipairs(cfg) do
      if v == 'M' then
        features:add(nn.SpatialMaxPooling(2,2,2,2))
      else
        local oChannels = v;
        local conv3 = nn.SpatialConvolution(iChannels,oChannels,3,3,1,1,1,1);
        features:add(conv3)
        features:add(nn.ReLU(true))
        iChannels = oChannels;
      end
    end
  end

  local classifier = nn.Sequential()
  classifier:add(nn.View(512*7*7))
  classifier:add(nn.Linear(512*7*7, 4096))
  classifier:add(nn.Threshold(0, 1e-6))
--  classifier:add(nn.Dropout(0.5))
  classifier:add(nn.Linear(4096, 4096))
  classifier:add(nn.Threshold(0, 1e-6))
--  classifier:add(nn.Dropout(0.5))
  classifier:add(nn.Linear(4096, nClasses))
  classifier:add(nn.LogSoftMax())

  local model = nn.Sequential()
  model:add(features):add(classifier)
  model.imageSize = 256
  model.imageCrop = 224

  local input = torch.rand(1,3,model.imageCrop,model.imageCrop)

  return model, input
end

models.resnet = function(opt)
  -- taken from https://github.com/facebook/fb.resnet.torch
  local Convolution = nn.SpatialConvolution
  local Avg = nn.SpatialAveragePooling
  local ReLU = nn.ReLU
  local Max = nn.SpatialMaxPooling
  local SBatchNorm = function(n)
    local m = nn.MulConstant(1)
    m.inplace = nil
    return m
  end--nn.SpatialBatchNormalization

  local function createModel(opt)
    local depth = opt.depth
    local shortcutType = opt.shortcutType or 'B'
    local iChannels

    -- The shortcut layer is either identity or 1x1 convolution
    local function shortcut(nInputPlane, nOutputPlane, stride)
      local useConv = shortcutType == 'C' or
      (shortcutType == 'B' and nInputPlane ~= nOutputPlane)
      if useConv then
        -- 1x1 convolution
        return nn.Sequential()
        :add(Convolution(nInputPlane, nOutputPlane, 1, 1, stride, stride))
        :add(SBatchNorm(nOutputPlane))
      elseif nInputPlane ~= nOutputPlane then
        -- Strided, zero-padded identity shortcut
        return nn.Sequential()
        :add(nn.SpatialAveragePooling(1, 1, stride, stride))
        :add(nn.Concat(2)
        :add(nn.Identity())
        :add(nn.MulConstant(0)))
      else
        return nn.Identity()
      end
    end

    -- The basic residual layer block for 18 and 34 layer network, and the
    -- CIFAR networks
    local function basicblock(n, stride)
      local nInputPlane = iChannels
      iChannels = n

      local s = nn.Sequential()
      s:add(Convolution(nInputPlane,n,3,3,stride,stride,1,1))
      s:add(SBatchNorm(n))
      s:add(ReLU(true))
      s:add(Convolution(n,n,3,3,1,1,1,1))
      s:add(SBatchNorm(n))

      return nn.Sequential()
      :add(nn.ConcatTable()
      :add(s)
      :add(shortcut(nInputPlane, n, stride)))
      :add(nn.CAddTable(true))
      :add(ReLU(true))
    end

    -- The bottleneck residual layer for 50, 101, and 152 layer networks
    local function bottleneck(n, stride)
      local nInputPlane = iChannels
      iChannels = n * 4

      local s = nn.Sequential()
      s:add(Convolution(nInputPlane,n,1,1,1,1,0,0))
      s:add(SBatchNorm(n))
      s:add(ReLU(true))
      s:add(Convolution(n,n,3,3,stride,stride,1,1))
      s:add(SBatchNorm(n))
      s:add(ReLU(true))
      s:add(Convolution(n,n*4,1,1,1,1,0,0))
      s:add(SBatchNorm(n * 4))

      return nn.Sequential()
      :add(nn.ConcatTable()
      :add(s)
      :add(shortcut(nInputPlane, n * 4, stride)))
      :add(nn.CAddTable(true))
      :add(ReLU(true))
    end

    -- Creates count residual blocks with specified number of features
    local function layer(block, features, count, stride)
      local s = nn.Sequential()
      for i=1,count do
        s:add(block(features, i == 1 and stride or 1))
      end
      return s
    end

    local model = nn.Sequential()
    local input
    if opt.dataset == 'imagenet' then
      -- Configurations for ResNet:
      --  num. residual blocks, num features, residual block function
      local cfg = {
        [18]  = {{2, 2, 2, 2}, 512, basicblock},
        [34]  = {{3, 4, 6, 3}, 512, basicblock},
        [50]  = {{3, 4, 6, 3}, 2048, bottleneck},
        [101] = {{3, 4, 23, 3}, 2048, bottleneck},
        [152] = {{3, 8, 36, 3}, 2048, bottleneck},
      }

      assert(cfg[depth], 'Invalid depth: ' .. tostring(depth))
      local def, nFeatures, block = table.unpack(cfg[depth])
      iChannels = 64
      --print(' | ResNet-' .. depth .. ' ImageNet')

      -- The ResNet ImageNet model
      model:add(Convolution(3,64,7,7,2,2,3,3))
      model:add(SBatchNorm(64))
      model:add(ReLU(true))
      model:add(Max(3,3,2,2,1,1))
      model:add(layer(block, 64, def[1]))
      model:add(layer(block, 128, def[2], 2))
      model:add(layer(block, 256, def[3], 2))
      model:add(layer(block, 512, def[4], 2))
      model:add(Avg(7, 7, 1, 1))
      model:add(nn.View(nFeatures):setNumInputDims(3))
      model:add(nn.Linear(nFeatures, 1000))

      input = torch.rand(1,3,224,224)
    elseif opt.dataset == 'cifar10' then
      -- Model type specifies number of layers for CIFAR-10 model
      assert((depth - 2) % 6 == 0, 'depth should be one of 20, 32, 44, 56, 110, 1202')
      local n = (depth - 2) / 6
      iChannels = 16
      --print(' | ResNet-' .. depth .. ' CIFAR-10')

      -- The ResNet CIFAR-10 model
      model:add(Convolution(3,16,3,3,1,1,1,1))
      model:add(SBatchNorm(16))
      model:add(ReLU(true))
      model:add(layer(basicblock, 16, n))
      model:add(layer(basicblock, 32, n, 2))
      model:add(layer(basicblock, 64, n, 2))
      model:add(Avg(8, 8, 1, 1))
      model:add(nn.View(64):setNumInputDims(3))
      model:add(nn.Linear(64, 10))
      input = torch.rand(1,3,32,32)
    else
      error('invalid dataset: ' .. opt.dataset)
    end

    local function ConvInit(name)
      for k,v in pairs(model:findModules(name)) do
        local n = v.kW*v.kH*v.nOutputPlane
        v.weight:normal(0,math.sqrt(2/n))
        if false and cudnn.version >= 4000 then
          v.bias = nil
          v.gradBias = nil
        else
          v.bias:zero()
        end
      end
    end
    local function BNInit(name)
      for k,v in pairs(model:findModules(name)) do
        v.weight:fill(1)
        v.bias:zero()
      end
    end

    ConvInit('cudnn.SpatialConvolution')
    ConvInit('nn.SpatialConvolution')
    BNInit('fbnn.SpatialBatchNormalization')
    BNInit('cudnn.SpatialBatchNormalization')
    BNInit('nn.SpatialBatchNormalization')
    for k,v in pairs(model:findModules('nn.Linear')) do
      v.bias:zero()
    end

    if opt.cudnn == 'deterministic' then
      model:apply(function(m)
        if m.setMode then m:setMode(1,1,1) end
      end)
    end

    return model, input
  end

  return createModel(opt)
end

models.preresnet = function(opt)

  local Convolution = nn.SpatialConvolution
  local Avg = nn.SpatialAveragePooling
  local ReLU = nn.ReLU
  local Max = nn.SpatialMaxPooling
  local SBatchNorm = function(n)
    local m = nn.MulConstant(1)
    m.inplace = nil
    return m
  end--nn.SpatialBatchNormalization

  local function createModel(opt)
     local depth = opt.depth
     local shortcutType = opt.shortcutType or 'B'
     local iChannels

     -- The shortcut layer is either identity or 1x1 convolution
     local function shortcut(nInputPlane, nOutputPlane, stride)
        local useConv = shortcutType == 'C' or
           (shortcutType == 'B' and nInputPlane ~= nOutputPlane)
        if useConv then
           -- 1x1 convolution
           return nn.Sequential()
              :add(Convolution(nInputPlane, nOutputPlane, 1, 1, stride, stride))
        elseif nInputPlane ~= nOutputPlane then
           -- Strided, zero-padded identity shortcut
           return nn.Sequential()
              :add(nn.SpatialAveragePooling(1, 1, stride, stride))
              :add(nn.Concat(2)
                 :add(nn.Identity())
                 :add(nn.MulConstant(0)))
        else
           return nn.Identity()
        end
     end

     -- The basic residual layer block for 18 and 34 layer network, and the
     -- CIFAR networks
     local function basicblock(n, stride, type)
        local nInputPlane = iChannels
        iChannels = n

        local block = nn.Sequential()
        local s = nn.Sequential()
        if type == 'both_preact' then
           block:add(SBatchNorm(nInputPlane))
           block:add(ReLU(true))
        elseif type ~= 'no_preact' then
           s:add(SBatchNorm(nInputPlane))
           s:add(ReLU(true))
        end
        s:add(Convolution(nInputPlane,n,3,3,stride,stride,1,1))
        s:add(SBatchNorm(n))
        s:add(ReLU(true))
        s:add(Convolution(n,n,3,3,1,1,1,1))

        return block
           :add(nn.ConcatTable()
              :add(s)
              :add(shortcut(nInputPlane, n, stride)))
           :add(nn.CAddTable(true))
     end

     -- The bottleneck residual layer for 50, 101, and 152 layer networks
     local function bottleneck(n, stride, type)
        local nInputPlane = iChannels
        iChannels = n * 4

        local block = nn.Sequential()
        local s = nn.Sequential()
        if type == 'both_preact' then
           block:add(SBatchNorm(nInputPlane))
           block:add(ReLU(true))
        elseif type ~= 'no_preact' then
           s:add(SBatchNorm(nInputPlane))
           s:add(ReLU(true))
        end
        s:add(Convolution(nInputPlane,n,1,1,1,1,0,0))
        s:add(SBatchNorm(n))
        s:add(ReLU(true))
        s:add(Convolution(n,n,3,3,stride,stride,1,1))
        s:add(SBatchNorm(n))
        s:add(ReLU(true))
        s:add(Convolution(n,n*4,1,1,1,1,0,0))

        return block
           :add(nn.ConcatTable()
              :add(s)
              :add(shortcut(nInputPlane, n * 4, stride)))
           :add(nn.CAddTable(true))
     end

     -- Creates count residual blocks with specified number of features
     local function layer(block, features, count, stride, type)
        local s = nn.Sequential()
        if count < 1 then
          return s
        end
        s:add(block(features, stride,
                    type == 'first' and 'no_preact' or 'both_preact'))
        for i=2,count do
           s:add(block(features, 1))
        end
        return s
     end

     local model = nn.Sequential()
     local input
     if opt.dataset == 'imagenet' then
        -- Configurations for ResNet:
        --  num. residual blocks, num features, residual block function
        local cfg = {
           [18]  = {{2, 2, 2, 2}, 512, basicblock},
           [34]  = {{3, 4, 6, 3}, 512, basicblock},
           [50]  = {{3, 4, 6, 3}, 2048, bottleneck},
           [101] = {{3, 4, 23, 3}, 2048, bottleneck},
           [152] = {{3, 8, 36, 3}, 2048, bottleneck},
           [200] = {{3, 24, 36, 3}, 2048, bottleneck},
        }

        assert(cfg[depth], 'Invalid depth: ' .. tostring(depth))
        local def, nFeatures, block = table.unpack(cfg[depth])
        iChannels = 64
        --print(' | ResNet-' .. depth .. ' ImageNet')

        -- The ResNet ImageNet model
        model:add(Convolution(3,64,7,7,2,2,3,3))
        model:add(SBatchNorm(64))
        model:add(ReLU(true))
        model:add(Max(3,3,2,2,1,1))
        model:add(layer(block, 64,  def[1], 1, 'first'))
        model:add(layer(block, 128, def[2], 2))
        model:add(layer(block, 256, def[3], 2))
        model:add(layer(block, 512, def[4], 2))
        model:add(nn.Copy(nil, nil, true))
        model:add(SBatchNorm(iChannels))
        model:add(ReLU(true))
        model:add(Avg(7, 7, 1, 1))
        model:add(nn.View(nFeatures):setNumInputDims(3))
        model:add(nn.Linear(nFeatures, 1000))

        input = torch.rand(1,3,224,224)
     elseif opt.dataset == 'cifar10' then
        -- Model type specifies number of layers for CIFAR-10 model
        assert((depth - 2) % 6 == 0, 'depth should be one of 20, 32, 44, 56, 110, 1202')
        local n = (depth - 2) / 6
        iChannels = 16
        --print(' | ResNet-' .. depth .. ' CIFAR-10')

        -- The ResNet CIFAR-10 model
        model:add(Convolution(3,16,3,3,1,1,1,1))
        model:add(layer(basicblock, 16, n, 1))
        model:add(layer(basicblock, 32, n, 2))
        model:add(layer(basicblock, 64, n, 2))
        model:add(nn.Copy(nil, nil, true))
        model:add(SBatchNorm(iChannels))
        model:add(ReLU(true))
        model:add(Avg(8, 8, 1, 1))
        model:add(nn.View(64):setNumInputDims(3))
        model:add(nn.Linear(64, 10))

        input = torch.rand(1,3,32,32)
     else
        error('invalid dataset: ' .. opt.dataset)
     end

     local function ConvInit(name)
        for k,v in pairs(model:findModules(name)) do
           local n = v.kW*v.kH*v.nOutputPlane
           v.weight:normal(0,math.sqrt(2/n))
           if false and cudnn.version >= 4000 then
              v.bias = nil
              v.gradBias = nil
           else
              v.bias:zero()
           end
        end
     end
     local function BNInit(name)
        for k,v in pairs(model:findModules(name)) do
           v.weight:fill(1)
           v.bias:zero()
        end
     end

     --ConvInit('cudnn.SpatialConvolution')
     ConvInit('nn.SpatialConvolution')
     --BNInit('fbnn.SpatialBatchNormalization')
     --BNInit('cudnn.SpatialBatchNormalization')
     BNInit('nn.SpatialBatchNormalization')
     for k,v in pairs(model:findModules('nn.Linear')) do
        v.bias:zero()
     end
     --model:cuda()

     if opt.cudnn == 'deterministic' then
        model:apply(function(m)
           if m.setMode then m:setMode(1,1,1) end
        end)
     end

     --model:get(1).gradInput = nil

     return model, input
  end

  return createModel(opt)

end


return models
