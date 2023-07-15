sprite_index = choose(spr_shroomcollect, spr_cheesecollect, spr_tomatocollect, spr_sausagecollect, spr_pineapplecollect)
sprite_index = choose(spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5, spr_xmastopping1, spr_xmastopping2, spr_xmastopping3, spr_xmastopping4, spr_xmastopping5)
grav = 0.5
hsp = random_range(-10, 10)
vsp = random_range(-5, 0)
if (obj_player.character == "S")
    sprite_index = spr_snickcollectible1
