visible = obj_camera.visible
if visible
{
    if (global.hardmode && room != strongcold_endscreen && room != rank_room && room != timesuproom && room != Realtitlescreen && room != characterselect && (!is_bossroom()))
    {
        if (!instance_exists(obj_hardmode_ghost))
            instance_create(obj_player1.x, obj_player1.y, obj_hardmode_ghost)
    }
}
