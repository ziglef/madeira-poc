require "startup"

function love.load()
    startupWindow()
    bgImg, bgQuad = startupBackground()
    fruitAtlas, fruitQuads = startupFruit()
end

function love.draw()
    -- Adapt to each screen's dpi
    love.graphics.scale(Scale, Scale)

    -- Draw background
    love.graphics.draw(bgImg, bgQuad, 0, 0)

    -- Draw fruit
    for i = 1, #fruitQuads do
        love.graphics.draw(fruitAtlas, fruitQuads[i], (i-1)*32, 0)
    end
end