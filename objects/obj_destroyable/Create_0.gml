global.breaksound = 0
depth = 1
image_index = random_range(0, (image_number - 1))
debrisspr = spr_towerblockdebris
if (sprite_index == spr_towerblocksmall)
{
    if global.panic
        sprite_index = spr_destroyableescape
    if (current_month == 10)
    {
        if (current_day >= 24 && current_day <= 31)
        {
            image_speed = 0
            sprite_index = spr_solid
            image_index = irandom(4)
        }
        else
            sprite_index = spr_destroyable
    }
    var theroomname = room_get_name(room)
    if (string_pos("secret", theroomname) != 0)
    {
        sprite_index = spr_secretblock_small
        debrisspr = spr_secretdebris
    }
    if (room == medieval_9b)
    {
        sprite_index = spr_towerblocksmall_golden
        debrisspr = spr_goldtowerblockdebris
    }
}
