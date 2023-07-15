if (room == rm_editor)
    return;
if (sprite_index != spr_protojohn)
{
    var player = obj_player1.id
    if (player.x > (x - 400) && player.x < (x + 400) && player.y > (y - 300) && player.y < (y + 300) && (player.state == (41 << 0) || player.ratmount_movespeed == 12 || player.state == (121 << 0) || player.state == (31 << 0) || player.state == (184 << 0) || player.state == (20 << 0) || player.state == (38 << 0) || (player.state == (79 << 0) && player.swingdingdash <= 0 && player.sprite_index == player.spr_swingding)) && player.xscale != image_xscale)
        sprite_index = spr_hungrypillar_angry
    else
        sprite_index = spr_hungrypillar
}
