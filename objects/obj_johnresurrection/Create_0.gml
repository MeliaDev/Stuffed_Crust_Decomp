treasure = 1
var levels = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "minigolf", "space", "sewer", "industrial", "street", "freezer", "chateau", "kidsparty", "war"]
ini_open_from_string(obj_savesystem.ini_str)
var i = 0
while (i < array_length(levels))
{
    if (!(ini_read_real("Treasure", levels[i], 0)))
    {
        treasure = 0
        break
    }
    else
    {
        i++
        continue
    }
}
ini_write_real("Game", "john", treasure)
obj_savesystem.ini_str = ini_close()
global.johnresurrection = treasure
if treasure
    notification_push((55 << 0), [])
depth = -600
state = 0
fadein = 0
fade = 0
treasure_dir = -1
treasure_index = 0
whitefade = 1
snd = fmod_event_create_instance("event:/sfx/ending/johnending")
