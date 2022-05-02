require "tileset"

function startupWindow()
    -- Setup game window
    love.window.setTitle("Madeira PoC")
    local gameWidth = 640
    local gameHeight = 480
    Scale = 1
    local offset = 0.8
    local screenWidth, screenHeight = love.window.getDesktopDimensions()
    local widthScale = screenWidth / gameWidth
    local heightScale = screenHeight / gameHeight

    if widthScale < heightScale then
        Scale = widthScale
    else
        Scale = heightScale
    end

    Scale = Scale * offset

    love.window.setMode(
        gameWidth * Scale,
        gameHeight * Scale,
        {
            fullscreen = false,
            fullscreentype = "desktop",
            resizable = false,
            borderless = false,
            vsync = true
        }
    )
end

function startupBackground()
    -- Load grass
    local bgImg = love.graphics.newImage("assets/grass.png")
    bgImg:setWrap("repeat", "repeat")
    local bgQuad = love.graphics.newQuad(0, 0, 640, 480, bgImg:getWidth(), bgImg:getHeight())

    return bgImg, bgQuad
end

function startupFruit()
    -- Load fruit
    return loadTileset("assets/food.png", 32, 32)
end
