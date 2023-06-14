--function love.load()
    --print("game loaded")
--end

----------2---------
push = require 'push'         --3--

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

player_x = 320
player_y = 100

player2_x = 80
player2_y = 100

function love.load()
    love.graphics.setFont(love.graphics.newFont('8-bit-pusab.ttf', 16))
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

----------3----------
function love.keypressed(key)
    if key=='escape' then
        love.event.quit()
    end
end

function love.update()
    if love.keyboard.isDown('w') then
             player_y = player_y - 5
    elseif love.keyboard.isDown('s') then
        player_y = player_y + 5
    end

    if love.keyboard.isDown('a') then
        player_x = player_x - 5
    elseif love.keyboard.isDown('d') then
        player_x = player_x + 5
    end

    if love.keyboard.isDown('right') then
        player2_x= player2_x + 5
    elseif love.keyboard.isDown('left') then
        player2_x=player2_x - 5
    end

    if love.keyboard.isDown('up') then
        player2_y= player2_y - 5
    elseif love.keyboard.isDown('down') then
        player2_y=player2_y + 5
    end
end
   

function love.draw()
    push:start()
    love.graphics.clear(1/255,0/255,40/255, 255/255)

    
    love.graphics.line(VIRTUAL_WIDTH/2-6,0,VIRTUAL_WIDTH/2-6,720)
    
    love.graphics.printf(
        'New Game',
        0,
        VIRTUAL_HEIGHT-60,  
        VIRTUAL_WIDTH,
        'center')
    love.graphics.rectangle('fill', player_x,player_y,20,20)
    love.graphics.rectangle('fill', player2_x, player2_y,20,20)
    
    push:finish()
    

end