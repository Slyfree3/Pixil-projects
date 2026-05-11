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
		draw_exhaust()
		draw_score()
		draw_heart()
end

function draw_start()
	cls(0)
	print("★super star squirt★", 20,40,12)
	print("press any key to start!", 20,80,rnd(128))
end


function draw_ship()
  spr(shipspr, ship.x, ship.y)
  
  if muzzle>0 then
  	circfill(ship.x+3,ship.y-1,muzzle,7)
  end
end

function draw_exhaust()
		spr(exaustspr, ship.x, ship.y+8)
end

function draw_bullet()
		for i=1,#bullet do
			local newbul=bullet[i]
			newbul.spr=16
			spr(bullet.spr,newbul.x,newbul.y)
		end
end

function draw_over()
	cls(0)
	print("☉oh,no! the watchers won!☉", 10,40,rnd(13))
	print("press any key to reconstruct!", 12,80,2)
end