function baddiecollisionbox_update(argument0)
{
	if (argument0.cutscene == 0 && argument0.state != 10)
	{
		with (argument0)
		{
			var _destroy = false;
			var _stagger = false;
			if (instance_exists(other.baddieID) && instakillmove == 1 && other.baddieID.state != 4 && other.baddieID.thrown == 0 && !other.baddieID.invincible && other.baddieID.instantkillable)
			{
				if (state == 121 && sprite_index != spr_mach3hit && (character == "P" || character == "V"))
				{
					if (fightball == 0)
						sprite_index = spr_mach3hit;
					image_index = 0;
					_destroy = true;
				}
				else if (state == 97 || (state == 108 && freefallsmash > 10))
					_destroy = true;
				if ((state == 104 || state == 65) && grounded)
				{
					machpunchAnim = true;
					image_index = 0;
				}
				if (!grounded && state != 108 && key_jump2)
				{
					if (state == 104 || (state == 121 && fightball == 0))
						sprite_index = spr_mach2jump;
					suplexmove = false;
					vsp = -11;
				}
				if (!_destroy && !_stagger)
				{
					if (other.baddieID.hp > 0)
					{
						_stagger = true;
						if (state == 108 && freefallsmash < 10)
						{
							vsp = -11;
							state = 92;
							sprite_index = spr_jump;
						}
					}
					else
						_destroy = true;
				}
				if (character == "M" && state == 108)
				{
					vsp = -11;
					state = 92;
					sprite_index = spr_jump;
				}
				if (_destroy)
				{
					if (other.baddieID.elite && other.baddieID.elitehit > 0)
					{
						with (other.baddieID)
						{
							elitehit = 0;
							state = 138;
							vsp = -7;
							image_xscale = -other.xscale;
							hsp = other.xscale * 5;
						}
					}
					else
					{
						instance_destroy(other.baddieID);
						if (!other.baddieID.important)
						{
							global.hit += 1;
							global.combotime = 60;
							global.heattime = 60;
						}
					}
				}
				if (_stagger && other.baddieID.state != 155)
				{
					with (other.baddieID)
					{
						hp -= (state == 104 || state == 65) ? 1 : 2;
						state = (hp > 0) ? 155 : 138;
						stagger_buffer = stagger_max;
						stagger_dir = other.xscale;
					}
				}
			}
			var pepp_grab = false;
			if (character == "M" && instance_exists(other.baddieID) && (state == 0 || state == 92) && state != 154 && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw && other.baddieID.state == 155 && other.baddieID.state != 154 && other.baddieID.state != 138 && other.baddieID.stuntouchbuffer == 0 && !other.baddieID.thrown && !other.baddieID.invincible)
			{
				other.baddieID.pepperman_grab = true;
				pepperman_grabID = other.baddieID.id;
				other.baddieID.state = 4;
				other.baddieID.grabbedby = (object_index == obj_player1) ? 1 : 2;
				pepp_grab = true;
			}
			if (instance_exists(other.baddieID) && y < other.baddieID.y && attacking == 0 && sprite_index != spr_player_mach2jump && (state == 92 || state == 103 || state == 79) && vsp > 0 && other.baddieID.vsp >= 0 && sprite_index != spr_stompprep && !other.baddieID.invincible && other.baddieID.stompable)
			{
				if (x != other.baddieID.x)
					other.baddieID.image_xscale = -sign(other.baddieID.x - x);
				image_index = 0;
				other.baddieID.stagger_buffer = other.baddieID.stagger_max;
				other.baddieID.stagger_dir = xscale;
				if (key_jump2)
				{
					instance_create(x, y + 50, 970);
					stompAnim = true;
					other.baddieID.image_index = 0;
					vsp = -14;
					if (state != 79)
						sprite_index = spr_stompprep;
				}
				else
				{
					instance_create(x, y + 50, 970);
					stompAnim = true;
					other.baddieID.image_index = 0;
					vsp = -9;
					if (state != 79)
						sprite_index = spr_stompprep;
				}
			}
			if (instance_exists(other.baddieID) && !pepp_grab && !_stagger && !_destroy && other.baddieID.thrown == 0 && other.baddieID.stuntouchbuffer == 0 && other.baddieID.vsp > 0 && state != 124 && state != 80 && state != 91 && state != 76 && state != 58 && state != 105 && state != 154 && other.baddieID.state != 4 && other.baddieID.state != 154 && state != 108 && state != 79 && state != 104 && state != 42 && state != 107 && other.baddieID.state != 141 && state != 121 && state != 65 && state != 37 && other.baddieID.bumpable && !other.baddieID.invincible)
			{
				if (state != 51 && state != 103 && state != 102 && character != "M")
					movespeed = 0;
				other.baddieID.stuntouchbuffer = 50;
				if (other.baddieID.object_index == obj_pizzaball)
					global.golfhit += 1;
				if (x != other.baddieID.x)
					other.baddieID.image_xscale = -sign(other.baddieID.x - x);
				other.baddieID.stagger_buffer = other.baddieID.stagger_max;
				other.baddieID.stagger_dir = xscale;
				other.baddieID.state = (other.baddieID.hp > 0) ? 155 : 138;
				other.baddieID.image_index = 0;
			}
			if (instance_exists(other.baddieID) && state == 42 && !other.baddieID.invincible)
			{
				if (other.baddieID.state != 138)
				{
					state = 154;
					sprite_index = spr_grab;
					image_speed = 0.35;
					image_index = 0;
					other.baddieID.state = 154;
					other.baddieID.grabbedby = (object_index == obj_player1) ? 1 : 2;
				}
				else if (other.baddieID.thrown == 0 && (character == "P" || character == "N"))
				{
					movespeed = 0;
					image_index = 0;
					sprite_index = spr_haulingstart;
					state = 79;
					baddiegrabbedID = other.baddieID;
					other.baddieID.state = 4;
					other.baddieID.grabbedby = 1;
				}
				else
				{
					if (other.baddieID.thrown == 1 && !key_up)
					{
						other.baddieID.hsp = xscale * 25;
						other.baddieID.vsp = 0;
					}
					else if (!key_up)
					{
						other.baddieID.hsp = xscale * 6;
						image_index = 0;
						state = 91;
						baddiegrabbedID = other.baddieID;
						movespeed = 0;
						other.baddieID.vsp = -6;
						scr_throwenemy();
					}
					else
					{
						other.baddieID.vsp = -14;
						other.baddieID.hsp = 0;
					}
					sprite_index = choose(spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_punch);
					image_index = 0;
					state = 91;
					movespeed = 0;
					scr_throwenemy();
				}
			}
		}
	}
}