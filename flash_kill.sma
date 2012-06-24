/*
*  <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3
* <3 Coded By Samar[at]Techgaun[dot]Com				   <3
* <3 Visit http://www.techgaun.com for more fun, tricks and hacks  <3
*  <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3 <3
*  This program is free software; you can redistribute it and/or modify it
*  under the terms of the GNU General Public License as published by the
*  Free Software Foundation; either version 2 of the License, or (at
*  your option) any later version.
*
*  This program is distributed in the hope that it will be useful, but
*  WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
*  General Public License for more details.
*
*  You should have received a copy of the GNU General Public License
*  along with this program; if not, write to the Free Software Foundation,
*  Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
*/

#include <amxmodx>
#include <csx>

#define PLUGIN "Flashbang Punisher"
#define VERSION "0.1"
#define AUTHOR "samar[at]techgaun[dot]com"
#define FLASH_CVAR_NAME "tg_flashpunish"

public plugin_init()
{
	register_plugin(PLUGIN, VERSION, AUTHOR);
	register_cvar(FLASH_CVAR_NAME, "0", FCVAR_SERVER|FCVAR_UNLOGGED);
	register_message(get_user_msgid("ScreenFade"), "Message_ScreenFade");
}

public grenade_throw(id, greindex, wId)
{
	//if(!is_user_alive(id))
        	//return PLUGIN_CONTINUE;
	//if(!get_cvar_num(FLASH_CVAR_NAME)) 
        	//return PLUGIN_CONTINUE;
	if (get_cvar_num(FLASH_CVAR_NAME) == 1)
	{
		if (wId == CSW_FLASHBANG)
		{
			//is_user_connected(id) && 
			if (is_user_alive(id))
			{
				new punished_player[38];
				get_user_name(id, punished_player, 38) ;
				user_kill(id, 0);
				client_print(0, print_chat, "%s killed for flashbanging - Flash Punisher Plugin By samar@techgaun.com", punished_player);
			}
		}
	}
	return PLUGIN_CONTINUE;
}

public Message_ScreenFade(arg, arg2, arg3)
{
    if (get_msg_arg_int(4) != 255 || get_msg_arg_int(5) != 255 || get_msg_arg_int(6) != 255 )
        return PLUGIN_CONTINUE;
    
    static iAlpha;
    iAlpha = get_msg_arg_int(7);
    if(iAlpha != 200 && iAlpha != 255)
        return PLUGIN_CONTINUE;

    return PLUGIN_HANDLED;
}
