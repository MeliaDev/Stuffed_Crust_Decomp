if (state == (156 << 0))
{
}
if (other.state == (42 << 0))
{
    if (state == (42 << 0))
    {
        with (other)
        {
            state = (262 << 0)
            substate = (79 << 0)
            attackcooldown = 0
            baddieID = other.id
            punchcount = 8
            sprite_index = spr_grab
        }
        state = (262 << 0)
        substate = (79 << 0)
        punchcount = 12
        attackcooldown = 0
        playerid = other.id
    }
    else
    {
        with (other)
        {
            state = (262 << 0)
            substate = (79 << 0)
            attackcooldown = 0
            baddieID = other.id
            punchcount = 5
            sprite_index = spr_grab
        }
        hsp = 0
        playerid = other.id
        state = (262 << 0)
        substate = (4 << 0)
        cooldown += 15
    }
}
else if (state == (42 << 0))
{
    state = (262 << 0)
    substate = (79 << 0)
    punchcount = 6
    attackcooldown = 0
    playerid = other.id
    other.state = (262 << 0)
    other.substate = (4 << 0)
    other.sprite_index = other.spr_hurt
}
