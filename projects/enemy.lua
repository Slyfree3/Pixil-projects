-- making enemies
function make_enemy()
    enemy={}
    enemy.spr=22
    local newenemy={}
    newenemy.x=flr(rnd(120))
    newenemy.y=-8
    newenemy.sp=1
    newenemy.spr=enemy.spr
    add(enemy,newenemy)
end

function move_enemy()
    for i=1,#enemy do
        local newenemy=enemy[i]
        newenemy.y+=newenemy.sp
        if newenemy.y>128 then
            del(enemy,newenemy)
        end
    end
end

function draw_enemy()
    for i=1,#enemy do
        local newenemy=enemy[i]
        draw_sprite(newenemy)
    end
end

function animate_enemy ()
    enemy.spr+=.25
    if enemy.spr>=25 then
        enemy.spr=22
    end
end  
