if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (5)
    {
        with (create_debris((x + random_range(-32, 32)), (y + random_range(-32, 32)), 3347, 1))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
            image_speed = 0.35
            depth = (obj_player.depth + 10)
        }
    }
    with (obj_player1)
        supercharge += 1
    global.combo += 1
    global.style += (5 + (global.combo / 10))
    global.enemykilled += 1
    global.combotime = 60
    var combototal = (10 + floor((global.combo * 0.5)))
    global.collect += combototal
    global.comboscore += combototal
    scr_sleep(5)
    notification_push((45 << 0), [room])
    fmod_event_one_shot_3d("event:/sfx/misc/cow", x, y)
    ds_list_add(global.saveroom, id)
}
