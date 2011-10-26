local tabard = 'Darkspear Tabard'
local mod = CreateFrame('frame', 'tabard', UIParent)
mod:SetScript('OnEvent', function(self, event, ...)
  return self[event](self, ...)
end)
mod:RegisterEvent('ADDON_LOADED')
local UnequipTabard
UnequipTabard = function()
  PickupInventoryItem(19)
  PutItemInBackpack()
  return true
end
mod.ADDON_LOADED = function(self, addon)
  if addon == 'tabard' then
    self:UnregisterEvent('ADDON_LOADED')
    self:RegisterEvent('PLAYER_ENTERING_WORLD')
    self:PLAYER_ENTERING_WORLD()
    return true
  end
end
mod.PLAYER_ENTERING_WORLD = function(self)
  local _, instanceType = IsInInstance()
  if instanceType == 'party' then
    EquipItemByName(tabard)
  else
    UnequipTabard()
  end
  return true
end
