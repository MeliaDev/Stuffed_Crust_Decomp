if (global.panic == 1)
    sprite_index = spr_entrancepillarpanic
if (room == entrance_3)
{
    if (obj_player.x > (x + (sprite_width / 2)))
    {
        if (sprite_index != spr_entrancepillarsecret && global.panic == 0)
        {
            alarm[0] = 25
            touched = 1
            sprite_index = spr_entrancepillarsecret
        }
    }
}
