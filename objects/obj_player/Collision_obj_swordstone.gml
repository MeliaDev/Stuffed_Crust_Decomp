if (grounded && other.sprite_index == spr_swordstone && (state == (42 << 0) || state == (80 << 0) || state == (43 << 0)))
{
    transformationlives = 3
    fmod_event_one_shot_3d("event:/sfx/knight/start", x, y)
    global.SAGEknighttaken = 1
    momentum = 0
    movespeed = 0
    other.image_index = 1
    image_index = 0
    image_speed = 0.35
    sprite_index = spr_knightpepstart
    state = (47 << 0)
    hsp = 0
    vsp = 0
    notification_push((56 << 0), [room])
    create_transformation_tip(lang_get_value("knighttip"), "knight")
}
