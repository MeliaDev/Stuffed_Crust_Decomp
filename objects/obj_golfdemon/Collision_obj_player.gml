if (state != (4 << 0) && (other.state != (42 << 0) || invincible) && (other.state != (5 << 0) || (other.sprite_index != other.spr_tumble && other.sprite_index != other.spr_tumblestart && other.sprite_index != other.spr_tumbleend)) && state != (138 << 0) && (state == (141 << 0) || state == (134 << 0)))
{
    var s = other.state
    if other.flash
        other.flash = 0
    scr_hurtplayer(other)
    if (other.state != s && other.state != (147 << 0))
    {
        state = (138 << 0)
        hsp = ((-image_xscale) * 7)
        vsp = -6
        stunned = 100
    }
}
