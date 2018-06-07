local optnet = require 'optnet.env'
local utils = require 'optnet.utils'
local keepTrack = utils.keepTrack

function optnet.countUsedMemory(net)
  local tensors = {outputs={},buffers={},params={},gradInputs={}}
  local function entry_fun(t)
    return t
  end
  local function count_func(self)
    keepTrack(self.output, tensors.outputs, entry_fun)
    keepTrack(self.gradInput, tensors.gradInputs, entry_fun)
    for k, v in pairs(self) do
      if torch.isTensor(v) and
        k ~= 'weight' and k ~= 'bias' and
        k ~= 'gradWeight' and k ~= 'gradBias' and
        k ~= 'output' and k ~= 'gradInput' then
        keepTrack(v, tensors.buffers, entry_fun)
      end
    end
    for _, k in ipairs({'weight', 'bias', 'gradWeight','gradBias'}) do
      if self[k] then
        keepTrack(self[k], tensors.params, entry_fun)
      end
    end
  end
  net:apply(count_func)
  local total_size = 0
  local sizes = {}
  for typeTensor, subTensors in pairs(tensors) do
    sizes[typeTensor] = 0
    for k,v in pairs(subTensors) do
      local size = v:storage():size()*v:elementSize()
      total_size = total_size + size
      sizes[typeTensor] = sizes[typeTensor] + size
    end
  end
  sizes.total_size = total_size
  return sizes
end
