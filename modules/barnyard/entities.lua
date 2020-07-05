local Debug = require("mydebug").sub("barnyard_entities")
local Comp = require "castle.components"
local Estore = require "castle.ecs.estore"

local G = love.graphics

local E = {}

function E.initialEntities(res)
  -- Debug.println("debug settings: " .. inspect(res.settings.debug))

  local estore = Estore:new()

  local root = E.zooKeeper(estore, res)
  E.floor(estore, res)

  local spawners = {
    {
      text = "Pig",
      kind = "pig",
      color = {1, 0.647, 0.659}, -- pink
    },
    {text = "Sheep", kind = "sheep", color = {1, 1, 1}},
    {
      text = "Bunny",
      kind = "bunny",
      color = {0.45, 0.18, 0.60}, -- purple
    },
    {
      text = "Cow",
      kind = "cow",
      color = {0.097, 0.051, 0.051}, -- cow spot grey
    },
    {
      text = "Dog",
      kind = "dog",
      color = {0.341, 0.176, 0.067}, -- dark brown
    },
    {
      text = "Cat",
      kind = "cat",
      color = {0.659, 0.431, 0.282}, -- brown
    },
    {
      text = "Chicken",
      kind = "chicken",
      color = {0.894, 0.333, 0.078}, -- red
    },
  }

  local x = 30
  local upDown = true
  for _, sp in ipairs(spawners) do
    if upDown then
      y = 50
    else
      y = 150
    end
    sp.x = x
    sp.y = y
    E.animalSpawner(root, sp, res)
    upDown = not upDown
    x = x + 120
  end

  return estore
end

function E.zooKeeper(estore, res)
  local bgmusicState = res.settings.dev.bgmusic and 'playing' or 'paused'

  return estore:newEntity({
    {'name', {name = "name"}},
    {'tag', {name = "zookeeper"}},
    {'pic', {id = 'zoo_keeper', sx = 1, sy = 1.05}}, -- zoo_keeper.png is 731px tall, we want to stretch it to 768
    {'pos', {}},
    {'sound', {state = bgmusicState, sound = 'farm_music', loop = true}},
    {'physicsWorld', {gy = 9.8 * 64, allowSleep = false}},
  })
end

function E.floor(estore, res)
  return estore:newEntity({
    {'name', {name = "floor"}},
    {'tag', {name = 'floor'}},
    {'body', {debugDraw = true, dynamic = false}},
    {'rectangleShape', {w = 1024, h = 50}},
    {'pos', {x = 512, y = 785}},
  })
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
function E.animalSpawner(parent, opts, res)
  -- Comp.define("label", {'text','Label', 'color', {0,0,0},'font',nil, 'width', nil, 'align',nil, 'height',nil,'valign',nil,'offx',0,'offy',0,'debugonly',false})
  return parent:newEntity({
    {'tag', {name = "animalSpawner"}},
    {'pos', {x = opts.x, y = opts.y}},
    {
      'label',
      {
        text = opts.text,
        color = opts.color,
        width = 200,
        height = 50,
        align = "center",
        valign = "middle",
        shadowcolor = {0, 0, 0, 0.5},
        shadowx = 3,
        shadowy = 3,
        font = 'cartoon_medium',
        debugdraw = res.settings.dev.buttonBoxes,
      },
    },
    {'animalspawner', {kind = opts.kind}},
  })
end

return E
