local Debug = require('mydebug').sub('animaltouch', true, true)
local EventHelpers = require 'castle.systems.eventhelpers'
local E = require 'modules.barnyard.entities'
local inspect = require 'inspect'
local Touch = require 'castle.ecs.touch'
local Sound = require 'castle.ecs.sound'

local FlingFactorX = 10
local FlingFactorY = 10

local function hitButton(e, touchEvt)
  -- This entity is assumed to be an animal spawner which means 
  -- we can assume: label, label height and width, and center/middle alignment.
  local cx = e.pos.x + (e.label.width / 2)
  local cy = e.pos.y + (e.label.height / 2)
  local range = 70
  return (dist(touchEvt.x, touchEvt.y, cx, cy) <= range)
end

return function(estore, input, res)
  EventHelpers.handle(input.events, 'touch', {
    -- Touch pressed
    pressed = function(touch)
      -- First, see if we touched an animal
      local hit
      estore:seekEntity(hasComps('animalspawner'), function(e)
        if hitButton(e, touch) then
          hit = e
          return true -- end seek
        end
      end)

      -- if dist(touch.x, touch.y, e.pos.x, e.pos.y) <= 70 then
      --   hit = e
      --   return true
      -- end
      -- end)
      if hit then
        local e = hit
        -- Touch.newComponent(e, touch)
        local kind = e.animalspawner.kind
        local animal = E.animal(e:getParent(), kind, res)
        local cx = e.pos.x + (e.label.width / 2)
        local cy = e.pos.y + (e.label.height / 2)
        animal.pos.x = cx
        animal.pos.y = cy
        animal.pic.sx = 0.7 -- magnify because the animal is "picked up"
        animal.pic.sy = 0.7
        Sound.newComponent(animal, kind, res)
        Touch.newComponent(animal, touch)
        return true
      end
    end,

    -- Touch dragged
    -- moved = function(touch)
    --   -- Find the entity having a touch component that matches the id of this touch event
    --   estore:walkEntities(hasComps('touch', 'pos'), function(e)
    --     if e.touch.touchid == touch.id then
    --       Touch.updateComponent(e.touch, touch)
    --     end
    --   end)
    -- end,

    -- End of touch
    -- released = function(touch)
    --   estore:walkEntities(hasComps('touch', 'pos'), function(e)
    --     if e.touch.touchid == touch.id then
    --       e:removeComp(e.touch)
    --     end
    --   end)
    -- end,

  })
end
