local Debug = require('mydebug').sub('barnyard.dev', true, true)
local inspect = require 'inspect'
local EventHelpers = require 'castle.systems.eventhelpers'

local function toggleBgMusic(estore)
  local e = estore:findEntity(hasName('zookeeper'))
  if e.sound.state == 'playing' then
    e.sound.state = 'paused'
  else
    e.sound.state = 'playing'
  end
end

return function(estore, input, res)
  EventHelpers.handle(input.events, 'keyboard', {
    pressed = function(evt)
      if (evt.key == 'm') then toggleBgMusic(estore) end
    end,
  })
end
