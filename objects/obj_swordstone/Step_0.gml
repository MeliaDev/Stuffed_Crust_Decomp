if (room == rm_editor)
{
}
if (obj_player.state == (47 << 0) || (obj_player.state == (61 << 0) && (obj_player.tauntstoredstate == (47 << 0) || obj_player.tauntstoredstate == (38 << 0))) || obj_player.state == (48 << 0) || obj_player.state == (38 << 0) || obj_player.state == (49 << 0) || (obj_player1.character == "S" && obj_player1.key_attack && sprite_index == spr_swordstone))
    sprite_index = spr_swordstonetaken
else
    sprite_index = spr_swordstone
if (sprite_index == spr_swordstone && (!instance_exists(ID)) && room != boss_pizzaface && obj_player1.character != "S")
{
    with (instance_create(x, (y - 20), obj_grabmarker))
        other.ID = id
}
else if (sprite_index == spr_swordstonetaken && instance_exists(ID))
    instance_destroy(ID)
