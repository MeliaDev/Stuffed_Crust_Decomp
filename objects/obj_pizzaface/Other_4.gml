sprite_index = spr_pizzaface_laughspawn
image_alpha = 0
image_index = 0
savedx = x
savedy = y
savedcx = camera_get_view_x(view_camera[0])
savedcy = camera_get_view_y(view_camera[0])
if instance_exists(obj_player1)
{
    x = obj_player1.x
    y = obj_player1.y
}
if instance_exists(obj_treasure)
    treasure = 1
else
{
    with (instance_create(x, y, obj_objecticontracker))
    {
        objectID = other.id
        sprite_index = spr_icon_pizzaface
        image_speed = 0.18
    }
    treasure = 0
}
if (room == rank_room)
    instance_destroy()
var playerid = 530
if (playerid.x >= x)
    playerside = 1
else
    playerside = 0
prevplayerside = playerside
