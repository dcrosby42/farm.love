local ResourceLoader = require 'castle.resourceloader'

local M = {}

M.newWorld = function(modules)
  local w = {}

  w.instances = map(modules, function(module)
    return memoize0(function()
      local state = module.newWorld()
      return {module = module, state = state}
    end)
  end)
  w.current = 1

  return w
end

M.updateWorld = function(w, action)
  if action.type == "castle.switcher" then w.current = action.index end

  local inst = w.instances[w.current]() -- gets or creates-on-demand an instance of the module at the current index
  inst.state, sidefx = inst.module.updateWorld(inst.state, action)
  -- handleSidefx(w, sidefx)

  return w, sidefx
end

M.drawWorld = function(w)
  local inst = w.instances[w.current]()
  inst.module.drawWorld(inst.state)
end

return M
