if (visible && object_index != obj_onewaybigblock && (!((object_index == obj_ghostknight && obj_player.holycross == 0))) && object_index != obj_pizzaball && object_index != obj_pepperman && object_index != obj_noiseboss && object_index != obj_vigilanteboss && object_index != obj_pf_fakepep && object_index != obj_fakepepboss && object_index != obj_pizzafaceboss && object_index != obj_pizzafaceboss_p2 && object_index != obj_pizzafaceboss_p3 && object_index != obj_fakepepgianthead && object_index != obj_pf_fakepepgianthead && underground == 0 && killprotection == 0)
{
    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
    instance_create(x, y, obj_spikehurteffect)
    with (other.playerid)
    {
        vsp = -9
        sprite_index = spr_player_chainsawpogobounce
        image_index = 0
    }
    elitehit = 0
    instance_destroy()
}
