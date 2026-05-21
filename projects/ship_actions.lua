-- ship movement and actions


function make_ship()
    ship = {}
    ship.sx = 2 -- ship speed x axis
    ship.sy = 2 -- ship speed y axis
    ship.x = 64 -- ship position x
    ship.y = 64 -- ship position y
    ship.lives = 3 -- ship lives 
    ship.spr = 2 -- ship sprite
    muzzle = 0 -- muzzle flash timer
	exaust={} -- exaust animation
	exaust.spr=5 -- exaust starting sprite
	exaust.x=ship.x
	exaust.y=ship.y+8
	invunerable = 0 -- invulnerability timer
end

function make_bullet()
	bullet={}
	bullet.x = 64
	bullet.y = -10
	bullet.sp = 7
	bullet.spr = 16 -- starting sprite for bullet animation
	bullet.sprm =19 -- max sprite for bullet animation
	btimer=0 -- timer for bullet animation
end

function move_ship()
	ship.spr = 2
    if btn(0) then
     ship.x -= ship.sx
     ship.spr = 1
    end
    if btn(1) then
     ship.x += ship.sx
     ship.spr = 3
    end
    if btn(2) then
     ship.y -= ship.sy
    end
    if btn(3) then
     ship.y += ship.sy
    end
end

function move_bullet()
	for i=#bullet,1,-1 do
		local newbul=bullet[i]
		newbul.y-=bullet.sp

		if newbul.y<-8 then -- delete bullet
			del(bullet,newbul)
		end
	end
end

function collision_bullet_enemy()
	for newbul in all(bullet) do
		for myenemy in all(enemy) do
			if collision(newbul, myenemy) then
				-- Handle collision logic here
				score.current+=1
				sfx(1)
				del(enemy,myenemy)
				del(bullet,newbul)
				make_enemy() -- spawn new enemy when one is destroyed	
			end
		end
	end
end

function create_bullet()
	if btimer <= 0 then
		local newbul={}
		newbul.x=ship.x
		newbul.y=ship.y - 5
		newbul.spr=16
		add(bullet,newbul)
		btimer= 5 -- set a cooldown for shooting (e.g., 10 frames)
		muzzle = 5 
	 	sfx(0)
	end
	

end

function shoot_bullet()
	if btn(5) then
		create_bullet()
	end
	btimer-=1
end

function animate_bullet()
	for newbul in all(bullet) do
		newbul.spr+=1
		if	newbul.spr>bullet.sprm then
			newbul.spr=16
		end
	end
end

function animate_exaust()
	exaust.spr+=0.6
	if	exaust.spr>10.8 then
		exaust.spr=6
	end
end

function animate_muzzlefl()
	if muzzle>0 then
		muzzle-=1
	end
end