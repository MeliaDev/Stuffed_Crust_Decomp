var s = string_letters(room_get_name(room))
if (s == "factory" || s == "industrial" || s == "industrialsecret")
{
    sprite_index = spr_robotspring
    activatespr = spr_robotspring_active
}
if (s == "saloon" || s == "city" || s == "street")
{
    sprite_index = spr_bottle_idle
    activatespr = spr_bottle_activate
}
