event_inherited()
walkspr = spr_playerN_move
idlespr = spr_playerN_panicidle
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    walkspr = spr_player_move
    idlespr = spr_player_panic
}
image_speed = 0.35
