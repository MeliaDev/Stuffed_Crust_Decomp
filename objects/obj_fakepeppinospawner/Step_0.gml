if (!released)
{
    if ((!instance_exists(inst)) && global.chase == 1 && canrelease == 1)
    {
        released = 1
        image_speed = 0.35
    }
}
else if ((!instance_exists(inst)) && canrelease == 1)
{
    canrelease = 0
    alarm[4] = 60
    inst = instance_create(x, (y + 18), obj_peppinoclone)
    with (inst)
    {
        important = 1
        targetDoor = other.targetDoor
        targetRoom = other.targetRoom
        with (instance_create(x, y, obj_genericpoofeffect))
            depth = (other.depth - 10)
    }
    if (room == mansion_yardshed)
    {
        with (obj_mansion_raincontroller)
            showrain = 1
    }
}
if ((global.key_inv == 1 && obj_player.state != (90 << 0)) || global.panic)
    global.chase = 1
if (global.key_inv == 0 && instance_exists(inst) && (!global.panic))
{
    global.chase = 0
    with (inst)
    {
        elitehit = 0
        instance_destroy()
    }
}
