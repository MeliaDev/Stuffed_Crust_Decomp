hsp = 0
vsp = 0
movespeed = 7
grav = 0.5
platformid = -4
hsp_carry = 0
vsp_carry = 0
depth = -8
grounded = 0
jumpspeed = 11
rubberband = 0
rubberband_dir = 1
targetplayer = 530
targetRoom = room
targetDoor = "A"
image_speed = 0.35
LAG_STEPS = 45
AMT = LAG_STEPS
followqueue = ds_queue_create()
startx = xstart
starty = ystart
oldtype = 0
shake = 0
gotcha = 0
if (!instance_exists(obj_objecticontracker))
{
    with (instance_create(x, y, obj_objecticontracker))
    {
        objectID = other.id
        sprite_index = spr_icon_policecar
        image_speed = 0.18
    }
}
REAL = AMT
state = (0 << 0)
triedjump = 0
