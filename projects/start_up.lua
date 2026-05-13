-- main startup page

-- initialize variables
function _init()
 mode="start"
 set_stars() -- give stars property
end

-- handles actions
function _update()
	state_update()
	animate_stars★()
end

-- draw to the screen
function _draw()
	state_draw()
	draw_stars()
end

function start_game()
    mode="game"
	make_ship()
    make_bullet()
    make_enemy()
	set_score()
    set_stars()
end