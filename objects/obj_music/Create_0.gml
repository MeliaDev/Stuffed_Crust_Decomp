secret = false;
secretend = false;
pillar_on_camera = false;
prevpillar_on_camera = false;
music_map = ds_map_create();
music = -4;
savedpillarpause = false;
savedpanicpause = false;
savedmusicpause = false;
savedsecretpause = false;
savedpanicpos = 0;
savedmusicpos = 0;
exitmusic = false;
pillarmusicID = fmod_event_create_instance("event:/music/pillarmusic");
panicmusicID = fmod_event_create_instance("event:/music/pizzatime");
defaultpanicID = fmod_event_create_instance("event:/music/pizzatime")
noisepanicID = fmod_event_create_instance("event:/stuffed/music/panic/noise")
snickpanicID = fmod_event_create_instance("event:/stuffed/music/panic/snick")
kidspartychaseID = fmod_event_create_instance("event:/music/w5/kidspartychase");
panicstart = false;
add_music(characterselect, "event:/stuffed/music/moveit", -4, 0)
add_music(10, "event:/stuffed/music/choose", -4, 0)
add_music(634, "event:/music/soundtest/meatphobia", -4, 0)
add_music(799, "event:/music/ending", -4, 0)
add_music(820, "event:/music/credits", -4, 0)
add_music(821, "event:/music/ending", -4, 0)
add_music(822, "event:/music/intro", -4, 0, musicstates)
add_music(776, "event:/music/title", -4, 0, musicstates)
add_music(788, "event:/music/tutorial", "event:/music/pillarmusic", 0)
add_music(757, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(803, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(756, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(752, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(748, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(744, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(740, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
add_music(739, "event:/music/finalescape", -4, 0)
add_music(819, "event:/music/pillarmusic", -4, 0)
add_music(782, "event:/music/w5/finalhallway", -4, 0)
add_music(828, "event:/sfx/misc/windloop", -4, 0)
add_music(777, "event:/music/pillarmusic", -4, 0)
add_music(778, "event:/music/pillarmusic", -4, 0)
add_music(780, "event:/music/pillarmusic", -4, 0)
add_music(781, "event:/music/pillarmusic", -4, 0)
add_music(514, "event:/music/boss/vigilante", -4, 0)
add_music(783, "event:/music/boss/fakepep", -4, 0)
add_music(784, "event:/music/boss/fakepepambient", -4, 0)
add_music(785, "event:/music/pillarmusic", -4, 0)
add_music(515, "event:/music/boss/noise", -4, 0)
add_music(513, "event:/music/boss/pepperman", -4, 0)
add_music(659, "event:/music/boss/pizzaface", -4, 0, musicstates)
add_music(24, "event:/stuffed/music/level/entrance/entrance", "event:/stuffed/music/level/entrance/entrancesecret", 0, musicstates)
add_music(39, "event:/music/w1/medieval", "event:/music/w1/medievalsecret", 0, musicstates)
add_music(54, "event:/music/w1/ruin", "event:/music/w1/ruinsecret", 0, musicstates)
add_music(71, "event:/music/w1/dungeon", "event:/music/w1/dungeonsecret", 0)
add_music(719, "event:/music/w2/desert", "event:/music/w2/desertsecret", 0, musicstates)
add_music(138, "event:/music/w2/farm", "event:/music/w2/farmsecret", 0, musicstates)
add_music(123, "event:/music/w2/graveyard", "event:/music/w2/graveyardsecret", 0)
add_music(687, "event:/music/w2/saloon", "event:/music/w2/saloonsecret", 0)
add_music(706, "event:/music/w3/beach", "event:/music/w3/beachsecret", 0)
add_music(194, "event:/music/w3/forest", "event:/stuffed/music/level/forest/forestsecret", 0, musicstates)
add_music(229, "event:/music/w3/golf", "event:/music/w3/golfsecret", 0)
add_music(241, "event:/music/w3/space", "event:/music/w3/spacesecret", 0)
add_music(441, "event:/music/w4/freezer", "event:/music/w4/freezersecret", 0, musicstates)
add_music(672, "event:/music/w4/industrial", "event:/music/w4/industrialsecret", 0, musicstates)
add_music(830, "event:/music/w4/sewer", "event:/music/w4/sewersecret", 0)
add_music(560, "event:/music/w4/street", "event:/stuffed/music/level/street/streetsecret", 0, musicstates)
add_music(244, "event:/music/w5/chateau", "event:/stuffed/music/level/chateau/chateausecret", 0)
add_music(596, "event:/music/w5/kidsparty", "event:/music/w5/kidspartysecret", 0)
add_music(526, "event:/music/w5/war", "event:/music/w5/warsecret", 0)
add_music(570, "event:/stuffed/music/level/mansion/chillpizza", "event:/stuffed/music/level/mansion/chillsecret", 0)
add_music(576, "event:/stuffed/music/level/mansion/mansion", "event:/stuffed/music/level/mansion/mansionsecret", 0, musicstates)