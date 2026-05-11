-- ship movement and actions

function make_ship()
    ship = {}
    ship.sx = 2 -- ship speed x axis
    ship.sy = 2 -- ship speed y axis
    ship.x = 64 -- ship position x
    ship.y = 64 -- ship position y
    ship.lives = 3 
    shipspr = 2 -- ship sprite
    exaustspr = 6 
    muzzle = 0
end

function make_bullet()
	bullet={}
	bullet.x = 64
	bullet.y = -10
	bullet.sp = 7
	bullet.spr = 16
end

function move_ship()
				shipspr = 2
    if btn(0) then
     ship.x -= ship.sx
     shipspr = 1
    end
    if btn(1) then
     ship.x += ship.sx
     shipspr = 3
    end
    if btn(2) then
     ship.y -= ship.sy
    end
    if btn(3) then
     ship.y += ship.sy
    end
    if btn(4) then --todo:remove this
    	mode="over"
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

function create_bullet()
			local newbul={}
			newbul.x=ship.x
			newbul.y=ship.y - 5
			add(bullet,newbul)
end

function shoot_bullet()
		if btnp(5) then
			create_bullet()
		 muzzle = 5 
		 sfx(0)
		end
end

function animate_bullet()
	bullet.spr=bullet.spr+1
	if	bullet.spr>19 then
		bullet.spr=16
	end
end

function animate_exaust()
	exaustspr=exaustspr+1
	if	exaustspr>10 then
		exaustspr=5
	end
end

function animate_muzzlefl()
	if muzzle>0 then
		muzzle-=1
	end
end