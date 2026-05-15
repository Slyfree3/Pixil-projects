--update

function state_update()
	if mode=="game" then
		update_game()
	elseif mode=="start" then
	-- start screen
		update_start()
	elseif mode=="over" then
		update_over()
	end
end

function update_game()
    move_ship()
    move_bullet()
    shoot_bullet()
    animate_exaust()
    animate_bullet()
    animate_muzzlefl()
	animate_enemy()
    move_enemy()
	col_ship_enemy()
	collision_side_ship()
	collision_bullet_enemy()
    animate_stars★()
end

function update_start()
	if btnp(4) or btnp(5) then -- use this on menus
		start_game()
	end
end

function update_over()
	if btnp(4) or btnp(5) then -- use this on menus
		mode="start"
	end
end