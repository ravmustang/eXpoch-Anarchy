/**
 * ExileClient_gui_interactionMenu_unhook
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 * 
 * eXpoch Addon Mod
 * by DirtySanchez of DonkeyPunch Community Gaming
 * DonkeyPunch.INFO or discord.gg/eXpoch
 *
 */
 
if !(isNull ExileClientInteractionObject) then
{
	if (ExileClientInteractionObject isKindOf "Exile_Animal_Abstract") then 
	{
		{
			player removeAction _x;
		}
		forEach ExileClientInteractionHandles;
	}
	else
	{
		{
			ExileClientInteractionObject removeAction _x;
		}
		forEach ExileClientInteractionHandles;
	};
	ExileClientInteractionObject = objNull;
	/* eXpoch New Addition */
	ExileClientInteractionModel = objNull;
	
	ExileClientInteractionHandles = [];
};