if (obj_player.ghostdash == 0 && cooldown == 0)
    visible = true
if (cooldown > 0)
    cooldown--
if (obj_player.state != (16 << 0) && (obj_player1.state != (61 << 0) || obj_player1.tauntstoredstate != (16 << 0)))
    image_alpha = 0.35
else
    image_alpha = 1
