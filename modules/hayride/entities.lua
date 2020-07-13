local Debug = require("mydebug").sub("hayride_entities", true, true)
local Estore = require "castle.ecs.estore"

local G = love.graphics

local E = {}

function E.initialEntities(res)
  local estore = Estore:new()

  local bg = E.background(estore, res)
  E.floor(bg, res)
  E.animal(bg, 'pig', res)
  E.tractor(bg)

  return estore
end

function E.background(estore, res)
  local bgmusicState = res.settings.dev.bgmusic and 'playing' or 'paused'

  local bg = estore:newEntity({
    -- {'pic', {id = 'zoo_keeper', sx = 1, sy = 1.05}}, -- zoo_keeper.png is 731px tall, we want to stretch it to 768
    {'pos', {x = 0, y = 0}},
    {'physicsWorld', {gy = 9.8 * 64, allowSleep = false}},
    {'sound', {state = bgmusicState, sound = 'tractor_music', loop = true}},
  })

  bg:newEntity({
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

function E.tractor(parent, res)
  local x = 400
  local y = 400

  local backWheel = parent:newEntity({
    {'name', {name = "tractor_back_wheel"}},
    -- {'pic', {id = 'sheep', sx = 0.5, sy = 0.5, centerx = 0.5, centery = 0.5}},
    {'pos', {x = x - 50, y = y + 20}},
    {'vel', {}},
    {'body', {debugDraw = true}},
    {'force', {}},
    {'circleShape', {radius = 100}},
    -- {
    --   'joint',
    --   {
    --     kind = 'wheel',
    --     toEntity = body.eid,
    --     motorspeed = 0,
    --     maxmotorforce = 0,
    --   },
    -- },
  })

  local tractorBody = parent:newEntity({
    {'name', {name = "tractor_body"}},
    -- {'pic', {id = 'sheep', sx = 0.5, sy = 0.5, centerx = 0.5, centery = 0.5}},
    {'pos', {x = x, y = y}},
    {'vel', {}},
    {'body', {debugDraw = true}},
    {'force', {}},
    {'rectangleShape', {x = 0, y = 0, w = 200, h = 100}},
    -- {
    --   'joint',
    --   {
    --     kind = 'wheel',
    --     toEntity = backWheel.eid,
    --     -- motorspeed = 0,
    --     -- maxmotorforce = 0,
    --     docollide = false,
    --   },
    -- },
  })

  -- local frontWheel = parent:newEntity({
  --   {'name', {name = "tractor_front_wheel"}},
  --   {'tag', {name = ""}},
  --   {'pic', {id = 'sheep', sx = 0.5, sy = 0.5, centerx = 0.5, centery = 0.5}},
  --   {'pos', {x = x, y = y}},
  --   {'vel', {}},
  --   {'body', {debugDraw = true}},
  --   {'force', {}},
  --   {'circleShape', {radius = 25}},
  --   -- {
  --   --   'joint',
  --   --   {
  --   --     kind = 'wheel',
  --   --     toEntity = body.eid,
  --   --     motorspeed = 0,
  --   --     maxmotorforce = 0,
  --   --   },
  --   -- },
  -- })

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

function E.floor(parent, res)
  return parent:newEntity({
    {'name', {name = "floor"}},
    {'tag', {name = 'floor'}},
    {'body', {debugDraw = true, dynamic = false}},
    {'rectangleShape', {w = 1024, h = 50}},
    {'pos', {x = 512, y = 785}},
  })
end

return E
