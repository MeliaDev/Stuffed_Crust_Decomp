instance_create(x, y, obj_fadeout)
with (obj_player)
{
    targetRoom = characterselect
    targetDoor = "A"
}
global.currentsavefile = (currentselect + 1)
gamesave_async_load()
