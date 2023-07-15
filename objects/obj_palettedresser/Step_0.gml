showtext = place_meeting(x, y, obj_player)
if instance_exists(obj_transfotip)
    showtext = 0
if showtext
    alpha = Approach(alpha, 1, 0.1)
else
    alpha = Approach(alpha, 0, 0.1)
if (obj_player1.character == "V")
{
    palettetitle = lang_get_value(concat("dresserV_", palettes[paletteselect][0], "title"))
    palettedesc = lang_get_value_newline(concat("dresserV_", palettes[paletteselect][0]))
}
else if (obj_player1.character == "S")
{
    palettetitle = lang_get_value(concat("dresserS_", palettes[paletteselect][0], "title"))
    palettedesc = lang_get_value_newline(concat("dresserS_", palettes[paletteselect][0]))
}
else if (obj_player1.character == "N" || (obj_player1.character == "P" && obj_player1.ispeppino == 0))
{
    palettetitle = lang_get_value(concat("dresserN_", palettes[paletteselect][0], "title"))
    palettedesc = lang_get_value_newline(concat("dresserN_", palettes[paletteselect][0]))
}
else
{
    palettetitle = lang_get_value(concat("dresser_", palettes[paletteselect][0], "title"))
    palettedesc = lang_get_value_newline(concat("dresser_", palettes[paletteselect][0]))
}
