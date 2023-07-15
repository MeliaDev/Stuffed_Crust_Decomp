if (room == rm_editor)
    return;
sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
with (obj_player)
{
    if (character == "P" && ispeppino)
        other.sprite_index = choose(spr_shroomcollect, spr_tomatocollect, spr_cheesecollect, spr_sausagecollect, spr_pineapplecollect)
    else if (character == "N" || (character == "P" && (!ispeppino)))
        other.sprite_index = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5, spr_xmastopping1, spr_xmastopping2, spr_xmastopping3, spr_xmastopping4, spr_xmastopping5)
}
if (current_month == 12)
    sprite_index = choose(spr_xmastopping1, spr_xmastopping2, spr_xmastopping3, spr_xmastopping4, spr_xmastopping5)
if (current_month == 10)
    sprite_index = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5)
with (other)
{
    image_speed = 0.35
    global.collected = 0
    global.collectsound = 0
}
if (obj_player.character == "S")
    sprite_index = spr_snickcollectible1
depth = 11
