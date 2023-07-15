function scr_player_mach3()
{
	switch (character)
	{
		case "P":
			if (windingAnim < 2000)
				windingAnim++;
			if (place_meeting(x, y + 1, obj_railparent))
			{
				var _railinst = instance_place(x, y + 1, obj_railparent);
				railmovespeed = _railinst.movespeed;
				raildir = _railinst.dir;
			}
			hsp = (xscale * movespeed) + (railmovespeed * raildir);
			if (move == xscale && grounded)
			{
				if (movespeed < 20)
				{
					if (mach4mode == 0)
						movespeed += 0.025;
					else
						movespeed += 0.1;
				}
			}
			if (!scr_slope())
				angle = 0;
			mach2 = 100;
			momemtum = 1;
			move = key_right + key_left;
			move2 = key_right2 + key_left2;
			if (fightball == 1 && global.coop == 1)
			{
				if (object_index == obj_player1)
				{
					x = obj_player2.x;
					y = obj_player2.y;
				}
				if (object_index == obj_player2)
				{
					x = obj_player1.x;
					y = obj_player1.y;
				}
			}
			if (machpunchAnim == 1 && sprite_index != spr_crazyrun)
			{
				if (global.combo >= 25 || global.panic)
				{
					if (ispeppino)
						sprite_index = spr_player_attackdash;
					else
						sprite_index = spr_playerN_dashpad;
					if ((sprite_index == spr_player_attackdash || sprite_index == spr_playerN_dashpad) && floor(image_index) == (image_number - 1))
					{
						sprite_index = spr_mach4;
						image_index = 0;
						machpunchAnim = 0;
					}
				}
			}
			if (character == "N" || (character == "P" && !ispeppino))
			{
				if (key_jump && wallclingcooldown == 10 && !grounded)
				{
					if (place_meeting(x + xscale, y, obj_solid))
					{
						fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
						sprite_index = spr_playerN_wallclingstart;
						image_index = 0;
						state = 109;
						xscale *= -1;
						vsp = 0;
						doublejump = 0;
					}
					else if (!doublejump && sprite_index != spr_freefall && sprite_index != spr_facestomp)
					{
						image_index = 0;
						if (key_up && !glidemode)
						{
							sprite_index = spr_playerN_glide;
							glidemode = 1;
							fmod_event_one_shot_3d("event:/sfx/pep/rampjump", x, y);
						}
						else
						{
							jumpstop = 0;
							sprite_index = spr_playerN_doublejump;
							doublejump = 1;
							scr_fmod_soundeffect(jumpsnd, x, y);
							particle_set_scale(4, xscale, 1);
							create_particle(x, y, 4, 0);
						}
						if (glidemode)
							vsp = -10;
						else if (movespeed > 12)
							vsp = -movespeed;
						else
							vsp = -13;
					}
				}
				if (doublejump == 1)
				{
					if (sprite_index == spr_playerN_doublejump && floor(image_index) == (image_number - 1))
						sprite_index = spr_playerN_doublejumpfall;
					if (sprite_index == spr_playerN_doublejumpfall && floor(image_index) == (image_number - 1))
						image_index = 0;
				}
			}
			if (sprite_index == spr_crazyrun)
			{
				if (flamecloud_buffer > 0)
					flamecloud_buffer--;
				else
				{
					flamecloud_buffer = 5;
					with (instance_create(x, y - 2, 993))
					{
						image_xscale = other.xscale;
						sprite_index = spr_flamecloud;
					}
				}
			}
			crouchslideAnim = 1;
			if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
			{
				vsp /= 20;
				jumpstop = 1;
			}
			if (grounded && vsp > 0)
				jumpstop = 0;
			if (input_buffer_jump > 0 && sprite_index != spr_mach3jump && sprite_index != spr_player_airattack && sprite_index != spr_player_airattackstart && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
			{
				input_buffer_jump = 0;
				scr_fmod_soundeffect(jumpsnd, x, y);
				particle_set_scale(5, xscale, 1);
				create_particle(x, y, 5, 0);
				if (sprite_index != spr_fightball)
				{
					image_index = 0;
					sprite_index = spr_mach3jump;
				}
				if (character != "N")
					vsp = -11;
				else
					vsp = -13;
			}
			if (fightball == 0)
			{
				if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
					sprite_index = spr_mach4;
				if (sprite_index == spr_player_airattackstart && floor(image_index) == (image_number - 1))
					sprite_index = spr_player_airattack;
				if (sprite_index == spr_player_airattack && floor(image_index) == (image_number - 1))
					image_index = 0;
				if (grounded)
				{
					if (sprite_index == spr_player_airattack || sprite_index == spr_player_airattackstart)
						sprite_index = spr_mach4;
					if (sprite_index == spr_playerN_glide || sprite_index == spr_playerN_doublejump || sprite_index == spr_playerN_doublejumpfall)
					{
						sprite_index = spr_mach4;
						doublejump = 0;
						glidemode = 0;
					}
				}
				if (sprite_index == spr_superjumpcancel && grounded)
				{
					if (key_attack)
						sprite_index = spr_mach4;
					else
					{
						state = 80;
						if (sprite_index == spr_player_Sjumpcancel)
							sprite_index = spr_player_Sjumpcancelland;
						if (sprite_index == spr_playerN_jetpackboost)
							sprite_index = spr_playerN_jetpackslide;
						image_index = 0;
					}
				}
				if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
					sprite_index = spr_mach4;
				if (sprite_index == spr_mach2jump && grounded && vsp > 0)
					sprite_index = spr_mach4;
				if (movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_superjumpcancelstart && sprite_index != spr_taunt)
				{
					mach4mode = 1;
					flash = 1;
					sprite_index = spr_crazyrun;
				}
				else if (movespeed <= 16 && sprite_index == spr_crazyrun)
					sprite_index = spr_mach4;
			}
			if (!grounded)
			{
				if (sprite_index == spr_playerN_spin && image_index == 7)
					image_index = 2;
			}
			if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
			{
				with (instance_create(x, y, 999))
				{
					playerid = other.object_index;
					other.crazyruneffectid = id;
				}
			}
			if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
				image_speed = 0.4;
			else if (sprite_index == spr_crazyrun)
				image_speed = 0.75;
			else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach)
				image_speed = 0.4;
			if (!key_attack && fightball == 0 && !launched && sprite_index != spr_dashpadmach && grounded && vsp > 0)
			{
				sprite_index = spr_machslidestart;
				fmod_event_one_shot_3d("event:/sfx/pep/break", x, y);
				state = 105;
				image_index = 0;
				launched = 0;
			}
			if (move == -xscale && grounded && vsp > 0 && !launched && fightball == 0 && sprite_index != spr_dashpadmach)
			{
				if (ispeppino)
					fmod_event_one_shot_3d("event:/sfx/pep/machslideboost", x, y);
				else
					fmod_event_one_shot_3d("event:/sfx/noise/skateturn", x, y);
				sprite_index = spr_mach3boost;
				state = 105;
				image_index = 0;
			}
			if (key_down && fightball == 0 && sprite_index != spr_dashpadmach)
			{
				particle_set_scale(5, xscale, 1);
				create_particle(x, y, 5, 0);
				flash = 0;
				state = 5;
				image_index = 0;
				vsp = 10;
				if (!grounded)
				{
					fmod_event_one_shot_3d("event:/sfx/pep/dive", x, y);
					sprite_index = spr_dive;
				}
				else
					sprite_index = spr_rollmach;
			}
			if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope)))
			{
				wallspeed = movespeed;
				grabclimbbuffer = 0;
				if (movespeed < 1)
					wallspeed = 1;
				else
					movespeed = wallspeed;
				state = 37;
			}
			if (!grounded && place_meeting(x + sign(hsp), y, obj_climbablewall) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock))
			{
				wallspeed = movespeed;
				grabclimbbuffer = 0;
				state = 37;
			}
			if (input_buffer_slap > 0 && !key_up && sprite_index != spr_dashpadmach && cangrab)
			{
				input_buffer_slap = 0;
				if (shotgunAnim)
					sprite_index = spr_shotgunsuplexdash;
				else
					sprite_index = spr_suplexdash;
				suplexmove = 1;
				fmod_event_instance_play(suplexdashsnd);
				particle_set_scale(5, xscale, 1);
				create_particle(x, y, 5, 0);
				state = 42;
				if (movespeed < 5)
					movespeed = 5;
				image_index = 0;
			}
			else if (key_slap2 && key_up && sprite_index != spr_dashpadmach)
			{
				input_buffer_slap = 0;
				state = 80;
				image_index = 0;
				if (grounded)
					vsp = -16;
				else
					vsp = -12;
				sprite_index = spr_uppercut;
				fmod_event_instance_play(snd_uppercut);
				movespeed = hsp;
				particle_set_scale(4, xscale, 1);
				create_particle(x, y, 4, 0);
			}
			if (input_buffer_shoot > 0 && sprite_index != spr_dashpadmach)
			{
				if (shotgunAnim)
					scr_shotgunshoot();
				else if (global.pistol)
					scr_pistolshoot(121);
			}
			if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall) && grounded)
			{
				var _bump = ledge_bump((vsp >= 0) ? 32 : 22);
				if (_bump)
				{
					with (obj_camera)
					{
						shake_mag = 20;
						shake_mag_acc = 40 / room_speed;
					}
					with (obj_baddie)
					{
						if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
						{
							stun = 1;
							alarm[0] = 200;
							ministun = 0;
							vsp = -5;
							hsp = 0;
						}
					}
					if (!fightball)
					{
						if (!isgustavo)
							sprite_index = spr_hitwall;
						else if (brick)
							sprite_index = spr_player_ratmountbump;
						else
							sprite_index = spr_lonegustavo_bump;
						fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
						fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
						hsp = 0;
						flash = 0;
						state = 106;
						hsp = -6 * xscale;
						vsp = -6;
						mach2 = 0;
						image_index = 0;
						instance_create(x + (xscale * 15), y + 10, 985);
					}
					else
					{
						fightball = 0;
						with (obj_player)
						{
							if (!isgustavo)
								sprite_index = spr_hitwall;
							else if (brick)
								sprite_index = spr_player_ratmountbump;
							else
								sprite_index = spr_lonegustavo_bump;
							fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
							fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
							hsp = 0;
							flash = 0;
							state = 106;
							hsp = -6 * xscale;
							vsp = -6;
							mach2 = 0;
							image_index = 0;
							instance_create(x + 10, y + 10, 985);
						}
					}
				}
			}
			break;
		case "V":
			if (windingAnim < 2000)
				windingAnim++;
			if (place_meeting(x, y + 1, obj_railparent))
			{
				_railinst = instance_place(x, y + 1, obj_railparent);
				railmovespeed = _railinst.movespeed;
				raildir = _railinst.dir;
			}
			hsp = (xscale * movespeed) + (railmovespeed * raildir);
			if (move == xscale && grounded)
			{
				if (movespeed < 20)
				{
					if (mach4mode == 0)
						movespeed += 0.025;
					else
						movespeed += 0.1;
				}
			}
			if (!scr_slope())
				angle = 0;
			mach2 = 100;
			momemtum = 1;
			move = key_right + key_left;
			move2 = key_right2 + key_left2;
			if (fightball == 1 && global.coop == 1)
			{
				if (object_index == obj_player1)
				{
					x = obj_player2.x;
					y = obj_player2.y;
				}
				if (object_index == obj_player2)
				{
					x = obj_player1.x;
					y = obj_player1.y;
				}
			}
			if (machpunchAnim == 1 && sprite_index != spr_crazyrun)
			{
				if (global.combo >= 25 || global.panic)
				{
					if (ispeppino)
						sprite_index = spr_player_attackdash;
					else
						sprite_index = spr_playerN_dashpad;
					if ((sprite_index == spr_player_attackdash || sprite_index == spr_playerN_dashpad) && floor(image_index) == (image_number - 1))
					{
						sprite_index = spr_mach4;
						image_index = 0;
						machpunchAnim = 0;
					}
				}
			}
			if (!ispeppino)
			{
				if (key_jump)
				{
					if (!doublejump && sprite_index != spr_freefall && sprite_index != spr_facestomp)
					{
						sprite_index = spr_mach2jump;
						image_index = 0;
						jumpstop = 0;
						if (movespeed < 11)
							vsp = -11;
						else if (movespeed < -14)
							vsp = -movespeed;
						else
							vsp = -14;
						particle_set_scale(4, xscale, 1);
						create_particle(x, y, 4, 0);
					}
				}
				if (doublejump == 1)
				{
					if (sprite_index == spr_mach2jump && floor(image_index) == (image_number - 1))
						image_index = 0;
				}
			}
			if (sprite_index == spr_crazyrun)
			{
				if (flamecloud_buffer > 0)
					flamecloud_buffer--;
				else
				{
					flamecloud_buffer = 5;
					with (instance_create(x, y, 993))
					{
						image_xscale = other.xscale;
						sprite_index = spr_flamecloud;
					}
				}
			}
			crouchslideAnim = 1;
			if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
			{
				vsp /= 20;
				jumpstop = 1;
			}
			if (grounded && vsp > 0)
				jumpstop = 0;
			if (input_buffer_jump > 0 && sprite_index != spr_mach3jump && sprite_index != spr_player_airattack && sprite_index != spr_player_airattackstart && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
			{
				input_buffer_jump = 0;
				scr_fmod_soundeffect(jumpsnd, x, y);
				particle_set_scale(5, xscale, 1);
				create_particle(x, y, 5, 0);
				if (sprite_index != spr_fightball)
				{
					image_index = 0;
					sprite_index = spr_mach3jump;
				}
				if (character != "N")
					vsp = -11;
				else
					vsp = -13;
			}
			if (fightball == 0)
			{
				if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
					sprite_index = spr_mach4;
				if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
					sprite_index = spr_mach4;
				if (sprite_index == spr_mach2jump && grounded && vsp > 0)
					sprite_index = spr_mach4;
				if (sprite_index == spr_superjumpcancel && grounded)
					sprite_index = spr_mach4;
				if (movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_superjumpcancelstart && sprite_index != spr_taunt && sprite_index != spr_playerV_divekick && sprite_index != spr_playerV_divekickstart)
				{
					mach4mode = 1;
					flash = 1;
					sprite_index = spr_crazyrun;
				}
				else if (movespeed <= 16 && sprite_index == spr_crazyrun)
					sprite_index = spr_mach4;
			}
			if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
			{
				with (instance_create(x, y, 999))
				{
					playerid = other.object_index;
					other.crazyruneffectid = id;
				}
			}
			if (sprite_index == spr_playerV_divekickstart)
				image_speed = 1.25;
			else if (sprite_index == spr_mach4 || sprite_index == spr_fightball || sprite_index == spr_playerV_divekick)
				image_speed = 0.4;
			else if (sprite_index == spr_crazyrun)
				image_speed = 0.75;
			else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach)
				image_speed = 0.4;
			if (!key_attack && fightball == 0 && !launched && sprite_index != spr_dashpadmach && grounded && vsp > 0)
			{
				sprite_index = spr_machslidestart;
				fmod_event_one_shot_3d("event:/sfx/pep/break", x, y);
				state = 105;
				image_index = 0;
				launched = 0;
			}
			if (vsp > 0 || key_down2)
				dynamitesjump = 0;
			if (move == -xscale && grounded && vsp > 0 && !launched && fightball == 0 && sprite_index != spr_dashpadmach)
			{
				if (ispeppino)
					fmod_event_one_shot_3d("event:/sfx/pep/machslideboost", x, y);
				else
					fmod_event_one_shot_3d("event:/sfx/noise/skateturn", x, y);
				sprite_index = spr_mach3boost;
				state = 105;
				image_index = 0;
			}
			else if (key_down && fightball == 0 && sprite_index != spr_dashpadmach && sprite_index != spr_dive && sprite_index != spr_playerV_divekickstart && sprite_index != spr_playerV_divekick && dynamitesjump == 0)
			{
				particle_set_scale(5, xscale, 1);
				create_particle(x, y, 5, 0);
				flash = 1;
				image_index = 0;
				vsp = 10;
				if (!grounded)
				{
					state = 5;
					fmod_event_one_shot_3d("event:/sfx/pep/dive", x, y);
					sprite_index = spr_dive;
				}
				else if (sprite_index != spr_mach3jump && grounded)
					sprite_index = spr_playerV_divekickstart;
			}
			if (sprite_index == spr_playerV_divekickstart && floor(image_index) == (image_number - 1))
				sprite_index = spr_playerV_divekick;
			if (sprite_index == spr_playerV_divekick || sprite_index == spr_playerV_divekickstart)
			{
				if (!grounded && (key_down || key_down2))
				{
					vsp = 10;
					state = 5;
					fmod_event_one_shot_3d("event:/sfx/pep/dive", x, y);
					sprite_index = spr_dive;
				}
				if (input_buffer_jump > 0 && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
				{
					input_buffer_jump = 0;
					scr_fmod_soundeffect(jumpsnd, x, y);
					image_index = 0;
					sprite_index = spr_mach3jump;
					vsp = -11;
				}
				else if (!key_down && grounded && state != 106 && sprite_index != spr_tumblestart && sprite_index != spr_tumble && sprite_index != spr_tumbleend && !scr_solid(x, y - 16) && !scr_solid(x, y - 32) && sprite_index != spr_snick_dropdash && sprite_index != spr_player_breakdance && sprite_index != spr_noise_vulnerable2)
				{
					flash = 0;
					spindashcharge = 0;
					with (instance_create(x, y, 971))
						image_xscale = other.xscale;
					if (movespeed >= 12)
						sprite_index = spr_rollgetup;
					else
					{
						sprite_index = spr_rollgetup;
						state = 104;
					}
					image_index = 0;
					fmod_event_instance_play(rollgetupsnd);
				}
			}
			if (input_buffer_slap > 0 && key_up && sprite_index != spr_dashpadmach)
			{
				input_buffer_slap = 0;
				state = 80;
				image_index = 0;
				if (grounded)
					vsp = -16;
				else
					vsp = -12;
				sprite_index = spr_uppercut;
				fmod_event_instance_play(snd_uppercut);
				movespeed = hsp;
				particle_set_scale(4, xscale, 1);
				create_particle(x, y, 4, 0);
			}
			else if (key_slap2)
			{
				if (grounded)
					vsp = -3;
				else
					vsp = -4;
				state = 1;
				image_index = 0;
				sprite_index = spr_playerV_airrevolver;
				image_index = 0;
				with (instance_create(x + (xscale * 20), y + 20, 597))
				{
					is_solid = 0;
					sprite_index = spr_cheesebullet;
					image_xscale = other.xscale;
				}
				fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y);
			}
			if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope)))
			{
				wallspeed = movespeed;
				grabclimbbuffer = 0;
				if (movespeed < 1)
					wallspeed = 1;
				else
					movespeed = wallspeed;
				state = 37;
			}
			if (!grounded && place_meeting(x + sign(hsp), y, obj_climbablewall) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock))
			{
				wallspeed = movespeed;
				grabclimbbuffer = 0;
				state = 37;
			}
			if (input_buffer_shoot > 0 && sprite_index != spr_dashpadmach)
			{
				if (shotgunAnim)
					scr_shotgunshoot();
				else if (global.pistol)
					scr_pistolshoot(121);
			}
			if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall) && grounded)
			{
				_bump = ledge_bump((vsp >= 0) ? 32 : 22);
				if (_bump)
				{
					with (obj_camera)
					{
						shake_mag = 20;
						shake_mag_acc = 40 / room_speed;
					}
					with (obj_baddie)
					{
						if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
						{
							stun = 1;
							alarm[0] = 200;
							ministun = 0;
							vsp = -5;
							hsp = 0;
						}
					}
					if (!fightball)
					{
						if (!isgustavo)
							sprite_index = spr_hitwall;
						else if (brick)
							sprite_index = spr_player_ratmountbump;
						else
							sprite_index = spr_lonegustavo_bump;
						fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
						fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
						hsp = 0;
						flash = 0;
						state = 106;
						hsp = -6 * xscale;
						vsp = -6;
						mach2 = 0;
						image_index = 0;
						instance_create(x + (xscale * 15), y + 10, 985);
					}
					else
					{
						fightball = 0;
						with (obj_player)
						{
							if (!isgustavo)
								sprite_index = spr_hitwall;
							else if (brick)
								sprite_index = spr_player_ratmountbump;
							else
								sprite_index = spr_lonegustavo_bump;
							fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
							fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
							hsp = 0;
							flash = 0;
							state = 106;
							hsp = -6 * xscale;
							vsp = -6;
							mach2 = 0;
							image_index = 0;
							instance_create(x + 10, y + 10, 985);
						}
					}
				}
			}
			break;
		case "N":
			hsp = xscale * movespeed;
			move = key_right + key_left;
			move2 = key_right2 + key_left2;
			if (fightball == 0)
				vsp = 0;
			if (key_up && fightball == 0)
				vsp = -4;
			if (key_down && fightball == 0)
				vsp = 4;
			if (move == xscale && grounded)
			{
				if (mach4mode == 0)
					movespeed += 0.05;
				else
					movespeed += 0.1;
			}
			if (abs(hsp) < 24 && move == xscale)
			{
				if (!instance_exists(crazyruneffectid) && grounded)
				{
					with (instance_create(x, y, 998))
					{
						playerid = other.object_index;
						other.crazyruneffectid = id;
					}
					if (sprite_index == spr_crazyrun)
					{
						if (flamecloud_buffer > 0)
							flamecloud_buffer--;
						else
						{
							flamecloud_buffer = 220 + irandom_range(1, 180);
							with (instance_create(x, y, 993))
							{
								image_xscale = other.xscale;
								sprite_index = spr_flamecloud;
							}
						}
					}
				}
			}
			if (key_attack2 && fightball == 0)
			{
				sprite_index = spr_playerN_pogostart;
				image_index = 0;
				state = 58;
				pogospeed = movespeed;
			}
			if (fightball == 0)
			{
				if (movespeed > 20 && sprite_index != spr_crazyrun && sprite_index != spr_superjumpcancelstart && sprite_index != spr_taunt)
				{
					flash = 1;
					mach4mode = 1;
					sprite_index = spr_crazyrun;
				}
				else if (movespeed <= 20 && sprite_index == spr_crazyrun)
				{
					sprite_index = spr_superjumpcancel;
					mach4mode = 0;
				}
			}
			if (key_jump2 && fightball == 0)
			{
				jumpstop = 0;
				vsp = -15;
				state = 92;
				sprite_index = spr_playerN_noisebombspinjump;
				image_index = 0;
				particle_set_scale(5, xscale, 1);
				create_particle(x, y, 5, 0);
			}
			if (key_down && fightball == 0 && !place_meeting(x, y, obj_dashpad) && grounded)
			{
				with (instance_create(x, y, 971))
					image_xscale = other.xscale;
				flash = 0;
				sprite_index = spr_playerN_jetpackslide;
				state = 65;
			}
			if (!key_jump2 && jumpstop == 0 && vsp < 0.5 && fightball == 1)
			{
				vsp /= 20;
				jumpstop = 1;
			}
			if (grounded && vsp > 0 && fightball == 1)
				jumpstop = 0;
			if (input_buffer_jump > 0 && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1) && fightball == 1)
			{
				input_buffer_jump = 0;
				scr_fmod_soundeffect(jumpsnd, x, y);
				if (sprite_index != spr_fightball)
				{
					image_index = 0;
					sprite_index = spr_mach3jump;
				}
				vsp = -11;
			}
			if (input_buffer_slap > 0 && !key_up && sprite_index != spr_dashpadmach && cangrab)
			{
				input_buffer_slap = 0;
				if (shotgunAnim)
					sprite_index = spr_shotgunsuplexdash;
				else
					sprite_index = spr_suplexdash;
				suplexmove = 1;
				fmod_event_instance_play(suplexdashsnd);
				particle_set_scale(5, xscale, 1);
				create_particle(x, y, 5, 0);
				state = 42;
				if (movespeed < 5)
					movespeed = 5;
				image_index = 0;
			}
			else if (input_buffer_slap > 0 && key_up && sprite_index != spr_dashpadmach)
			{
				input_buffer_slap = 0;
				state = 80;
				image_index = 0;
				if (grounded)
					vsp = -16;
				else
					vsp = -12;
				sprite_index = spr_uppercut;
				fmod_event_instance_play(snd_uppercut);
				movespeed = hsp;
				particle_set_scale(4, xscale, 1);
				create_particle(x, y, 4, 0);
			}
			if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid) && (!place_meeting(x + sign(hsp), y, obj_slope) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_hungrypillar))
			{
				pizzapepper = 0;
				sprite_index = spr_hitwall;
				fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
				fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
				with (obj_camera)
				{
					shake_mag = 20;
					shake_mag_acc = 40 / room_speed;
				}
				hsp = 0;
				image_speed = 0.35;
				with (obj_baddie)
				{
					if (point_in_camera(x, y, view_camera[0]) && shakestun && grounded && vsp > 0)
					{
						stun = 1;
						alarm[0] = 200;
						ministun = 0;
						vsp = -5;
						hsp = 0;
					}
				}
				flash = 0;
				state = 106;
				hsp = 2.5;
				vsp = -3;
				mach2 = 0;
				image_index = 0;
				instance_create(x - 10, y + 10, 985);
			}
			break;
		case "S":
			landAnim = 0;
			crouchAnim = 1;
			if (windingAnim < 2000)
				windingAnim++;
			if (place_meeting(x, y + 1, obj_railparent))
			{
				_railinst = instance_place(x, y + 1, obj_railparent);
				railmovespeed = _railinst.movespeed;
				raildir = _railinst.dir;
			}
			if (!homingattack)
			{
				hsp = (xscale * movespeed) + (railmovespeed * raildir);
				if (grounded && !key_attack)
				{
					if (scr_slope() && hsp != 0 && movespeed > 10 && !key_attack && movespeed < 20)
						scr_player_addslopemomentum(0.15, 0.25);
				}
				if (move == xscale && grounded)
				{
					if (movespeed < 20)
					{
						if (key_attack)
						{
							if (mach4mode == 0)
								movespeed += 0.04;
							else
								movespeed += 0.125;
						}
						else if (!key_attack)
						{
							if (mach4mode == 0)
								movespeed += 0.02;
							else
								movespeed += 0.08;
						}
					}
				}
			}
			else if (homingattack)
			{
				if (!grounded)
				{
					hsp = xscale * movespeed;
					if ((move != 0 || key_attack) && !grounded && (place_meeting(x + hsp, y, obj_solid) || (grounded && place_meeting(x + sign(hsp), y - 16, obj_solid))))
					{
						wallspeed = movespeed;
						grabclimbbuffer = 0;
						if (movespeed < 1)
							wallspeed = 1;
						else
							movespeed = wallspeed;
						state = 37;
					}
				}
				else
				{
					homingattack = 0;
					hsp = xscale * movespeed;
				}
			}
			if (!scr_slope())
				angle = 0;
			mach2 = 100;
			momemtum = 1;
			move = key_right + key_left;
			move2 = key_right2 + key_left2;
			if (fightball == 1 && global.coop == 1)
			{
				if (object_index == obj_player1)
				{
					x = obj_player2.x;
					y = obj_player2.y;
				}
				if (object_index == obj_player2)
				{
					x = obj_player1.x;
					y = obj_player1.y;
				}
			}
			if (machpunchAnim == 1 && sprite_index != spr_crazyrun)
			{
				if (global.combo >= 25 || global.panic)
				{
					sprite_index = spr_snick_mach3;
					if (sprite_index == spr_snick_mach3 && floor(image_index) == (image_number - 1))
					{
						sprite_index = spr_mach4;
						image_index = 0;
						machpunchAnim = 0;
					}
				}
			}
			if (sprite_index == spr_crazyrun)
			{
				if (flamecloud_buffer > 0)
					flamecloud_buffer--;
				else
				{
					flamecloud_buffer = 5;
					with (instance_create(x, y - 2, 993))
					{
						image_xscale = other.xscale;
						sprite_index = spr_flamecloud;
					}
				}
			}
			crouchslideAnim = 1;
			if (!key_jump2 && jumpstop == 0 && vsp < 0.5)
			{
				vsp /= 20;
				jumpstop = 1;
			}
			if (scr_slope() && grounded && hsp != 0 && character == "S")
				scr_player_addslopemomentum(0.1, 0.2);
			if (input_buffer_jump > 0 && sprite_index != spr_mach3jump && can_jump && !(move == 1 && xscale == -1) && !(move == -1 && xscale == 1))
			{
				input_buffer_jump = 0;
				scr_fmod_soundeffect(jumpsnd, x, y);
				particle_set_scale(5, xscale, 1);
				create_particle(x, y, 5, 0);
				if (sprite_index != spr_fightball && sprite_index != spr_crazyrun && sprite_index != spr_snick_dropdash)
				{
					image_index = 0;
					sprite_index = spr_mach3jump;
				}
				vsp = -11;
			}
			if (fightball == 0)
			{
				if (sprite_index == spr_mach3jump && floor(image_index) == (image_number - 1))
					sprite_index = spr_mach4;
				if (sprite_index == spr_player_airattackstart && floor(image_index) == (image_number - 1))
					sprite_index = spr_player_airattack;
				if (sprite_index == spr_player_airattack && floor(image_index) == (image_number - 1))
					image_index = 0;
				if (sprite_index == spr_snick_dropdash && floor(image_index) == (image_number - 1))
					sprite_index = spr_snick_dropdash;
				if ((sprite_index == spr_player_airattack || sprite_index == spr_player_airattackstart) && grounded)
					sprite_index = spr_mach4;
				if (floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach))
					sprite_index = spr_mach4;
				if (sprite_index == spr_mach2jump && grounded && vsp > 0)
					sprite_index = spr_mach4;
				if (key_attack && movespeed > 16 && sprite_index != spr_crazyrun && sprite_index != spr_superjumpcancelstart && sprite_index != spr_taunt && dropdash == 0)
				{
					mach4mode = 1;
					flash = 1;
					sprite_index = spr_crazyrun;
				}
				else if (movespeed <= 16 && sprite_index == spr_crazyrun)
					sprite_index = spr_mach4;
			}
			if (sprite_index == spr_crazyrun && !instance_exists(crazyruneffectid))
			{
				with (instance_create(x, y, 999))
				{
					playerid = other.object_index;
					other.crazyruneffectid = id;
				}
			}
			if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
				image_speed = 0.4;
			else if (sprite_index == spr_crazyrun)
				image_speed = 0.75;
			else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit || sprite_index == spr_dashpadmach)
				image_speed = 0.4;
			if (!key_attack && move == 0 && grounded && !launched && fightball == 0)
			{
				fmod_event_one_shot_3d("event:/sfx/pep/break", x, y);
				sprite_index = spr_machslidestart;
				state = 105;
				image_index = 0;
			}
			if (move != 0 && move == -xscale && grounded && vsp > 0 && !launched && fightball == 0 && sprite_index != spr_dashpadmach)
			{
				fmod_event_one_shot_3d("event:/sfx/pep/machslideboost", x, y);
				sprite_index = spr_mach3boost;
				state = 105;
				image_index = 0;
			}
			if (grounded && vsp > 0)
			{
				if (sprite_index == spr_snick_dropdash)
				{
					vsp = 0;
					input_buffer_jump = 0;
					if (key_attack || key_attack2)
					{
						dropdash = 0;
						spindashcharge = 0;
						if (movespeed < 16)
							movespeed = 16;
						hsp = xscale * movespeed;
						fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y);
						sprite_index = spr_snick_mach3;
					}
					else
					{
						if (movespeed < 22)
							movespeed = 22;
						if (!instance_exists(dashcloudid))
						{
							with (instance_create(x - (66 * xscale), y, 972))
							{
								image_xscale = other.xscale;
								other.dashcloudid = id;
							}
						}
						particle_set_scale(5, xscale, 1);
						create_particle(x, y, 5, 0);
						fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y);
						flash = 1;
						state = 5;
						image_index = 0;
					}
				}
				else
				{
					dropdash = 0;
					jumpstop = 0;
				}
			}
			if (key_down && !key_slap && fightball == 0 && sprite_index != spr_dashpadmach)
			{
				particle_set_scale(5, xscale, 1);
				create_particle(x, y, 5, 0);
				flash = 0;
				state = 5;
				image_index = 0;
				vsp = 10;
				fmod_event_one_shot_3d("event:/sfx/pep/dive", x, y);
				if (!grounded)
					sprite_index = spr_dive;
				else
					sprite_index = spr_snick_altjump;
			}
			if (!grounded && homingattack == 0)
			{
				if (key_slap2)
				{
					homingattack = 1;
					sprite_index = spr_snick_jump;
					if (move != 0)
					{
						xscale = move;
						movespeed += 7;
					}
					else
						movespeed += 8;
					if (movespeed > 24)
						movespeed = 24;
					fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y);
					with (instance_create(x - (8 * xscale), y + 6, 999))
						playerid = other.object_index;
				}
				else if (key_jump)
				{
					if (dropdash == 0)
					{
						fmod_event_one_shot("event:/sfx/pep/gotsupertaunt");
						dropdash = 1;
						flash = 1;
					}
					else
					{
						flash = 0;
						dropdash = 0;
					}
				}
				if (dropdash == 1)
				{
					landAnim = 0;
					sprite_index = spr_snick_dropdash;
				}
			}
			if ((!grounded && (place_meeting(x + hsp, y, obj_solid) || scr_solid_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock)) || (grounded && (place_meeting(x + sign(hsp), y - 16, obj_solid) || scr_solid_slope(x + sign(hsp), y - 16)) && !place_meeting(x + hsp, y, obj_destructibles) && !place_meeting(x + hsp, y, obj_mach3solid) && !place_meeting(x + hsp, y, obj_metalblock) && place_meeting(x, y + 1, obj_slope)))
			{
				wallspeed = movespeed;
				grabclimbbuffer = 0;
				if (movespeed < 1)
					wallspeed = 1;
				else
					movespeed = wallspeed;
				state = 37;
			}
			if (!grounded && place_meeting(x + sign(hsp), y, obj_climbablewall) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_metalblock))
			{
				wallspeed = movespeed;
				grabclimbbuffer = 0;
				state = 37;
			}
			if (input_buffer_shoot > 0 && sprite_index != spr_dashpadmach)
			{
				if (shotgunAnim)
					scr_shotgunshoot();
				else if (global.pistol)
					scr_pistolshoot(121);
			}
			if (scr_solid(x + sign(hsp), y) && !place_meeting(x + sign(hsp), y, obj_mach3solid) && !scr_slope() && (scr_solid_slope(x + sign(hsp), y) || place_meeting(x + sign(hsp), y, obj_solid)) && !place_meeting(x + sign(hsp), y, obj_metalblock) && !place_meeting(x + sign(hsp), y, obj_destructibles) && !place_meeting(x + sign(hsp), y, obj_climbablewall) && grounded)
			{
				_bump = ledge_bump((vsp >= 0) ? 32 : 22);
				if (_bump)
				{
					with (obj_camera)
					{
						shake_mag = 20;
						shake_mag_acc = 40 / room_speed;
					}
					with (obj_baddie)
					{
						if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
						{
							stun = 1;
							alarm[0] = 200;
							ministun = 0;
							vsp = -5;
							hsp = 0;
						}
					}
					if (!fightball)
					{
						if (!isgustavo)
							sprite_index = spr_hitwall;
						else if (brick)
							sprite_index = spr_player_ratmountbump;
						else
							sprite_index = spr_lonegustavo_bump;
						fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
						fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
						hsp = 0;
						flash = 0;
						state = 106;
						hsp = -6 * xscale;
						vsp = -6;
						mach2 = 0;
						image_index = 0;
						instance_create(x + (xscale * 15), y + 10, 985);
					}
					else
					{
						fightball = 0;
						with (obj_player)
						{
							if (!isgustavo)
								sprite_index = spr_hitwall;
							else if (brick)
								sprite_index = spr_player_ratmountbump;
							else
								sprite_index = spr_lonegustavo_bump;
							fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y);
							fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y);
							hsp = 0;
							flash = 0;
							state = 106;
							hsp = -6 * xscale;
							vsp = -6;
							mach2 = 0;
							image_index = 0;
							instance_create(x + 10, y + 10, 985);
						}
					}
				}
			}
			break;
	}
	var b = 0;
	with (obj_hamkuff)
	{
		if (state == 206 && playerid == other.id)
			b = 1;
	}
	if (!instance_exists(dashcloudid) && grounded && !place_meeting(x, y + 1, obj_water) && !b)
	{
		with (instance_create(x, y, 972))
		{
			if (other.fightball == 1)
				instance_create(obj_player.x, obj_player.y, 911);
			image_xscale = other.xscale;
			other.dashcloudid = id;
		}
	}
	if (!instance_exists(dashcloudid) && grounded && place_meeting(x, y + 1, obj_water) && !b)
	{
		with (instance_create(x, y, 972))
		{
			if (other.fightball == 1)
				instance_create(obj_player.x, obj_player.y, 911);
			image_xscale = other.xscale;
			sprite_index = spr_watereffect;
			other.dashcloudid = id;
		}
	}
	scr_dotaunt();
	if (!instance_exists(chargeeffectid) && dropdash == 0)
	{
		with (instance_create(x, y, 960))
		{
			playerid = other.object_index;
			other.chargeeffectid = id;
		}
	}
	if (scr_slope() && hsp != 0 && movespeed < 28 && (key_down || character == "S"))
		scr_player_addslopemomentum(0.25, 0.5);
	if (sprite_index == spr_mach4 || sprite_index == spr_fightball)
		image_speed = 0.4;
	else if (sprite_index == spr_crazyrun)
		image_speed = 0.75;
	else if (sprite_index == spr_rollgetup || sprite_index == spr_mach3hit)
		image_speed = 0.4;
	else
		image_speed = 0.4;
	if (scr_check_superjump() && fightball == 0 && state == 121 && grounded && vsp > 0 && sprite_index != spr_dashpadmach && !place_meeting(x, y, obj_dashpad))
	{
		sprite_index = spr_superjumpprep;
		state = 99;
		hsp = 0;
		image_index = 0;
	}
	if (global.attackstyle == 2 && key_slap2)
	{
		randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_suplexmash5, spr_suplexmash6, spr_suplexmash7, spr_punch]);
		image_index = 0;
		state = 43;
	}
}