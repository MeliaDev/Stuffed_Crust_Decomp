if (!active)
{
    fmod_event_one_shot_3d("event:/sfx/misc/checkpoint", x, y)
    active = 1
    with (obj_checkpoint)
    {
        if (id != other.id)
            active = 0
        sprite_index = spr_checkpoint
    }
    sprite_index = spr_checkpoint_activating
    image_index = 0
    with (obj_player)
    {
        roomstartx = (other.x + 6)
        roomstarty = (other.y - 46)
    }
}
