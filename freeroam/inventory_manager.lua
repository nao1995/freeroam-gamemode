
local inventory_manager = {};
inventory_manager._database = nil;

require("util/core");

function inventory_manager:Load(database)
	self._database = database;
end

function inventory_manager:LoadUserInventory(player)
	if (player:GetDataNumber("ForumID") == 0) then
		error( "Invalid forum ID." );
	end

	local q = string.format("SELECT * FROM " .. SERVER.DBInfo.db .. ".game_items WHERE owner = %d", player:GetDataNumber("ForumID"));
	local items = self._database:Query(q, true);

	if (items == nil) then
		return false, "Select items failed";
	end

	print(player:GetName() .. " spawned with " .. table.length(items) .. " items saved");

	for i,v in pairs(items) do
		local item = NVItemDB:GetItem( v.form_id );

		if (item == nil) then
			warn("Databse item " .. v.form_id .. " is invalid.");
		else
			player:GiveItem( item, v.count, v.health );

			if (v.equipped == 1) then
				player:EquipItem( item );
			end
		end
	end
end

function inventory_manager:SaveUserInventory(player)
	warn("Save user inventory...");

	if (player:GetDataNumber("ForumID") == 0) then
		error( "Invalid forum ID." );
	end

	-- Prune the current database entries for the player
	local q = string.format("DELETE FROM " .. SERVER.DBInfo.db .. ".game_items WHERE owner = %d", player:GetDataNumber("ForumID"));
	if (not(self._database:Query(q, false))) then
		return false, "Pre-save prune failed";
	end

	local items = player:GetItems();
	q = "INSERT INTO " .. SERVER.DBInfo.db .. ".game_items (form_id, owner, health, equipped, count) VALUES ";

	local values = {};

	-- Compile items into a single insert statement.
	for i,v in pairs(items) do
		local fmt = "(%d, %d, %f, %d, %d)";
		local equip_value;

		if (v.equipped) then
			equip_value = 1;
		else 
			equip_value = 0;
		end

		table.insert(values, string.format(fmt, i, player:GetDataNumber("ForumID"), v.health, equip_value, v.count));
	end

	if (#values == 0) then
		return;
	end

	q = q .. table.concat(values, ", ");

	if (not(self._database:Query(q, false))) then
		warn("SQL error whilst saving item list.");
	end

	return true;
end

return inventory_manager;