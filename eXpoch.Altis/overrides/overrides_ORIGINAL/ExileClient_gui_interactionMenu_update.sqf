/**
 * ExileClient_gui_interactionMenu_update
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object"];
try 
{
	if (!alive player) then 
	{
		throw false;
	};
	if !((vehicle player) isEqualTo player) then 
	{
		throw false;
	};
	_object = cursorTarget;
	if (isNull _object) then 
	{
		_object = cursorObject;
		if (isNull _object) then 
		{
			throw false;
		};
	};
	_model = (getModelInfo _object)select 0;
	if(ExileClientInteractionModel isEqualTo _model)then
	{	
		if ((time - ExileClientInteractionLastHookTime) > 90) then 
		{
			throw false;
		};
	}
	else
	{
		if!(ExileClientInteractions isEqualTo [])then
		{
			{
				player removeAction _x;
			}forEach ExileClientInteractions;
			ExileClientInteractions = [];
			ExileClientInteractionModel = objNull;
			ExileClientInteractionObject = objNull;
		};
	};
	if (_object isEqualTo ExileClientInteractionObject) then 
	{
		if ((time - ExileClientInteractionLastHookTime) > 90) then 
		{
			throw false;
		};
	}
	else 
	{
		if (((getPosASL _object) distance (getPosASL player)) > 10) then 
		{
			throw false;
		};
		call ExileClient_gui_interactionMenu_unhook;
		_object call ExileClient_gui_interactionMenu_hook;
	};
}
catch
{
	call ExileClient_gui_interactionMenu_unhook;
};