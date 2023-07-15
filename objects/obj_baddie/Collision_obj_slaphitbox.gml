if (visible && object_index != obj_onewaybigblock && (!((object_index == obj_ghostknight && obj_player.holycross == 0))) && object_index != obj_pizzaball && object_index != obj_pepperman && object_index != obj_noiseboss && object_index != obj_vigilanteboss && object_index != obj_pf_fakepep && object_index != obj_fakepepboss && object_index != obj_pizzafaceboss && object_index != obj_pizzafaceboss_p2 && object_index != obj_pizzafaceboss_p3 && object_index != obj_fakepepgianthead && object_index != obj_pf_fakepepgianthead && underground == 0 && killprotection == 0)
{
    if (((object_index != obj_cheeseslime && object_index != obj_sausageman && object_index != obj_miniufo_grounded) || (object_index == obj_indiancheese && walkspr == spr_ufogrounded_walk)) && obj_player1.movespeed < 12)
    {
        if (state != (138 << 0))
        {
            global.combotime += 10
            fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
            instance_create(x, y, obj_spikehurteffect)
            other.image_xscale = image_xscale
            flash = 1
            slapped = 1
            instance_create(x, y, obj_bumpeffect)
            stunned = 200
            if (other.x != x)
                image_xscale = (-(sign((x - other.x))))
            vsp = -7
            hsp = ((-image_xscale) * 3)
            state = (138 << 0)
        }
        else if (state == (138 << 0) && slapped == 0)
        {
            slapamt++
            stuntouchbuffer = 30
            stunned = 200
            if (slapamt > 0)
            {
                if ((!heavy) || (heavy && slapamt > 1))
                {
                    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
                    instance_create(x, y, obj_spikehurteffect)
                    other.image_xscale = image_xscale
                    flash = 1
                    instance_create(x, y, obj_bumpeffect)
                    elitehit = 0
                    instance_destroy()
                }
                else
                {
                    global.combotime += 10
                    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
                    instance_create(x, y, obj_spikehurteffect)
                    other.image_xscale = image_xscale
                    flash = 1
                    slapped = 1
                    instance_create(x, y, obj_bumpeffect)
                    stunned = 200
                    if (other.x != x)
                        image_xscale = (-(sign((x - other.x))))
                    vsp = -7
                    hsp = ((-image_xscale) * 3)
                    state = (138 << 0)
                }
            }
        }
    }
    else
    {
        fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
        instance_create(x, y, obj_spikehurteffect)
        other.image_xscale = image_xscale
        flash = 1
        instance_create(x, y, obj_bumpeffect)
        elitehit = 0
        instance_destroy()
    }
}
