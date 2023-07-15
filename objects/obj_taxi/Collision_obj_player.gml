with (other)
{
    if (key_up && grounded && ((state == (191 << 0) && brick) || state == (0 << 0) || state == (103 << 0) || state == (104 << 0) || state == (58 << 0) || state == (121 << 0) || state == (99 << 0)) && (!instance_exists(obj_noisesatellite)) && (!instance_exists(obj_taxidud)) && (!instance_exists(obj_fadeout)) && state != (119 << 0) && ((obj_player1.spotlight == 1 && object_index == obj_player1) || (obj_player1.spotlight == 0 && object_index == obj_player2)))
    {
        with (other)
        {
            instance_create(x, y, obj_genericpoofeffect)
            obj_player1.visible = false
            obj_player1.sprite_index = obj_player1.spr_idle
            obj_player1.hsp = 0
            obj_player1.movespeed = 0
            obj_player1.ratmount_movespeed = 0
            obj_player1.vsp = 0
            obj_player1.state = (119 << 0)
            if instance_exists(obj_policecar)
            {
                with (obj_policecar)
                {
                    shake = 1
                    instance_destroy()
                }
            }
            fmod_event_one_shot("event:/sfx/misc/taximove")
            playerid = 530
            move = 1
            sprite_index = spr_taximove
            hsp = 10
            obj_player1.cutscene = 1
            depth = -100
            if police
            {
                with (instance_create(x, y, obj_taxicardboard))
                    depth = -101
                fmod_event_one_shot("event:/sfx/misc/policesiren")
                police_buffer = 50
                obj_player1.policetaxi = 1
                sprite_index = spr_taxicop
            }
            if (global.coop == 1)
            {
                obj_player2.sprite_index = obj_player2.spr_idle
                fmod_event_one_shot("event:/sfx/misc/taximove")
                playerid = 529
                sprite_index = spr_taximove
                hsp = 10
                obj_player2.visible = false
                obj_player2.hsp = 0
                obj_player2.vsp = 0
                obj_player2.state = (119 << 0)
                obj_player2.cutscene = 1
            }
        }
    }
}
