event_inherited()
dmg = 10
col_buffer = 0
col_max = 10
function player_hurt_gml_Object_obj_millionpunchhitbox_Create_0(argument0, argument1) //player_hurt_gml_Object_obj_millionpunchhitbox_Create_0
{
    if ((!collisioned) && argument1.state != (145 << 0))
    {
        col_buffer = col_max
        self.SUPER_player_hurt(argument0, argument1)
    }
}

