if (room != rank_room)
{
    if (string_letters(room_get_name(room)) == "towertutorial")
        global.tutorial_room = 1
    else
        global.tutorial_room = 0
}
pbuff = 0
