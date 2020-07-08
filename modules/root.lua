local modules = {require('modules.barnyard'), require('modules.hayride')}

local Switcher = require('modules.switcher')
local inspect = require('inspect')

local M = {}

function M.newWorld()
  local w = {}
  w.switcher = Switcher.newWorld(modules)
  return w
end

function M.updateWorld(w, action)
  if action.type == "keyboard" and action.state == "pressed" then
    if action.key == "f1" then
      action = {type = "castle.switcher", index = 1}
    elseif action.key == "f2" then
      action = {type = "castle.switcher", index = 2}
    end
  end

  w.switcher, sidefx = Switcher.updateWorld(w.switcher, action)

  return w, sidefx
end

function M.drawWorld(w)
  Switcher.drawWorld(w.switcher)
end

return M
