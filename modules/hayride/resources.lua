return {
  {
    type = "ecs",
    name = "main",
    data = {
      entities = {datafile = "modules/hayride/entities.lua"},
      components = {datafile = "modules/hayride/components.lua"},
      systems = {datafile = "modules/hayride/systems.lua"},
      drawSystems = {datafile = "modules/hayride/drawSystems.lua"},
    },
  },
  {
    type = "settings",
    name = "dev",
    data = {bgmusic = false, buttonBoxes = false},
  },
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
    name = "tractor_music",
    data = {
      file = "modules/barnyard/sounds/Pincushion.mp3",
      type = "music",
      volume = 0.7,
    },
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
      volume = 0.7,
    },
  },
  {
    type = "sound",
    name = "cat",
    data = {
      file = "modules/barnyard/sounds/cat1.wav",
      type = "sound",
      volume = 0.8,
    },
  },
  {
    type = "sound",
    name = "dog",
    data = {
      file = "modules/barnyard/sounds/woofwoof.wav",
      type = "sound",
      volume = 1,
    },
  },
  {
    type = "sound",
    name = "chicken",
    data = {
      file = "modules/barnyard/sounds/chicken.wav",
      type = "sound",
      volume = 1,
    },
  },
  {
    type = "sound",
    name = "bunny",
    data = {
      file = "modules/barnyard/sounds/boing1.wav",
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
