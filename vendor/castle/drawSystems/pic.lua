local DrawPic = require('castle.drawSystems.picfunctions')
return function(estore, res)
  estore:walkEntities(nil, function(e)
    if e.pic and e.pos then DrawPic.drawPics(e, res) end
    if e.anim and e.pos then DrawPic.drawAnims(e, res) end
  end)
end

