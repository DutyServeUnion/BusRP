AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");
AddCSLuaFile("gui/cl_inventory.lua");
AddCSLuaFile("gui/cl_hud.lua");

include("shared.lua");

include("utils/server/netprecache_server.lua");
include("dmi/control/controller.lua");
include("dmi/control/loader.lua");

include("scripted/airex/sv_airex.lua");
include("scripted/airex/sv_gasmask.lua");

include("lib/server/sv_inventory_db.lua");
include("gui/sv_inventory.lua");

PrecacheAllGlobalStringsHL2RP();

-- Initialization script. Loads everything else.

dmiVersion = "1.0";

hook.Add("InitPostEntity", "DMIPostEntity", function()
  print("[DMIControl] All DMIControl entities have finished loading.");
  print("[DMIControl] Now attempting to load variables from control entities.");
  dmiLoadController();
end);

print("[DMIControl] DMIControl is initializing.");

print("[Inventory] Loading the inventory storage database.");
Inventory:InitializeDatabase();
