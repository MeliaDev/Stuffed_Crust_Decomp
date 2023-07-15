hp = 2
depth = 1
debris = 3637
if (sprite_index == spr_towerblock)
{
    if global.panic
    {
        debris = 483
        sprite_index = spr_johndestructible
        image_speed = 0.35
    }
    if (current_month == 10)
        sprite_index = sprite387
    var theroomname = room_get_name(room)
    if (string_pos("secret", theroomname) != 0)
    {
        sprite_index = spr_secretblock
        debris = 1498
    }
}
content = obj_null
