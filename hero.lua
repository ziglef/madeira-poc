local still = true
local movSpeed = 0.5

function love.load()
    animation = newAnimation(love.graphics.newImage("hero/down.png"), 16, 16, movSpeed)
end

function love.update(dt)
    animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
end

function love.draw()
    if still then
        spriteNum = 1
    else
        spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    end
    
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], 0, 0, 0, 4)
end

function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    animation.duration = duration or 1
    animation.currentTime = 0

    return animation
end

function love.keypressed(key)
    still = false
    if key == 'up' then
        animation = newAnimation(love.graphics.newImage("hero/up.png"), 16, 16, movSpeed)
    elseif key == 'down'  then
        animation = newAnimation(love.graphics.newImage("hero/down.png"), 16, 16, movSpeed)
    elseif key == 'right'  then
        animation = newAnimation(love.graphics.newImage("hero/right.png"), 16, 16, movSpeed)
    elseif key == 'left'  then
        animation = newAnimation(love.graphics.newImage("hero/left.png"), 16, 16, movSpeed)
    end
end

function love.keyreleased(key)
    if key == 'up' then
        still = true
    elseif key == 'down'  then
        still = true
    elseif key == 'right'  then
        still = true
    elseif key == 'left'  then
        still = true
    end
 end