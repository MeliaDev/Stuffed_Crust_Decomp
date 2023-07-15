function scr_add_grannypizzaboss(argument0, argument1, argument2) //scr_add_grannypizzaboss
{
    var q = scr_add_grannypizzalevel(argument1, argument2, 0, 0, 0, 1)
    ini_open_from_string(obj_savesystem.ini_str)
    if (ini_read_real(argument0, "unlocked", 0) == 0)
        array_pop(levelarray)
    ini_close()
}

function scr_add_grannypizzalevel(argument0, argument1, argument2, argument3, argument4, argument5) //scr_add_grannypizzalevel
{
    if (argument2 == undefined)
        argument2 = 1
    if (argument3 == undefined)
        argument3 = 1
    if (argument4 == undefined)
        argument4 = 1
    if (argument5 == undefined)
        argument5 = 1
    q = 
    {
        icon: argument1,
        secrets: argument2,
        secretcount: 0,
        toppins: argument3,
        toppinarr: [0, 0, 0, 0, 0],
        treasure: argument4,
        gottreasure: 0,
        rank: argument5,
        gotrank: -4
    }

    ini_open_from_string(obj_savesystem.ini_str)
    if q.secrets
        q.secretcount = ini_read_real("Secret", argument0, 0)
    if q.toppins
    {
        for (var i = 0; i < array_length(q.toppinarr); i++)
            q.toppinarr[i] = ini_read_real("Toppin", concat(argument0, (i + 1)), 0)
    }
    if q.treasure
        q.gottreasure = ini_read_real("Treasure", argument0, 0)
    if q.rank
        q.gotrank = ini_read_string("Ranks", argument0, "none")
    ini_close()
    array_push(levelarray, q)
    return q;
}

