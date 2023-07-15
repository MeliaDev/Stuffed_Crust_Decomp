if (playerid == -4 && other.state != (146 << 0) && (!instance_exists(obj_bossplayerdeath)))
{
    playerid = other.id
    other.state = (285 << 0)
    other.sprite_index = other.spr_bump
    other.hsp = 0
    other.vsp = 0
}
