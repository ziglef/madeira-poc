
local newAnimation

Hero = {
    still = true,
    animation = nil,
    duration = 1
}

function Hero:load()
    -- Load tiles for each direction
    upAnimation = newAnimation(love.graphics.newImage("assets/hero/up.png"), 16, 16, self.duration)
    downAnimation = newAnimation(love.graphics.newImage("assets/hero/down.png"), 16, 16, self.duration)
    rightAnimation = newAnimation(love.graphics.newImage("assets/hero/right.png"), 16, 16, self.duration)
    leftAnimation = newAnimation(love.graphics.newImage("assets/hero/left.png"), 16, 16, self.duration)

    -- Init hero with down animation
    self.animation = downAnimation
end

function Hero:update(dt, duration)
    self.duration = duration or 1

    -- Change animation on keypress
    if love.keyboard.isDown("up") then
        self.still = false
        self.animation = upAnimation
    elseif love.keyboard.isDown("down") then
        self.still = false
        self.animation = downAnimation
    elseif love.keyboard.isDown("left") then
        self.still = false
        self.animation = leftAnimation
    elseif love.keyboard.isDown("right") then
        self.still = false
        self.animation = rightAnimation
    else
        self.still = true
    end

    self.animation.currentTime = self.animation.currentTime + dt
    if self.animation.currentTime >= self.animation.duration then
        self.animation.currentTime = self.animation.currentTime - self.animation.duration
    end
end

function Hero:draw()
    local spriteNum = 1
    if not self.still then
        spriteNum = math.floor(self.animation.currentTime / self.animation.duration * #self.animation.quads) + 1
    end

    love.graphics.draw(self.animation.spriteSheet, self.animation.quads[spriteNum], 0, 0, 0, 4)
end

newAnimation = function(image, width, height, duration)
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