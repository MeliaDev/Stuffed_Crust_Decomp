if (other.state == (47 << 0) && other.sprite_index != other.spr_knightpepstart && other.sprite_index != other.spr_knightpepthunder)
{
    fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
    state = (138 << 0)
    stunned = 1000
    lastattack = (0 << 0)
    throwsword = 0
    other.state = (0 << 0)
    other.jumpstop = 1
    other.vsp = -11
    instance_destroy(obj_swordstone)
}
