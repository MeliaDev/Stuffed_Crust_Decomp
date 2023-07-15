if (vsp > 0)
{
    if (obj_player1.character == "V")
        global.playerhealth += 1
    var val = heat_calculate(10)
    if (other.object_index == obj_player1)
        global.collect += val
    else
        global.collectN += val
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    with (obj_camera)
        healthshaketime = 40
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    if (obj_player.character == "P" && obj_player.ispeppino)
        scr_sound_multiple("event:/sfx/misc/collect", x, y)
    if ((obj_player.character == "P" && obj_player.ispeppino == 0) || obj_player.character == "N")
        fmod_event_one_shot_3d("event:/sfx/voice/noisepositive", x, y)
    instance_destroy()
}
