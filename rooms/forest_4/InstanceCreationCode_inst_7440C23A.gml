if ((!global.pizzadelivery) && global.pizzasdelivered < 5 && global.panic == 0)
{
    if (!global.failcutscene)
    {
        if (global.pizzasdelivered <= 0)
            scene_info = [[cutscene_set_sprite, 1036, 2979, 0.35, -1], [cutscene_gustavo_start], [cutscene_wait, 30], [cutscene_set_sprite, 1036, 2970, 0.35, -1], [cutscene_wait, 10], [cutscene_move_player, 530, (obj_gustavo.x - 48), 6, 16], [cutscene_set_sprite, 530, 2959, 0.35, 1], [cutscene_set_sprite, 1036, 2971, 0.35, -1], [cutscene_gustavo_end]]
        else
            scene_info = [[cutscene_set_sprite, 1036, 2970, 0.35, -1]]
    }
    else
        scene_info = [[cutscene_gustavofail_start], [cutscene_wait, 20], [cutscene_set_sprite, 1036, 2974, 0.35, -1], [cutscene_waitfor_sprite, 1036], [cutscene_set_sprite, 1036, 2975, 0.35, -1], [cutscene_wait, 50], [cutscene_set_sprite, 1036, 2976, 0.35, -1], [cutscene_set_sprite, 530, 2962, 0.35, 1], [cutscene_waitfor_sprite, 1036], [cutscene_set_sprite, 1036, 2977, 0.35, -1], [cutscene_set_hsp, 1036, -12], [cutscene_set_sprite, 530, 2966, 0.35, 1], [cutscene_waitfor_sprite, 530], [cutscene_set_sprite, 530, 2967, 0.35, 1], [cutscene_check_collision, 1036, 530], [cutscene_set_hsp, 1036, 0], [cutscene_gustavofail_end, 100], [cutscene_move_actor, 1036, obj_gustavo.xstart, obj_gustavo.ystart, 0.05], [cutscene_set_sprite, 1036, 2970, 0.35, -1]]
}
else
    scene_info = [[cutscene_wait, 2]]
