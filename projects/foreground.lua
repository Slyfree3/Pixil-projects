-- forground
function set_score()
	score={}
	score.label="score:"
	score.current = 0
	score.lc=score.label .. score.current
end

function draw_score()
	print("score:"..score.current,40,1,12)
end 


function draw_heart() -- display life
	for i=1,3 do
		if ship.lives>=i then 
			spr(13,i*9-8,1)
		else
			spr(14,i*9-8,1)
		end
	end
end
