function scr_panicbg_start() //scr_panicbg_start
{
    if (event_type == 8 && event_number == 0)
    {
        shader_set(shd_panicbg)
        var panic_id = shader_get_uniform(shd_panicbg, "panic")
        shader_set_uniform_f(panic_id, (global.wave / global.maxwave))
        var time_id = shader_get_uniform(shd_panicbg, "time")
        shader_set_uniform_f(time_id, (current_time / 1000))
        shader_reset()
    }
}

