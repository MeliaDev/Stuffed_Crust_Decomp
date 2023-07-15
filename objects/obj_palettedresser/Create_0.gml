depth = 100
palettes = [["classic", 1, 1], ["unfunny", 0, 3], ["money", 0, 4], ["sage", 0, 5], ["blood", 0, 6], ["tv", 0, 7], ["dark", 0, 8], ["shitty", 0, 9], ["golden", 0, 10], ["garish", 0, 11], ["mooney", 0, 15], ["pissbaby", 1, 16], ["classicer", 1, 17], ["striking", 1, 18], ["lukewarm", 1, 19], ["gerome", 1, 20], ["bnp", 1, 21], ["stupid", 1, 22], ["grunch", 1, 23], ["cheesy", 1, 24], ["very", 1, 25], ["tower", 1, 26], ["cosmic", 1, 27], ["vacation", 1, 28], ["empire", 1, 29], ["terror", 1, 30], ["undertale", 1, 31], ["secret", 1, 32], ["oneshot", 1, 33], ["retro", 1, 34], ["massacre", 1, 35], ["funny", 0, 12, 4019], ["itchy", 0, 12, 474], ["pizza", 0, 12, 2897], ["stripes", 0, 12, 1678], ["goldemanne", 0, 12, 3723], ["bones", 0, 12, 3951], ["pp", 0, 12, 3925], ["war", 0, 12, 845], ["john", 0, 12, 3945]]
ini_open_from_string(obj_savesystem.ini_str_options)
for (var i = 1; i < array_length(palettes); i++)
{
    if ini_read_real("Palettes", palettes[i][0], 0)
        palettes[i][1] = 1
}
ini_close()
scr_create_uparrowhitbox()
paletteselect = 0
with (obj_player1)
{
    if (paletteselect > 2)
    {
        for (i = 0; i < array_length(other.palettes); i++)
        {
            var pal = other.palettes[i][2]
            if (pal == paletteselect && (pal != 12 || other.palettes[i][3] == global.palettetexture))
                other.paletteselect = i
        }
    }
}
showtext = 0
alpha = 0
palettetitle = lang_get_value(concat("dresser_", palettes[paletteselect][0], "title"))
palettedesc = lang_get_value_newline(concat("dresser_", palettes[paletteselect][0]))
maxpal = array_length(palettes)
