if (other.character == "V")
{
    scr_sound_multiple("event:/sfx/misc/collect", x, y)
    global.playerhealth_threshold += 5
    global.heattime += 1
    global.heattime = clamp(global.heattime, 0, 60)
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    with (obj_camera)
        healthshaketime = 30
    var val = 5
    global.collect += val
    create_collect(other.x, other.y, sprite_index, val)
    with (instance_create(other.x, other.y, obj_smallnumber))
        number = string(val)
    instance_destroy()
}
