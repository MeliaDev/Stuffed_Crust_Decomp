var lay_id = layer_get_id("Backgrounds_1")
var back_id = layer_background_get_id(lay_id)
var lay_id2 = layer_get_id("Backgrounds_2")
var back_id2 = layer_background_get_id(lay_id2)
var lay_id3 = layer_get_id("Backgrounds_3")
var back_id3 = layer_background_get_id(lay_id3)
if (global.panic == 1 && layer_background_get_sprite(back_id) == 2363)
    layer_background_sprite(back_id, 2362)
if (global.panic == 1 && layer_background_get_sprite(back_id) == 2359)
    layer_background_sprite(back_id, 2360)
if (global.panic == 1 && layer_background_get_sprite(back_id3) == 2367)
    layer_background_sprite(back_id3, 2369)
if (global.panic == 1 && layer_background_get_sprite(back_id) == 2297)
    layer_background_sprite(back_id, 2300)
if (global.panic == 1 && layer_background_get_sprite(back_id) == 2303)
    layer_background_sprite(back_id, 2307)
if (global.panic == 1 && layer_background_get_sprite(back_id2) == 2308)
    layer_background_sprite(back_id2, 2309)
if (global.panic == 1 && layer_background_get_sprite(back_id) == 2435)
    layer_background_sprite(back_id, 2436)
if (global.panic == 1 && layer_background_get_sprite(back_id2) == 2433)
    layer_background_sprite(back_id2, 2434)
if (global.panic == 1 && layer_background_get_sprite(back_id3) == 2425)
    layer_background_sprite(back_id3, 2427)
var theroomname = room_get_name(room)
if (string_pos("secret", theroomname) != 0)
    debrisspr = choose(1498, 1535, 4220, 2810, 3297)
else if (string_pos("badland", theroomname) != 0 || string_pos("desert", theroomname) != 0)
{
    debrisspr = choose(344, 1679, 831, 1500, 1539, 1538)
    if (irandom(100) == 7 || irandom(100) == 77)
    {
        debrisspr = choose(189, 363, 365, 418, 419, 482, 898, 571, 1005, 1001, 475, 473)
        if (global.tribecheesecensor == 1)
        {
            if (debrisspr == spr_totemcheese_inactive)
                debrisspr = spr_weathermachine
            if (debrisspr == spr_totemcloud_attack)
                debrisspr = spr_wmcloud_attack
            if (debrisspr == spr_indiancheese_stun)
                debrisspr = spr_ufolive_dead
            if (debrisspr == spr_indiancheese_dead)
                debrisspr = spr_ufogrounded_stun
        }
    }
}
else if (string_pos("strongcold", theroomname) != 0 || string_pos("freezer", theroomname) != 0)
{
    debrisspr = choose(1874, 3354, 3396, 420, 2633)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 182, 3547, 379, 381, 2714, 2272, 2103, 2144, 1515)
}
else if (string_pos("factory", theroomname) != 0 || string_pos("industrial", theroomname) != 0)
{
    debrisspr = choose(1479, 439, 3406, 1540, 1858, 2010, 2565, 8, 1)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 142, 148, 286, 288, 284, 287, 93, 117, 108, 1958, 2272, 274, 279, 280, 3814, 866)
}
else if (string_pos("space", theroomname) != 0 || string_pos("ufo", theroomname) != 0)
{
    debrisspr = choose(3336, 3579, 2474, 3996, 420, 490)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 479, 482, 898, 3083, 480, 903, 2123, 505, 510, 1203, 3282, 997, 4153, 3628)
}
else if (string_pos("plage", theroomname) != 0 || string_pos("beach", theroomname) != 0)
{
    debrisspr = choose(841, 2890, 529, 1990)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 452, 505, 510, 229, 236, 173, 178, 3012, 3288, 306, 497, 536, 544)
}
else if (string_pos("forest", theroomname) != 0 || string_pos("plain", theroomname) != 0)
{
    debrisspr = choose(3458, 3765, 4002, 500, 2089)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(2259, 189, 207, 215, 513, 522, 525, 530, 431, 438, 383, 385, 459, 2379, 2629, 2631, 2634, 2636, 2637, 2653, 2654, 2655, 2657, 2659, 4202, 2640, 2641, 2646, 2649, 2650, 2652)
}
else if (string_pos("street", theroomname) != 0 || string_pos("city", theroomname) != 0)
{
    debrisspr = choose(3819, 3854, 3887, 1342, 3362, 4058)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 319, 693, 2446, 3475, 3715, 338, 593, 1400, 2218)
}
else if (string_pos("tutorial", theroomname) != 0)
{
    debrisspr = choose(3552, 2092, 2094, 2091, 2090, 2089)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 2609, 296)
}
else if (string_pos("tower", theroomname) != 0)
    debrisspr = choose(344, 1679, 831, 1874, 490, 1539, 3354, 3396, 3336, 3579, 439, 3406, 841, 2890, 3458, 3765, 3819, 3854, 3887, 445, 4191, 1865, 3539, 1501, 1499, 1676, 1501, 1499, 1676, 3740, 2993, 3458, 1207, 3349, 1524, 1308, 4090, 4075, 1407, 529, 752, 829, 4007, 1748, 1524, 1858, 1308, 2902, 3552, 2092, 2094, 2091, 2090, 2089, 1209, 3802, 1011, 2628, 3848, 4263, 4262, 2810, 3226, 3362, 1540, 1500, 1486, 1494, 2010, 2282, 2474, 2565, 2960, 3494, 3578, 3597, 3996, 4058, 420, 1538, 4002, 2716, 1936, 8, 1, 2177)
