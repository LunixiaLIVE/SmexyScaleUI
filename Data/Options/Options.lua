local L = LibStub("AceLocale-3.0"):GetLocale("SmexyScaleUI");
local SmexyScaleUI = SmexyScaleUI;

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0);
	return math.floor(num * mult + 0.5) / mult;
end;

SmexyScaleUI.options = {
	name = "SmexyScaleUI",
	type = 'group',
	args = {	
		Enabled = {
			type = "toggle",
			name = "Enable SmexyScaleUI",
			desc = "Enables/Disables SmexyScaleUI.",
			width = "full",
			get = function(info) return SmexyScaleUI.db.profile.Enabled; end,
			set = function(info, v) SmexyScaleUI.db.profile.Enabled = v; end,
			order = 1
		},
		ScaleDown = {
			type = "execute",
			width = "half",
			name = "<<",
			desc = "Changes the UI scale of the interface by -0.01",
			func = function(info)
				if (UIParent:GetEffectiveScale() ~= SmexyScaleUI.db.profile.ScaleValue) then
					SmexyScaleUI.db.profile.ScaleValue = UIParent:GetEffectiveScale();
				end;
				SmexyScaleUI.db.profile.ScaleValue = SmexyScaleUI.db.profile.ScaleValue - 0.01;
				SmexyScaleUI:ScaleUI(tonumber(SmexyScaleUI.db.profile.ScaleValue));
			end,
			disabled = function(info)
				if SmexyScaleUI.db.profile.Enabled then 
					return false; 
				end;
				return true;
			end,
			order = 2,
		},
		ScaleDown2 = {
			type = "execute",
			width = "half",
			name = "<",
			desc = "Changes the UI scale of the interface by -0.005",
			func = function(info)
				if (UIParent:GetEffectiveScale() ~= SmexyScaleUI.db.profile.ScaleValue) then
					SmexyScaleUI.db.profile.ScaleValue = UIParent:GetEffectiveScale();
				end;
				SmexyScaleUI.db.profile.ScaleValue = SmexyScaleUI.db.profile.ScaleValue - 0.005;
				SmexyScaleUI:ScaleUI(tonumber(SmexyScaleUI.db.profile.ScaleValue));
			end,
			disabled = function(info)
				if SmexyScaleUI.db.profile.Enabled then 
					return false; 
				end;
				return true;
			end,
			order = 3,
		},
		ScaleUp1 = {
			type = "execute",
			width = "half",
			name = ">",
			desc = "Changes the UI scale of the interface by +0.005",
			func = function(info)
				if (UIParent:GetEffectiveScale() ~= SmexyScaleUI.db.profile.ScaleValue) then
					SmexyScaleUI.db.profile.ScaleValue = UIParent:GetEffectiveScale();
				end;
				SmexyScaleUI.db.profile.ScaleValue = SmexyScaleUI.db.profile.ScaleValue + 0.005;
				SmexyScaleUI:ScaleUI(tonumber(SmexyScaleUI.db.profile.ScaleValue));
			end,
			disabled = function(info)
				if SmexyScaleUI.db.profile.Enabled then 
					return false; 
				end;
				return true;
			end,
			order = 4,
		},
		ScaleUp = {
			type = "execute",
			width = "half",
			name = ">>",
			desc = "Changes the UI scale of the interface by +0.01",
			func = function(info)
				if (UIParent:GetEffectiveScale() ~= SmexyScaleUI.db.profile.ScaleValue) then
					SmexyScaleUI.db.profile.ScaleValue = UIParent:GetEffectiveScale();
				end;
				SmexyScaleUI.db.profile.ScaleValue = SmexyScaleUI.db.profile.ScaleValue + 0.01;
				SmexyScaleUI:ScaleUI(tonumber(SmexyScaleUI.db.profile.ScaleValue));
			end,
			disabled = function(info)
				if SmexyScaleUI.db.profile.Enabled then 
					return false; 
				end;
				return true;
			end,
			order = 5,
		},
		CurrentUI = {
			type = "description",
			name = function(info) return "       " .. tostring(round(tonumber(SmexyScaleUI.db.profile.ScaleValue),3)); end,
			width = "normal",
			fontSize = "large",
			order = 6,
		},
		Section2 = {
			type = "header",
			name = "Warning!",
			order = 7,
		},
		Warning = {
			type = "description",
			name = "Be advised: DO NOT set the UI below 0.5 or above 1.7.\r\n" .. 
					SmexyScaleUI.Colors.legendary .. "Set at your own risk. |rSee commands below for UI reset.",
			fontSize = "medium",
			order = 8,
		},
		Section5 = {
			type = "header",
			name = "Synopsis",
			order = 9,
		},
		Synopsis = {
			type = "description",
			name = "UI adjustment addon\r\n" ..
					"Use the arrow buttons to change the UI scale.\r\n" .. 
					"There is no limit to how much you enlarge or shrink your UI, so be careful.\r\n" ..
					"Enjoy!",
			fontSize = "medium",
			order = 10,
		},
		Section3 = {
			type = "header",
			name = "Commands",
			order = 11,
		},
		CMDs = {
			type = "description",
			name = SmexyScaleUI.Colors.wowtoken .. "/ssui|r : Brings up this window." .. 
					SmexyScaleUI.Colors.wowtoken .. "\r\n\/ssui-reset|r : Resets the UI scale to Blizzard default (1.0).",
			fontSize = "medium",
			order = 12,
		},
		Section4 = {
			type = "header",
			name = "Author",
			order = 13,
		},
		About = {
			type = "description",
			name = SmexyMats.Colors.wowtoken .. "BattleTag: Lunixia#1530\r\n" ..
					SmexyMats.Colors.Mage .. "Discord: Lunixia#1530\r\n" ..
					"|cFFCC66FFTwitch: https://www.twitch.tv/LunixiaLIVE\r\n" ..
					"|rCheck out my other addons:\r\n" ..
					"|cFFFF8000SmexyMats(Retail)\r\n" ..
					"|cFFFF8000SmexyMats(Classic)\r\n" ..
					"|cFFFF8000SmexyGMO(SGMO)",
			fontSize = "medium",
			order = 14,
		},
	},
}