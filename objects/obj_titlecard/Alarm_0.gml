loading = 1
with (instance_create(x, y, obj_fadeout))
{
    restarttimer = 1
    if (room == tower_finalhallwaytitlecard)
        finalhallway = 1
}
if (group_arr != -4)
{
    with (instance_create(x, y, obj_loadingscreen))
    {
        offload_arr = other.offload_arr
        group_arr = other.group_arr
    }
}
