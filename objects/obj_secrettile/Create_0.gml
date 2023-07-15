active = 0
alpha = 1
depth = -7
desireddepth = -6
surf = -4
tiles[0] = array_create(0)
tiles[1] = array_create(0)
tiles[2] = array_create(0)
for (var i = 0; i < 3; i++)
{
    var lay_id = layer_get_id(concat("Tiles_Secret", (i + 1)))
    tilemap_sprite[i] = -4
    if (lay_id != -1)
    {
        var map_id = layer_tilemap_get_id(lay_id)
        var ts = tilemap_get_tileset(map_id)
        var t = -4
        switch ts
        {
            case 131:
                t = spr_towerentrancehall
                break
            case 80:
                t = tile_ruin
                break
            case 81:
                t = tile_ruin2
                break
            case 40:
                t = spr_ruinend
                break
            case 36:
                t = spr_ruinend_secret
                break
            case 96:
                t = sprite_tile_beachtest
                break
            case 97:
                t = sprite_tile_beachtest2
                break
            case 100:
                t = sprite_tile_beachtest2dark
                break
            case 85:
                t = tile_chateau1
                break
            case 54:
                t = tile_desert
                break
            case 56:
                t = tile_ufo
                break
            case 55:
                t = tile_cavern
                break
            case 82:
                t = tile_dungeon
                break
            case 83:
                t = tile_dungeon2
                break
            case 84:
                t = tile_dungeon3
                break
            case 70:
                t = tile_entrance1
                break
            case 69:
                t = tile_tower
                break
            case 92:
                t = tile_farm
                break
            case 101:
                t = sprite_tile_forest
                break
            case 126:
                t = spr_forestplaintile
                break
            case 102:
                t = sprite_tile_forest1_shade
                break
            case 103:
                t = sprite_tile_forest2
                break
            case 130:
                t = bg_tilefreezer
                break
            case 27:
                t = tile_freezer2
                break
            case 89:
                t = tile_graveyard1
                break
            case 91:
                t = tile_graveyard3
                break
            case 90:
                t = tile_graveyard2
                break
            case 52:
                t = tile_factory
                break
            case 29:
                t = tile_factory2424
                break
            case 133:
                t = spr_kidspartytile
                break
            case 105:
                t = sprite_tile_kungfu
                break
            case 106:
                t = tile_kunfucity
                break
            case 107:
                t = sprite_tile_kungfustructure
                break
            case 14:
                t = spr_mansiontile2
                break
            case 60:
                t = tile_castle
                break
            case 77:
                t = tile_medieval
                break
            case 78:
                t = tile_medieval2
                break
            case 79:
                t = tile_medieval3
                break
            case 108:
                t = sprite_tile_minigolf
                break
            case 109:
                t = sprite_tile_minigolf2
                break
            case 110:
                t = sprite_tile_minigolf2_shad
                break
            case 76:
                t = tile_secret
                break
            case 15:
                t = sprite_tile_space1
                break
            case 122:
                t = sprite_tile_spaceback1
                break
            case 116:
                t = sprite_tile_space2
                break
            case 115:
                t = spr_space3props
                break
            case 93:
                t = tile_pinball1
                break
            case 94:
                t = tile_pinball2
                break
            case 95:
                t = tile_pinball3
                break
            case 31:
                t = spr_pinballwooden
                break
            case 35:
                t = sprite_tile_war1
                break
            case 20:
                t = sprite_tile_war2
                break
            case 138:
                t = sprite_tile_war3
                break
            case 8:
                t = sprite_tile_war4
                break
            case 13:
                t = spr_warlab
                break
            case 33:
                t = sprite_tile_war1shadow
                break
            case 9:
                t = sprite_tile_space2shadow
                break
            case 141:
                t = sprite_tile_citycarnival
                break
            case 19:
                t = sprite_tile_citydark
                break
            case 129:
                t = spr_medievalinterior
                break
            case 143:
                t = spr_medievallibrary
                break
            case 5:
                t = spr_interiortile2
                break
            case 11:
                t = spr_desertsecret
                break
            case 4:
                t = spr_beachdeco
                break
            case 18:
                t = spr_foresttile1
                break
            case 28:
                t = spr_storagetile
                break
            case 119:
                t = spr_city1props
                break
            case 117:
                t = spr_graveyardmine
                break
            case 137:
                t = spr_exittile
                break
        }

        tilemap_sprite[i] = t
        var _w32 = (sprite_get_width(t) / 32)
        for (var yy = 0; yy < image_yscale; yy++)
        {
            for (var xx = 0; xx < image_xscale; xx++)
            {
                var _x = (x + (xx * 32))
                var _y = (y + (yy * 32))
                var data = tilemap_get_at_pixel(map_id, _x, _y)
                var _id = tile_get_index(data)
                var xi = 0
                var yi = 0
                xi = (_id % _w32)
                yi = floor((_id / _w32))
                array_push(tiles[i], [_x, _y, (xi * 32), (yi * 32)])
                data = tile_set_empty(data)
                tilemap_set_at_pixel(map_id, data, _x, _y)
            }
        }
    }
}
trace(tilemap_sprite)
if (array_length(tiles[0]) <= 0 && array_length(tiles[1]) <= 0 && array_length(tiles[2]) <= 0)
    instance_destroy()
layersprite = -4
