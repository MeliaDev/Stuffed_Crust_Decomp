if (is_bossroom() || room == editor_room || room == Titlescreen || instance_exists(obj_tutorialbook))
    return;
visible = obj_tv.visible
if (!global.heatmeter)
{
    visible = false
    active = 0
}
else
    active = 1
if active
{
    var pop = spr_mildpop
    var idle = 56
    switch global.stylethreshold
    {
        case 0:
            pop = spr_endpop
            idle = 4258
            break
        case 1:
            pop = spr_mildpop
            idle = 56
            break
        case 2:
            pop = spr_antsypop
            idle = 4140
            break
        case 3:
            pop = spr_madpop
            idle = 3269
            break
        case 4:
            pop = spr_crazypop
            idle = 1354
            break
        default:
            pop = spr_endpop
            idle = 4258
            break
    }

    if (global.style > 55 && global.stylethreshold < 4)
    {
        global.stylethreshold += 1
        global.style = (global.style - 55)
        switch global.stylethreshold
        {
            case 0:
                pop = spr_endpop
                idle = 4258
                break
            case 1:
                pop = spr_mildpop
                idle = 56
                break
            case 2:
                pop = spr_antsypop
                idle = 4140
                break
            case 3:
                pop = spr_madpop
                idle = 3269
                break
            case 4:
                pop = spr_crazypop
                idle = 1354
                break
            default:
                pop = spr_endpop
                idle = 4258
                break
        }

        index = 0
        sprite = pop
        scr_heatup()
    }
    if (global.style < 0 && global.stylethreshold != 0)
    {
        global.stylethreshold -= 1
        global.style = (global.style + 55)
        switch global.stylethreshold
        {
            case 0:
                pop = spr_endpop
                idle = 4258
                break
            case 1:
                pop = spr_mildpop
                idle = 56
                break
            case 2:
                pop = spr_antsypop
                idle = 4140
                break
            case 3:
                pop = spr_madpop
                idle = 3269
                break
            case 4:
                pop = spr_crazypop
                idle = 1354
                break
            default:
                pop = spr_endpop
                idle = 4258
                break
        }

        index = 0
        sprite = pop
        scr_heatdown()
    }
    if (sprite == pop && floor(index) == (sprite_get_number(sprite) - 1))
        sprite = idle
    if (global.style < 0 && global.stylethreshold == 0)
        global.style = 0
    if (global.stylethreshold == 4 && global.style > 55)
        global.style = 55
    visible = obj_tv.visible
    if (obj_player.y < 200)
        alpha = 0.3
    else if (!((room == rank_room || room == timesuproom || room == boss_room1 || room == Realtitlescreen || room == characterselect)))
        alpha = 1
    index += 0.35
    global.stylemultiplier = ((global.style + (global.stylethreshold * 55)) / 240)
}
if (global.style < 0)
    global.style = 0
if (global.baddiespeed < 1)
    global.baddiespeed = 1
