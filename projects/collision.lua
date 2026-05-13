function collision_side_ship()
    if ship.x<0 then
        ship.x=0
    end
    if ship.x>120 then
        ship.x=120
    end
    if ship.y<0 then
        ship.y=0
    end
    if ship.y>120 then
        ship.y=120
    end
end

function col_ship_enemy()
    for myenemy in all(enemy) do
        if collision(ship, myenemy) then
            -- Handle collision logic here
			ship.lives-=1
			del(enemy,myenemy)
			if ship.lives==0 then
				mode="over"
			end	
        end
    end
end

function collision(a, b)
	
	return false
end