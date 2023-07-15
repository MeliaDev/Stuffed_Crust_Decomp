targetRoom = entrance_1
level = "entrance"
group_arr = ["entrancegroup"]
if (obj_player1.character == "P" && obj_player1.ispeppino)
    title_music = "event:/music/w1/entrancetitle"
else if ((obj_player1.character == "P" && (!obj_player1.ispeppino)) || obj_player1.character == "N")
    title_music = "event:/stuffed/music/level/entrance/entrancetitleN"
else
    title_music = "event:/music/w1/entrancetitle"
