local Debug = require("mydebug").sub("hayride_entities", true, true)
local Estore = require "castle.ecs.estore"

local G = love.graphics

local E = {}

function E.initialEntities(res)
  local estore = Estore:new()

  estore:newEntity({
    {'pos', {x = 200, y = 200}},
    {
      'label',
      {
        text = "Hayride!",
        color = {1, 1, 0},
        width = 200,
        height = 50,
        align = "center",
        valign = "middle",
        shadowcolor = {0, 0, 0, 0.5},
        shadowx = 3,
        shadowy = 3,
        font = 'cartoon_medium',
      },
    },
  })

  return estore
end

return E
