room = targetRoom
with (obj_player)
{
    targetRoom = other.targetRoom
    targetDoor = other.targetDoor
    state = (95 << 0)
    image_index = 0
}
scr_playerreset()
instance_destroy()
