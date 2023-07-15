image_speed = 0.35
switch state
{
    case (0 << 0):
        if (sprite_index == spr_arenagate_opened)
        {
            if (blockinst != noone && instance_exists(blockinst))
            {
                blockinst = noone
                instance_destroy(blockinst)
            }
        }
        else if (sprite_index == spr_arenagate_close)
            image_index = (image_number - 1)
        break
    case (8 << 0):
        if (sprite_index == spr_arenagate_open && floor(image_index) == (image_number - 1))
        {
            state = (0 << 0)
            sprite_index = spr_arenagate_opened
            instance_destroy(blockinst)
        }
        else if (sprite_index == spr_arenagate_close && floor(image_index) == (image_number - 1))
        {
            image_index = (image_number - 1)
            state = (0 << 0)
            with (instance_create(x, y, obj_solid))
            {
                visible = false
                sprite_index = other.sprite_index
                mask_index = other.mask_index
                other.blockinst = id
            }
        }
        break
}

