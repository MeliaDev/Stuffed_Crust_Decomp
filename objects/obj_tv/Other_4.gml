isgustavo = obj_player.isgustavo
var r = string_letters(room_get_name(room))
if (r != "towertutorial" && string_copy(r, 1, 5) == "tower")
{
    timer_tower = 1
    if global.panic
    {
        instance_destroy(obj_gusbrickchase)
        instance_destroy(obj_gusbrickfightball)
        instance_destroy(obj_peppermanvengeful)
        instance_destroy(obj_gusbrickhurt)
        instance_destroy(obj_gusbrickpoker)
        instance_destroy(obj_noisevengeful)
        instance_destroy(obj_noisewashingmachinetower)
        instance_destroy(obj_gusbrickhub)
        instance_destroy(obj_vigilanteunsure)
        instance_destroy(obj_tutorialbook)
    }
}
else
    timer_tower = 0
tv_bg_index = 0
tv_bg_sprite = spr_tv_bgfinal
var theroomname = room_get_name(room)
if (string_pos("secret", theroomname) != 0)
{
    if global.panic
        newbgsprite = spr_gate_secretBG_panic
    else
        newbgsprite = spr_gate_secretBG
    bgspriteswitch = 1
}
else
{
    switch global.leveltosave
    {
        case "entrance":
            tv_bg_index = 1
            newbgsprite = spr_gate_entranceBG
            break
        case "medieval":
            tv_bg_index = 2
            newbgsprite = spr_gate_medievalBG
            break
        case "ruin":
            tv_bg_index = 3
            newbgsprite = spr_gate_ruinBG
            break
        case "dungeon":
            tv_bg_index = 4
            newbgsprite = spr_gate_dungeonBG
            break
        case "badland":
            tv_bg_index = 5
            if (room == badland_9)
            {
                newbgsprite = spr_gate_spaceBG
                if (bgsprite == spr_gate_badlandBG)
                    bgspriteswitch = 1
            }
            else
            {
                newbgsprite = spr_gate_badlandBG
                if (bgsprite == spr_gate_spaceBG)
                    bgspriteswitch = 1
            }
            break
        case "graveyard":
            tv_bg_index = 6
            newbgsprite = spr_gate_graveyardBG
            break
        case "farm":
            tv_bg_index = 7
            newbgsprite = spr_gate_farmBG
            break
        case "saloon":
            tv_bg_index = 8
            newbgsprite = spr_gate_saloonBG
            break
        case "plage":
            tv_bg_index = 9
            newbgsprite = spr_gate_plageBG
            break
        case "forest":
            if isgustavo
                tv_bg_index = 12
            else
                tv_bg_index = 10
            newbgsprite = spr_gate_forestBG
            break
        case "space":
            tv_bg_index = 11
            newbgsprite = spr_gate_spaceBG
            break
        case "minigolf":
            tv_bg_index = 12
            newbgsprite = spr_gate_golfBG
            break
        case "street":
            if isgustavo
            {
                tv_bg_sprite = spr_tv_bgfinal_bonus
                tv_bg_shadow = 4398
                tv_bg_index = 2
            }
            else
            {
                tv_bg_sprite = spr_tv_bgfinal
                tv_bg_shadow = 4399
                tv_bg_index = 13
            }
            newbgsprite = spr_gate_streetBG
            break
        case "sewer":
            tv_bg_index = 14
            newbgsprite = spr_gate_sewerBG
            break
        case "industrial":
            tv_bg_index = 15
            if (room == industrial_3 || room == industrial_4 || room == industrial_5)
            {
                newbgsprite = spr_gate_factoryBG
                if (bgsprite == spr_gate_industrialBG)
                    bgspriteswitch = 1
            }
            else
            {
                newbgsprite = spr_gate_industrialBG
                if (bgsprite == spr_gate_factoryBG)
                    bgspriteswitch = 1
            }
            break
        case "freezer":
            tv_bg_index = 16
            newbgsprite = spr_gate_freezerBG
            break
        case "chateau":
            tv_bg_index = 17
            newbgsprite = spr_gate_chateauBG
            break
        case "kidsparty":
            tv_bg_index = 18
            newbgsprite = spr_gate_kidspartyBG
            break
        case "war":
            tv_bg_index = 19
            newbgsprite = spr_gate_warBG
            break
        case "mansion":
            if isgustavo
            {
                tv_bg_sprite = spr_tv_bgfinal
                tv_bg_shadow = 4399
                tv_bg_index = 18
            }
            else
            {
                tv_bg_sprite = spr_tv_bgfinal_bonus
                tv_bg_shadow = 4398
                tv_bg_index = 0
            }
            newbgsprite = spr_gate_mansionBG
            break
        case "dragon":
            tv_bg_sprite = spr_tv_bgfinal_bonus
            tv_bg_index = 1
            break
        case "kungfu":
            tv_bg_sprite = spr_tv_bgfinal_bonus
            tv_bg_index = 2
            break
        case "pinball":
            tv_bg_sprite = spr_tv_bgfinal_bonus
            tv_bg_index = 3
            break
        case "pizzaland":
            tv_bg_sprite = spr_tv_bgfinal_bonus
            tv_bg_index = 4
            break
        case "freefall":
            tv_bg_sprite = spr_tv_bgfinal_bonus
            tv_bg_index = 5
            break
        case "strongcold":
            tv_bg_sprite = spr_tv_bgfinal_bonus
            tv_bg_index = 6
            break
    }

    if (bgsprite == spr_gate_secretBG || bgsprite == spr_gate_secretBG_panic)
        bgspriteswitch = 1
}
if (prevbgsprite != newbgsprite)
{
    prevbgsprite = newbgsprite
    if (bgspriteswitch == 1)
    {
        tv_trans = 0
        state = (250 << 0)
        bgspriteswitch = 0
        dotransition = 1
    }
    else
        bgsprite = newbgsprite
}
if (global.tvbackground && drawing == 0)
    scr_hub_bg_reinit(x, y)
