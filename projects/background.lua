-- background
function set_stars()
	stars={}
	for i=1,50 do
		local newstars={}
		newstars.x=flr(rnd(128))
		newstars.y=flr(rnd(128))
		newstars.spd=rnd(5)+1.5
		add(stars,newstars)
	end
end

function animate_stars★()
	for i=1,#stars do
		local newstar=stars[i]
		newstar.y+=newstar.spd
		if newstar.y>128 then
			newstar.y-=128
		end
	end
end


function draw_stars()	
	for i=1,#stars do
		local newstar=stars[i]
		local scol=6
		
		if newstar.spd<1.5 then
			scol=13
		elseif newstar.spd<5 then
			scol=1
		end
		 pset(newstar.x,newstar.y,scol)
	end
end