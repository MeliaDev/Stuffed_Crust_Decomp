global.coop = 0
global.currentsavefile = 1
var achievement_arr = ["sranks1", "sranks2", "sranks3", "sranks4", "sranks5"]
var data_arr = ["saves/saveData1.ini", "saves/saveData2.ini", "saves/saveData3.ini"]
global.stickreq[0] = 100
global.stickreq[1] = 150
global.stickreq[2] = 200
global.stickreq[3] = 200
global.stickreq[4] = 210
global.levelattempts = 0
global.palette_arr = [0, 0, 0, 0, 0]
for (var i = 0; i < array_length(data_arr); i++)
{
    ini_open(data_arr[i])
    if (i == 0)
        global.percentage_1 = ini_read_real("Game", "percent", 0)
    else if (i == 1)
        global.percentage_2 = ini_read_real("Game", "percent", 0)
    else if (i == 2)
        global.percentage_3 = ini_read_real("Game", "percent", 0)
    global.game_started[i] = ini_read_real("Tutorial", "finished", 0)
    global.game_judgement[i] = ini_read_string("Game", "finalrank", "none")
    global.game_john[i] = ini_read_real("Game", "john", 0)
    global.game_snotty[i] = ini_read_real("Game", "finalsnotty", 0)
    global.game_palette[i] = ini_read_real("Game", "palette", 1)
    var _texture = ini_read_string("Game", "palettetexture", "none")
    global.game_palettetexture[i] = scr_get_texture_palette(_texture)
    for (var j = 0; j < array_length(achievement_arr); j++)
    {
        if ini_read_real("achievements", achievement_arr[j], 0)
            global.palette_arr[j] = 1
    }
    ini_close()
}
global.newtoppin[0] = 0
global.newtoppin[1] = 0
global.newtoppin[2] = 0
global.newtoppin[3] = 0
global.newtoppin[4] = 0
global.panicbg = 0
global.panictilt = 0
global.afterimage_color1 = make_colour_rgb(255, 0, 0)
global.afterimage_color2 = make_colour_rgb(0, 255, 0)
global.afterimage_color3 = make_colour_rgb(178, 26, 231)
global.smallnumber_color1 = make_colour_rgb(255, 255, 255)
global.smallnumber_color2 = make_colour_rgb(248, 0, 0)
global.optimize = 0
global.autotile = 1
global.smallnumber_fnt = font_add_sprite_ext(spr_smallnumber, "1234567890-+", 1, 0)
global.pigreduction = 0
global.pigtotal = 0
global.levelcomplete = 0
global.levelcompletename = -4
global.entrancetreasure = 0
global.medievaltreasure = 0
global.ruintreasure = 0
global.dungeontreasure = 0
global.deserttreasure = 0
global.graveyardtreasure = 0
global.farmtreasure = 0
global.spacetreasure = 0
global.beachtreasure = 0
global.foresttreasure = 0
global.pinballtreasure = 0
global.golftreasure = 0
global.streettreasure = 0
global.sewertreasure = 0
global.factorytreasure = 0
global.freezertreasure = 0
global.chateautreasure = 0
global.mansiontreasure = 0
global.kidspartytreasure = 0
global.wartreasure = 0
global.entrancecutscene = -4
global.medievalcutscene = -4
global.ruincutscene = -4
global.ruincutscene2 = -4
global.ruincutscene3 = -4
global.dungeoncutscene = -4
global.peppermancutscene1 = -4
global.peppermancutscene2 = -4
global.chieftaincutscene = -4
global.chieftaincutscene2 = -4
global.desertcutscene = -4
global.graveyardcutscene = -4
global.spacecutscene = -4
global.vigilantecutscene1 = -4
global.vigilantecutscene2 = -4
global.vigilantecutscene3 = -4
global.farmcutscene = -4
global.superpinballcutscene = -4
global.pubcutscene = -4
global.pinballcutscene = -4
global.beercutscene = -4
global.exitfeecutscene = -4
global.forestcutscene = -4
global.bottlecutscene = -4
global.papercutscene = -4
global.beachboatcutscene = -4
global.beachcutscene = -4
global.sewercutscene = -4
global.burgercutscene = -4
global.golfcutscene = -4
global.anarchistcutscene1 = -4
global.anarchistcutscene2 = -4
global.factoryblock = -4
global.streetcutscene = -4
global.graffiticutscene = -4
global.factorygraffiti = -4
global.factorycutscene = -4
global.hatcutscene1 = -4
global.hatcutscene2 = -4
global.hatcutscene3 = -4
global.jetpackcutscene = -4
global.noisecutscene1 = -4
global.noisecutscene2 = -4
global.freezercutscene = -4
global.kidspartycutscene = -4
global.gasolinecutscene = -4
global.mansioncutscene = -4
global.chateaucutscene = -4
global.ghostsoldiercutscene = -4
global.mrstickcutscene1 = -4
global.mrstickcutscene2 = -4
global.mrstickcutscene3 = -4
global.chateauswap = -4
global.warcutscene = -4
global.secret = 0
pal_swap_init_system(8)
with (obj_player1)
    state = (0 << 0)
global.loadeditor = 0
if global.longintro
{
    global.longintro = 0
    room_goto(Longintro)
}
else
    room_goto(Mainmenu)
instance_destroy(obj_cutscene_handler)
