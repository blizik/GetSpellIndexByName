local SpellNameToIndex = {}

local function BuildSpellMap()
 for k,v in pairs(SpellNameToIndex) do
  SpellNameToIndex[k] = nil
 end

 local id = 1
 while true do
  local name, rank = GetSpellName(id, "BOOKTYPE_SPELL")
  if not name then
   break
  end

  if rank ~= "" then
   SpellNameToIndex[string.lower(name) .. "(" .. string.lower(rank) .. ")"] = id
  end
  SpellNameToIndex[string.lower(name)] = id

  id = id + 1
 end

 DEFAULT_CHAT_FRAME:AddMessage(string.format("GetSpellIndexByName: Loaded %d spells.", id - 1))
end

function GetSpellIndexByName(name)
 if not next(SpellNameToIndex) == nil then
  BuildSpellMap()
 end
 return SpellNameToIndex[string.lower(name)]
end
