require("castle.ecs.ecshelpers")
local G = love.graphics

-- Draw function that uses the named entity "viewport" and its viewport component
-- to transform the graphics context around the remainder of the drawing systems.
-- Note this draw system accepts the optional 3rd argument which hints the system loader
-- that this system wants control over the execution timing of the draw system(s) that follow it.
return function(estore, res, mainDrawFunc)
  -- viewport entity must have a "name" comp where name=="viewport",
  -- and singular "pos" and "rect" components.
  local viewport = estore:getEntityByName("viewport")
  if viewport then
    -- Transform the view
    local sx = viewport.viewport.sx
    local sy = viewport.viewport.sy

    G.push()
    G.scale(sx, sy)

    -- (viewport rect offsets were calc'd based on actual window size, they need to be manually accounted for here as we pretend to use a viewport rect that counts the scaled pixes)
    local tx = -viewport.pos.x - (viewport.rect.offx / sx)
    local ty = -viewport.pos.y - (viewport.rect.offy / sy)
    -- local tx = viewport.pos.x
    -- local ty = viewport.pos.y
    G.translate(tx, ty)
  end

  -- Invoke the subordinate draw systems, while we've got the world transformed
  mainDrawFunc(estore, res)

  if viewport then
    -- un-transform the view
    G.pop()
  end
end

