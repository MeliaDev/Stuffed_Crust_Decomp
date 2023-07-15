var flag = 0
if (ds_list_find_index(global.baddieroom, id) != -1)
{
    state = (6 << 0)
    flag = 1
}
else if (ds_list_find_index(global.saveroom, id) != -1)
{
    state = (89 << 0)
    flag = 1
}
if flag
{
    with (obj_raceend)
    {
        other.x = (x + (sprite_width / 2))
        other.y = ((y + sprite_height) - 32)
    }
}
