return {
  {
    type = "ecs",
    name = "main",
    data = {
      entities = {datafile = "modules/barnyard/entities.lua"},
      components = {datafile = "modules/barnyard/components.lua"},
      systems = {datafile = "modules/barnyard/systems.lua"},
      drawSystems = {datafile = "modules/barnyard/drawSystems.lua"},
    },
  },
  -- {
  --   type = "settings",
  --   name = "mydebug",
  --   datafile = "modules/barnyard/mydebug.settings.lua",
  -- },
  {type = "settings", name = "barnyard", data = {}},
  {
    type = "pic",
    name = "zoo_keeper",
    data = {path = "modules/barnyard/images/zoo_keeper.png"},
  },
  {
    type = "pic",
    name = "pig",
    data = {path = "modules/barnyard/images/pig.png"},
  },
  {
    type = "sound",
    name = "farm_music",
    data = {file = "modules/barnyard/sounds/music.wav", type = "music"},
  },
  {
    type = "sound",
    name = "pig",
    data = {
      file = "modules/barnyard/sounds/pig.wav",
      type = "sound",
      volume = 0.5,
    },
  },
}
