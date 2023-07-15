depth = -600
if (instance_number(object_index) > 1)
{
    instance_destroy()
    return;
}
dirty = 0
savegame = 0
saveoptions = 0
fadeoutcreate = 0
showicon = 0
ini_str = ""
state = 0
icon_index = 0
sliceicon = spr_pizzaslice
icon_max = sprite_get_number(sliceicon)
ini_open("saveData.ini")
ini_str_options = ini_close()
