--[[
	Core Functions
	]]--
SmexyScaleUI = LibStub("AceAddon-3.0"):NewAddon("SmexyScaleUI", "AceEvent-3.0", "AceConsole-3.0");
local L = LibStub("AceLocale-3.0"):GetLocale("SmexyScaleUI");
local AceConfig = LibStub("AceConfigDialog-3.0");
local name = "SmexyScaleUI(SSUI)";
local version = "Retail & Classic";
local f = CreateFrame("Frame", nil, UIParent);

function SmexyScaleUI:OnInitialize()
	SmexyScaleUI:RegisterChatCommand("ssui", "ChatCommand");
	SmexyScaleUI:RegisterChatCommand("ssui-reset", "ResetUI");
	SmexyScaleUI.db = LibStub("AceDB-3.0"):New("SmexyScaleDB", SmexyScaleUI.defaults, "profile");
	LibStub("AceConfig-3.0"):RegisterOptionsTable("SmexyScaleUI", SmexyScaleUI.options);
	AceConfig:AddToBlizOptions("SmexyScaleUI", "SmexyScaleUI(SSUI)");
	if (SmexyScaleUI.db.profile.Enabled == true) then
		SmexyScaleUI:ScaleUI(tonumber(SmexyScaleUI.db.profile.ScaleValue));
	end;
	print(SmexyScaleUI.Colors.wowtoken .. name,SmexyScaleUI.Colors.legendary .. version,L["|rLoad Complete!"]);
end;

function SmexyScaleUI:ResetUI()
	UIParent:SetScale(1.0);
end;

function SmexyScaleUI:ChatCommand()
	InterfaceOptionsFrame_OpenToCategory("SmexyScaleUI(SSUI)");
	InterfaceOptionsFrame_OpenToCategory("SmexyScaleUI(SSUI)");
end;

function SmexyScaleUI:ScaleUI(d)
	if not d then return; end;	
	if(type(d) == "number") then UIParent:SetScale(d); end;
end;

f:RegisterEvent("PLAYER_ENTERING_WORLD");
f:SetScript("OnEvent", function(self, event) SmexyScaleUI:ScaleUI(tonumber(SmexyScaleUI.db.profile.ScaleValue)) end);