if (special_prompts == -4 && room != Realtitlescreen && room != characterselect)
{
    special_prompts = ds_map_create()
    ini_open(concat("saveData", global.currentsavefile, ".ini"))
    ds_map_set(special_prompts, "knight", ini_read_real("Prompts", "knight", 0))
    ds_map_set(special_prompts, "boxxedpep", ini_read_real("Prompts", "boxxedpep", 0))
    ds_map_set(special_prompts, "mort", ini_read_real("Prompts", "mort", 0))
    ds_map_set(special_prompts, "squished", ini_read_real("Prompts", "squished", 0))
    ds_map_set(special_prompts, "skateboard", ini_read_real("Prompts", "skateboard", 0))
    ds_map_set(special_prompts, "cheeseball", ini_read_real("Prompts", "cheeseball", 0))
    ds_map_set(special_prompts, "shotgun", ini_read_real("Prompts", "shotgun", 0))
    ds_map_set(special_prompts, "ghost", ini_read_real("Prompts", "ghost", 0))
    ds_map_set(special_prompts, "firemouth", ini_read_real("Prompts", "firemouth", 0))
    ds_map_set(special_prompts, "fireass", ini_read_real("Prompts", "fireass", 0))
    ds_map_set(special_prompts, "bombpep", ini_read_real("Prompts", "bombpep", 0))
    ds_map_set(special_prompts, "rocket", ini_read_real("Prompts", "rocket", 0))
    ini_close()
}
if (room == Realtitlescreen)
{
    if (special_prompts != -4)
        ds_map_destroy(special_prompts)
    special_prompts = -4
}
switch room
{
    case entrance_1:
        global.srank = 16000
        break
    case 39:
        global.srank = 20000
        break
    case 54:
        global.srank = 17000
        break
    case 71:
        global.srank = 18500
        break
    case 719:
        global.srank = 19500
        break
    case 123:
        global.srank = 20500
        break
    case 687:
        global.srank = 20000
        break
    case 138:
        global.srank = 19000
        break
    case 706:
        global.srank = 23000
        break
    case 194:
        global.srank = 19000
        break
    case 241:
        global.srank = 20000
        break
    case 229:
        global.srank = 23000
        break
    case 559:
        global.srank = 30000
        break
    case 830:
        global.srank = 20000
        break
    case 672:
        global.srank = 20000
        break
    case 441:
        global.srank = 18200
        break
    case 244:
        global.srank = 18000
        break
    case 596:
        global.srank = 22000
        break
    case 526:
        global.srank = 21500
        break
    case 739:
        global.srank = 5500
        break
    case 513:
        global.srank = 6
        break
    case 514:
        global.srank = 6
        break
    case 515:
        global.srank = 5
        break
    case 783:
        global.srank = 4
        break
    case 570:
        global.srank = 18000
        break
}

global.arank = floor((global.srank / 2))
global.brank = floor((global.arank / 2))
global.crank = floor((global.brank / 2))
if (room == custom_lvl_room)
    alarm[1] = 4
