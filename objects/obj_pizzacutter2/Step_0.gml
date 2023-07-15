if (myhandle != noone)
{
    image_angle = myhandle.image_angle
    if (myhandle.object_index == obj_pizzacutterthwomp1)
    {
        x = other.x
        y = (other.y + 120)
    }
    else if ((myhandle.spinspeed < -6 || myhandle.spinspeed > 6) && (!whathaveyoudone))
    {
        whathaveyoudone = 1
        alarm[1] = 1
    }
}
