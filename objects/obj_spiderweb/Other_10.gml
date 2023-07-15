active = 0
var _dir = -1
var offset = (obj_camera.cam_width + 32)
if (obj_player1.xscale == 1)
{
    offset = (-((obj_camera.cam_width + 32)))
    _dir = 1
}
var xx = (obj_camera.tx + offset)
with (instance_create(xx, y, obj_spider))
{
    image_xscale = _dir
    webID = other.id
}
