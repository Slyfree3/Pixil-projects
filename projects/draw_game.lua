-- draw game
function state_draw()
	if mode=="game" then
		draw_game()
	elseif mode=="start" then
		-- start screen
			draw_start()
	elseif mode=="over" then
		draw_over()
	end
end

function draw_game()
  cls()          -- clear screen with dark blue
  draw_stars()
  draw_ship()   -- draw sprite #1 at coordinates x, y
  draw_bullet() -- draw sprite for bullet
  draw_score()
  draw_heart()
  draw_enemy()
end

function draw_sprite(myspr)
    spr(myspr.spr, myspr.x, myspr.y)
end

function draw_start()
	cls(0)
	print("★super star shooter★", 20,40,12)
	print("press any key to start!", 20,80,rnd(128))
end


function draw_ship()
	if invunerable <= 0 then 
		draw_sprite(ship)
		draw_exhaust()
	else
		if sin(t/5) < 0.1 then -- flicker effect for invulnerability
			draw_sprite(ship)
			draw_exhaust()
			
		end
	end
  
  
  if muzzle>0 then
  	circfill(ship.x+3,ship.y-1,muzzle,7)
  end
end

function draw_exhaust()
	spr(exaust.spr, ship.x, ship.y+8)
end

function draw_bullet()
	for i=1,#bullet do
		local newbul=bullet[i]
		draw_sprite(newbul)
	end
end

function draw_over()
	cls(0)
	print("☉oh,no! the watchers won!☉", 10,40,rnd(13))
	print("press any key to reconstruct!", 12,80,2)
end