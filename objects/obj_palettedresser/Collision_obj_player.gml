if (other.key_up2 || other.key_down2)
{
    if (sprite_index != spr_palettedresser_closed)
    {
        with (other)
        {
            with (instance_create(x, y, obj_sausageman_dead))
            {
                fmod_event_one_shot_3d("event:/sfx/misc/clotheswitch", x, y)
                hsp = irandom_range(-5, 5)
                vsp = (-(irandom_range(6, 11)))
                usepalette = 1
                sprite_index = obj_player1.shirtspr
                spr_palette = obj_player1.spr_palette
                paletteselect = other.paletteselect
                oldpalettetexture = global.palettetexture
            }
            if key_up2
                other.paletteselect++
            if key_down2
                other.paletteselect--
        }
        if (paletteselect >= array_length(palettes))
            paletteselect = 0
        if (paletteselect < 0)
            paletteselect = (maxpal - 1)
        while (palettes[paletteselect][1] == 0)
        {
            if other.key_up2
                paletteselect++
            if other.key_down2
                paletteselect--
            if (paletteselect >= array_length(palettes))
                paletteselect = 0
            if (paletteselect < 0)
                paletteselect = (maxpal - 1)
        }
        var arr = palettes[paletteselect]
        other.paletteselect = arr[2]
        if (arr[2] == 12)
            global.palettetexture = arr[3]
        else
            global.palettetexture = -4
        ini_open_from_string(obj_savesystem.ini_str)
        ini_write_real("Game", "palette", other.paletteselect)
        ini_write_string("Game", "palettetexture", arr[0])
        obj_savesystem.ini_str = ini_close()
    }
    else
        fmod_event_one_shot_3d("event:/sfx/misc/keyunlock", x, y)
}
