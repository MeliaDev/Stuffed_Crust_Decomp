flash = 1
if (state != (295 << 0) && state != (273 << 0) && state != (289 << 0) && (!ballooncrash) && (!instance_exists(obj_noiseballooncrash)))
    fmod_event_one_shot_3d("event:/sfx/misc/bossvulnerable", x, y)
