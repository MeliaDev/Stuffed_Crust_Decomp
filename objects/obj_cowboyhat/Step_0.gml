x = obj_player.x
y = ((sprite_get_bbox_top(obj_player.sprite_index) + obj_player.y) - 40)
depth = (obj_player.depth - 1)
image_xscale = obj_player.xscale
if (obj_player.state == (38 << 0) || obj_player.state == (47 << 0) || room == rank_room)
    visible = false
else if (global.cowboyhat == 1)
    visible = true
else
    visible = false
