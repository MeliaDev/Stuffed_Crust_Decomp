if other.key_up2
{
    savenow = 1
    var shootkey = real(global.shootkeyattack)
    shootkey += 1
    if (shootkey > 4)
        shootkey = 0
    global.shootkeyattack = shootkey
}
