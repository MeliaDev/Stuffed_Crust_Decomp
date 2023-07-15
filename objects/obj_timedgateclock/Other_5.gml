if global.timedgatetimer
{
    global.timedgatetimer = 0
    global.timedgatetime = 0
    instance_destroy(obj_clock, false)
}
