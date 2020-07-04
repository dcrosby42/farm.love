local Debug = require("mydebug").sub("barnyard_entities")
local Comp = require "castle.components"
local Estore = require "castle.ecs.estore"

local G = love.graphics

local E = {}

function E.initialEntities(res)
  -- Debug.println("debug settings: " .. inspect(res.settings.debug))

  local estore = Estore:new()
  local root = E.zooKeeper(estore, res)
  local pig = E.pig(root, res)
  pig.pos.x = 150
  pig.pos.y = 150

  return estore
end

function E.zooKeeper(estore, res)
  return estore:newEntity({
    {'name', {name = "name"}},
    {'tag', {name = "zookeeper"}},
    {'pic', {id = 'zoo_keeper', sx = 1, sy = 1.05}}, -- zoo_keeper.png is 731px tall, we want to stretch it to 768
    {'pos', {}},
    {'sound', {sound = 'farm_music',loop = true}},
    -- {'physicsWorld', {gy = 9.8 * 64, allowSleep = false}},
  })
end

function E.pig(parent, res)
  return E.animal(parent, 'pig', kind)
end

function E.animal(parent, kind, res)
  return parent:newEntity({
    {'tag', {name = "animal"}},
    {'pic', {id = kind, sx = 0.5, sy = 0.5, centerx = 0.5, centery = 0.5}},
    {'pos', {}},
    {'vel', {}},
    {'body', {}},
    {'force', {}},
    {'circleShape', {radius = 50}},
  })
end

return E
