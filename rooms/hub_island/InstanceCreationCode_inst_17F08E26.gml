if (global.levelcompletename == "FOREST")
{
    if (global.levelcomplete && (!global.forestcutscene))
    {
        currentroom = room
        global.forestcutscene = 1
        scene_info = [[cutscene_entrance_start], [cutscene_waitfor_sprite, 530], [cutscene_player_idleanim], [cutscene_change_room, 628], [cutscene_set_player_visible, 0], [cutscene_player_float, 1], [cutscene_set_player_pos, 836, 434], [cutscene_wait, 150], [cutscene_change_room, currentroom], [cutscene_player_float, 0], [cutscene_set_player_visible, 1], [cutscene_forest_end]]
    }
    else
        scene_info = [[cutscene_wait, 20]]
}
else if (global.levelcomplete && (!global.beachcutscene) && global.levelcompletename != "FOREST")
{
    currentroom = room
    peppermanactorID = noone
    boatactorID = noone
    scene_info = [[cutscene_entrance_start], [cutscene_waitfor_sprite, 530], [cutscene_player_idleanim], [cutscene_change_room, 662], [cutscene_set_player_visible, 0], [cutscene_player_float, 1], [cutscene_set_player_pos, 923, 281], [cutscene_wait, 60], [function() //anon_gml_RoomCC_hub_island_4_Create_1208_gml_RoomCC_hub_island_4_Create
    {
        boatactorID = instance_create(632, 32, obj_actor)
        boatactorID.sprite_index = spr_cheeseboat
        boatactorID.vsp = 0
        boatactorID.hsp = 0
        peppermanactorID = instance_create((boatactorID.x + (boatactorID.sprite_width / 2)), (boatactorID.y - 48), obj_actor)
        peppermanactorID.sprite_index = spr_pepperman_idle
        cutscene_end_action()
    }
], [function() //anon_gml_RoomCC_hub_island_4_Create_1631_gml_RoomCC_hub_island_4_Create
    {
        var _finish = 0
        with (boatactorID)
        {
            y += vsp
            if (vsp < 20)
                vsp += 0.5
            if (y > 448)
            {
                y = 448
                vsp = 0
                _finish = 1
            }
        }
        peppermanactorID.y = (boatactorID.y - 48)
        if _finish
            cutscene_end_action()
    }
], [function() //anon_gml_RoomCC_hub_island_4_Create_2003_gml_RoomCC_hub_island_4_Create
    {
        _finish = 0
        with (boatactorID)
        {
            x += hsp
            hsp += 0.5
            if place_meeting((x + sign(hsp)), y, obj_solid)
            {
                _finish = 1
                hsp = 0
            }
        }
        peppermanactorID.x = (boatactorID.x + (boatactorID.sprite_width / 2))
        if _finish
            cutscene_end_action()
        global.beachcutscene = 1
    }
], [cutscene_camera_shake, 4, (3 / room_speed)], [cutscene_soundeffect, sfx_groundpound], [cutscene_wait, 60], [cutscene_change_room, currentroom], [cutscene_player_float, 0], [cutscene_set_player_visible, 1], [cutscene_beach_end]]
}
else
    scene_info = [[cutscene_wait, 20]]