else if (string_pos("ruin", theroomname) != 0)
{
    debrisspr = choose(445, 4191, 1865, 3539, 1494)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 142, 207, 215, 383, 385, 298, 304, 2092, 463, 464)
}
else if (string_pos("entrance", theroomname) != 0)
{
    debrisspr = choose(483, 1501, 1499, 1676, 1494)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 452, 455, 459, 207, 215, 3513, 296)
}
else if (string_pos("farm", theroomname) != 0)
{
    debrisspr = choose(3740, 2993, 3458)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 3696, 3245, 343, 2584, 2244, 3817, 2241, 3796, 2501)
}
else if (string_pos("kidsparty", theroomname) != 0)
{
    debrisspr = choose(3494, 3597, 4090, 1540, 1961)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 644, 3456, 3981, 2856, 4052, 1000, 3712, 3332, 296, 306)
}
else if (string_pos("sewer", theroomname) != 0)
{
    debrisspr = choose(4090, 4075, 1407)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 452, 455, 2427, 634, 3440, 4170, 321, 322, 371, 374, 296, 510, 505, 3513, 2813)
}
else if (string_pos("chateau", theroomname) != 0)
{
    debrisspr = choose(1524, 1308, 2902)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 207, 215, 298, 304, 628, 616, 3957, 1066, 3561, 438, 431, 463, 464)
}
else if (string_pos("saloon", theroomname) != 0)
{
    debrisspr = choose(752, 829, 4007)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 363, 365, 475, 473, 4001, 214, 465, 466, 2486, 2022, 3851, 2255)
}
else if (string_pos("war", theroomname) != 0)
{
    debrisspr = choose(1207, 3349, 1011, 2960, 3226, 3406, 3597)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 1441, 3208, 997, 3638, 3677, 778, 558, 559, 3880, 2965, 2255)
}
else if (string_pos("medieval", theroomname) != 0)
{
    debrisspr = choose(1524, 1308, 1501, 1499, 1676)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 207, 215, 298, 304, 628, 438, 431, 1066, 2488, 2813, 2020, 463, 464)
}
else if (string_pos("golf", theroomname) != 0)
{
    debrisspr = choose(1748, 2716, 1858, 2010, 2282, 2716, 1936)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 1697, 3209, 431, 438, 1351, 3474, 327, 323, 1556, 2391)
}
else if (string_pos("graveyard", theroomname) != 0)
{
    debrisspr = choose(1209, 3802, 2628, 3578, 2230)
    if (irandom(100) == 7 || irandom(100) == 77)
    {
        debrisspr = choose(189, 3477, 590, 418, 419, 475, 473, 459, 458, 1921, 2228, 3284, 3606)
        if (global.tribecheesecensor == 1)
        {
            if (debrisspr == spr_indiancheese_stun)
                debrisspr = spr_ufolive_dead
            if (debrisspr == spr_indiancheese_dead)
                debrisspr = spr_ufogrounded_stun
        }
    }
}
else if (string_pos("dungeon", theroomname) != 0)
{
    debrisspr = choose(3848, 3695)
    if (irandom(100) == 7 || irandom(100) == 77)
        debrisspr = choose(189, 2228, 3284, 385, 383, 311, 317, 207, 215, 1970, 1974)
}
else
    debrisspr = spr_debris
