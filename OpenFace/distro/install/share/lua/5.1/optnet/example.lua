optnet = require 'optnet'
generateGraph = require 'optnet.graphgen'
models = require 'optnet.models'

modelname = 'googlenet'
net, input = models[modelname]()

graphOpts = {
displayProps =  {shape='box',fontsize=10, style='solid'},
nodeData = function(oldData, tensor)
  return oldData .. '\n' .. 'Size: '.. tensor:numel()
end
}

g = generateGraph(net, input, graphOpts)
graph.dot(g, modelname, modelname)

optnet.optimizeMemory(net, input)

g = generateGraph(net, input, graphOpts)
graph.dot(g, modelname..'_optimized', modelname..'_optimized')
