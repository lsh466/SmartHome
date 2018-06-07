local utils = {}

local function keepTrack(t, track, entry_fun, fun, ...)
  if torch.isTensor(t) and t:storage() then
    local ptr = torch.pointer(t:storage())
    if not track[ptr] then
      track[ptr] = entry_fun(t, ...)
    end
    if fun then
      fun(t,track,...)
    end
    return
  end
  if torch.type(t) == 'table' then
    for k, v in ipairs(t) do
      keepTrack(v, track, entry_fun, fun, ...)
    end
  end
end
utils.keepTrack = keepTrack

local function recursiveClone(out)
  if torch.isTensor(out) then
    return out:clone()
  else
    local res = {}
    for k, v in ipairs(out) do
      res[k] = recursiveClone(v)
    end
    return res
  end
end
utils.recursiveClone = recursiveClone

local function copyTable(t)
  if type(t) == 'table' then
    local r = {}
    for k, v in pairs(t) do
      r[k] = copyTable(v)
    end
    return r
  else
    return t
  end
end
utils.copyTable = copyTable

return utils
