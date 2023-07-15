if (abs((x - obj_player1.x)) > 30)
    image_xscale = sign((obj_player1.x - x))
if (global.storedcharactersnick == 0)
    sprite_index = spr_snick_idle
if (global.storedcharactersnick == 1)
    sprite_index = spr_player_idle
if (global.storedcharactersnick == 2)
    sprite_index = spr_playerN_idle
if (global.storedcharactersnick == 3)
    sprite_index = spr_playerV_idle
