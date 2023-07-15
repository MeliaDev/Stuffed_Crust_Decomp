wastedhits = (maxhp - hp)
targetplayer = 530
image_speed = 0.35
switch state
{
    case (135 << 0):
        scr_pizzaface_p2_fall()
        break
    case (0 << 0):
        scr_pizzaface_p2_normal()
        break
    case (232 << 0):
        scr_pizzaface_p2_look()
        break
    case (233 << 0):
        scr_pizzaface_p2_fishing()
        break
    case (235 << 0):
        self.boss_pizzahead_bombrun()
        break
    case (236 << 0):
        self.boss_pizzahead_npcthrow()
        break
    case (237 << 0):
        boss_pizzahead_portraitthrow()
        break
    case (238 << 0):
        self.boss_pizzahead_enguarde()
        break
    case (239 << 0):
        self.boss_pizzahead_sexypicture()
        break
    case (240 << 0):
        boss_pizzahead_pullinglevel()
        break
    case (241 << 0):
        self.boss_pizzahead_eat()
        break
    case (242 << 0):
        self.boss_pizzahead_surprisebox()
        break
}

if place_meeting(x, y, obj_canonexplosion)
{
    if (!explosionhit)
    {
        explosionhit = 1
        hp--
    }
}
else
    explosionhit = 0
if (hp <= 0 && (!instance_exists(obj_fadeout)))
{
    with (obj_player)
    {
        targetRoom = boss_pizzaface_p3
        targetDoor = "A"
    }
    instance_create(0, 0, obj_fadeout)
}
scr_collide()
