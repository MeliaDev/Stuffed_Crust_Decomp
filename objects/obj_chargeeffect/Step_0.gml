image_xscale = playerid.xscale
if (playerid.dropdash || (playerid.state != (184 << 0) && playerid.gusdashpadbuffer <= 0 && playerid.state != (121 << 0) && playerid.ratmount_movespeed < 12 && playerid.state != (102 << 0) && playerid.state != (153 << 0)))
    instance_destroy()
x = ((playerid.x + ((playerid.sprite_index == playerid.spr_superjumpcancel ? 20 : 0) * playerid.xscale)) + offset)
if (playerid.sprite_index == spr_playerV_divekick || playerid.sprite_index == spr_playerV_divekickstart)
    y = (playerid.y + 10)
else if (playerid.character == "S")
    y = (playerid.y + 6)
else if (playerid.character == "M")
    y = (playerid.y - 10)
else if (playerid.state == (20 << 0))
    y = playerid.y
else
    y = (playerid.y - 10)
if (playerid.state == (184 << 0) || playerid.state == (191 << 0))
    x = ((playerid.x + (playerid.xscale * 20)) + offset)
visible = (!(room == rank_room))
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    visible = false
