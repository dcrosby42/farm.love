local Castle = require "vendor/castle/main"

Castle.module_name = "modules/barnyard"
Castle.onload = function()
  love.window.setMode(1024, 768, {
    fullscreen = false,
    resizable = false,
    highdpi = false,
    -- minwidth = 400,
    -- minheight = 300,
  })
end
