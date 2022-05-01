require "tileset"

function love.load()
    -- Setup game window
    love.window.setTitle("Madeira PoC")
    local game_width = 640
    local game_height = 480
    scale = 1
    local offset = 0.8
    local screen_width, screen_height = love.window.getDesktopDimensions()
    local width_scale = screen_width / game_width
    local height_scale = screen_height / game_height

    if width_scale < height_scale then
        scale = width_scale
    else
        scale = height_scale
    end

    scale = scale * offset

    love.window.setMode(game_width * scale, game_height * scale, {fullscreen = false, fullscreentype = "desktop", resizable = false, borderless = false, vsync = true})

    -- Load fruit
    fruit_atlas, fruit_quads = load_tileset("assets/food.png", 32, 32)
    
    -- Load grass
    grass_img = love.graphics.newImage("assets/grass.png")
    grass_img:setWrap("repeat", "repeat")
    grass_quad = love.graphics.newQuad(0, 0, 1024, 768, grass_img:getWidth(), grass_img:getHeight())
end

function love.draw()
    -- Adapt to each screen's dpi
    love.graphics.scale(scale, scale)
    
    -- Draw background
    love.graphics.draw(grass_img, grass_quad, 0, 0)

    -- Draw fruit
    for i = 1, #fruit_quads do
        love.graphics.draw(fruit_atlas, fruit_quads[i], (i-1)*32, 0)
    end
end