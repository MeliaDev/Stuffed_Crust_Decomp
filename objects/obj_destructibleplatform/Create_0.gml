falling = 0
reset = 100
image_speed = 0
depth = 0
idlespr = spr_cheeseblock
reformspr = spr_cheeseblock_reform
fallingspr = spr_cheeseblock_falling
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    idlespr = choose(4215, 4212)
    if (idlespr == spr_cottoncandyblock_pink)
    {
        reformspr = spr_cottoncandyblock_pink_reform
        fallingspr = spr_cottoncandyblock_pink_falling
    }
    if (idlespr == spr_cottoncandyblock_blue)
    {
        reformspr = spr_cottoncandyblock_blue_reform
        fallingspr = spr_cottoncandyblock_blue_falling
    }
}
sprite_index = idlespr
