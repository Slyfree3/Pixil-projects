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
            sfx(1)
			del(enemy,myenemy)
			if ship.lives==0 then
				mode="over"
			end	
        end
    end
end

function collision(a, b)
	-- Check if the bounding boxes of a and b overlap
    local a_left = a.x
    local a_right = a.x + 7
    local a_top = a.y
    local a_bottom = a.y + 7
    -- Assuming b has the same dimensions as a
    local b_left = b.x
    local b_right = b.x + 7
    local b_top = b.y
    local b_bottom = b.y + 7

    if a_top>b_bottom then return false end
    if a_bottom<b_top then return false end
    if a_right<b_left then return false end
    if a_left>b_right then return false end
    -- Collision detected
	return true
end