with (other)
{
    if ((state == (16 << 0) || (state == (61 << 0) && tauntstoredstate == (16 << 0))) && other.visible == true)
    {
        ghostdash = 1
        GamepadSetVibration(0, 0.6, 0.2)
        if (xscale > 0)
            ghostangle = 0
        else
            ghostangle = 180
        ghostpepper += 1
        other.cooldown = 50
        other.visible = false
        repeat (2)
            create_debris(other.x, other.y, 4030, 1)
    }
}
