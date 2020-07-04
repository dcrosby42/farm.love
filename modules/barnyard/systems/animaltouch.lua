local Debug = require('mydebug').sub('animaltouch', true, true)
local EventHelpers = require 'castle.systems.eventhelpers'
local Entities = require 'modules.barnyard.entities'
local inspect = require 'inspect'

local FlingFactorX = 10
local FlingFactorY = 10

local function touchEventToComponent(evt)
  return {
    touchid = evt.id,
    startx = evt.x,
    starty = evt.y,
    lastx = evt.x,
    lasty = evt.y,
    dx = evt.dx or 0,
    dy = evt.dy or 0,
  }
end

local function updateTouchComponent(comp, evt)
  comp.lastx = evt.x
  comp.lasty = evt.y
  comp.dx = evt.dx or 0
  comp.dy = evt.dy or 0
end

local function addSound(e, name, res)
  if not name then return end
  local cfg = res.sounds[name]
  if cfg then
    return e:newComp('sound', {sound = name, volume = cfg.volume or 1})
  else
    Debug.println("(No sound for " .. tostring(name) .. ")")
    return nil
  end
end

return function(estore, input, res)
  EventHelpers.handle(input.events, 'touch', {
    -- Touch pressed
    pressed = function(touch)
      -- First, see if we touched an animal
      local hit
      estore:seekEntity(hasTag('animal'), function(e)
        if dist(touch.x, touch.y, e.pos.x, e.pos.y) <= 70 then
          hit = e
          return true
        end
      end)
      local e = hit
      local animalName

      -- if not e then
      --   -- Nothing.  Let's generate a random animal
      --   animalName = pickRandom(res.animalNames)
      --   e = Entities.animal(estore, res, animalName)
      -- else
      --   if e.pic then animalName = e.pic.id end
      -- end

      if e then
        -- slightly enlarge the animal image (normally it's 0.5)
        vis = e.anim or e.pic
        vis.sx = 0.7
        vis.sy = 0.7
        e.pos.x = touch.x
        e.pos.y = touch.y
        e:newComp('touch', touchEventToComponent(touch))

        -- Try to add a sound for this animal
        addSound(e, e.pic.id, res) -- assumes the pic has same name as its sound
      end

    end,

    -- Touch dragged
    moved = function(touch)
      -- Find the entity having a touch component that matches the id of this touch event
      estore:walkEntities(hasComps('touch', 'pos'), function(e)
        if e.touch.touchid == touch.id then
          -- Move the entity where the touch is moving
          e.pos.x = touch.x
          e.pos.y = touch.y
          e.vel.dx = 0
          e.vel.dy = 0
          updateTouchComponent(e.touch, touch)
        end
      end)
    end,

    -- End of touch
    released = function(touch)
      estore:walkEntities(hasComps('touch', 'pos'), function(e)
        if e.touch.touchid == touch.id then
          e.pos.x = touch.x
          e.pos.y = touch.y
          e.vel.dx = (e.touch.dx or 0) * FlingFactorX
          e.vel.dy = (e.touch.dy or 0) * FlingFactorY
          local comp = e.anim or e.pic
          comp.sx = 0.5
          comp.sy = 0.5
          e:removeComp(e.touch)
        end
      end)
    end,

  })
end
