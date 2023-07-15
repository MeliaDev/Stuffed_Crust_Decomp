if (abs((x - obj_player1.x)) > 30)
    image_xscale = sign((obj_player1.x - x))
if (global.storedcharactervigi == 0)
    sprite_index = spr_playerV_idle
if (global.storedcharactervigi == 1)
    sprite_index = spr_player_idle
if (global.storedcharactervigi == 2)
    sprite_index = spr_playerN_idle
if (global.storedcharactervigi == 3)
    sprite_index = spr_snick_idle
