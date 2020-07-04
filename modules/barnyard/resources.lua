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
    type = "pic",
    name = "sheep",
    data = {path = "modules/barnyard/images/sheep.png"},
  },
  {
    type = "pic",
    name = "dog",
    data = {path = "modules/barnyard/images/dog.png"},
  },
  {
    type = "pic",
    name = "cat",
    data = {path = "modules/barnyard/images/cat.png"},
  },
  {
    type = "pic",
    name = "cow",
    data = {path = "modules/barnyard/images/cow.png"},
  },
  {
    type = "pic",
    name = "bunny",
    data = {path = "modules/barnyard/images/bunny.png"},
  },
  {
    type = "pic",
    name = "chicken",
    data = {path = "modules/barnyard/images/chicken.png"},
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
  {
    type = "sound",
    name = "sheep",
    data = {
      file = "modules/barnyard/sounds/sheep.wav",
      type = "sound",
      volume = 1,
    },
  },
  {
    type = "sound",
    name = "cow",
    data = {
      file = "modules/barnyard/sounds/cow.wav",
      type = "sound",
      volume = 1,
    },
  },
  {
    type = "sound",
    name = "cat",
    data = {
      file = "modules/barnyard/sounds/cat.wav",
      type = "sound",
      volume = 1,
    },
  },
  {
    type = "font",
    name = "cartoon",
    data = {
      file = "modules/barnyard/fonts/LuckiestGuy.ttf",
      choices = {{name = "small", size = 24}, {name = "medium", size = 48}},
    },
  },
}
