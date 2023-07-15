var myplayer = obj_player1.id
if (player_id == 2)
    myplayer = obj_player2.id
if (myplayer.state != (107 << 0))
{
    with (myplayer)
    {
        if (global.blueeffects > 0 && global.blueeffects < 4)
        {
            if (global.blueeffects == 1)
            {
                with (create_firemouth_afterimage(x, y, sprite_index, image_index, 1))
                {
                    image_xscale = other.xscale
                    playerid = other.id
                }
            }
            if (global.blueeffects == 2)
            {
                with (create_blue_afterimage(x, y, sprite_index, image_index, 1))
                {
                    image_xscale = other.xscale
                    playerid = other.id
                }
            }
            if (global.blueeffects == 3)
            {
                with (create_red_afterimage(x, y, sprite_index, image_index, 1))
                {
                    image_xscale = other.xscale
                    playerid = other.id
                }
            }
        }
        else
        {
            with (create_mach3effect(x, y, sprite_index, image_index, 1))
            {
                image_xscale = other.xscale
                playerid = other.id
            }
        }
        parry_lethal = other.lethal
        if (state != (147 << 0))
            fmod_event_one_shot_3d("event:/sfx/pep/parry", x, y)
        state = (147 << 0)
        if (!isgustavo)
            sprite_index = choose(spr_parry1, spr_parry2, spr_parry3)
        else
            sprite_index = spr_player_ratmountspit
        image_index = 0
        image_speed = 0.35
        taunttimer = 20
        movespeed = 8
        parry_inst = -4
        parry_count = parry_max
        with (instance_create(x, y, obj_parryeffect))
            image_xscale = other.xscale
        flash = 1
    }
    alarm[0] = die_time
    collisioned = 1
}
