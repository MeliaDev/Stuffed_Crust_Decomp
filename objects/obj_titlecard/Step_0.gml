isnoise = (obj_player.character == "N" || (obj_player.character == "P" && (!obj_player.ispeppino)))
if (!fadein)
{
    fadealpha = Approach(fadealpha, 1, 0.1)
    if (fadealpha >= 1)
    {
        fadein = 1
        start = 1
        music = 0
        alarm[0] = 180
    }
}
else
{
    fadealpha = Approach(fadealpha, 0, 0.1)
    if (fadealpha <= 0 && (!music) && title_music != -4)
    {
        music = 1
        fmod_event_one_shot(title_music)
    }
}
if isnoise
{
    if (titlecard_sprite == spr_titlecards)
        titlecard_sprite = spr_titlecards_noise
    if (titlecard_sprite == spr_titlecards_bonus)
        titlecard_sprite = spr_titlecards_bonus_noise
    if (title_sprite == spr_titlecards_title)
        title_sprite = spr_titlecards_title_thenoisein
    if (title_sprite == spr_titlecards_title2)
        title_sprite = spr_titlecards_title_thenoisein2
    if (title_sprite == spr_titlecards_title_bonus)
        title_sprite = spr_titlecards_title_bonus_thenoisein
}
