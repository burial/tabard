tabard = 'Darkspear Tabard'

mod = CreateFrame('frame', 'tabard', UIParent)
mod\SetScript('OnEvent', (event, ...) => self[event](self, ...))
mod\RegisterEvent('ADDON_LOADED')

UnequipTabard = ->
  PickupInventoryItem(19) -- tabard slot
  PutItemInBackpack!
  true

mod.ADDON_LOADED = (addon) =>
  if addon == 'tabard'
    self\UnregisterEvent('ADDON_LOADED')
    self\RegisterEvent('PLAYER_ENTERING_WORLD')
    self\PLAYER_ENTERING_WORLD!
    true

mod.PLAYER_ENTERING_WORLD = =>
  _, instanceType = IsInInstance!
  if instanceType == 'party'
    EquipItemByName(tabard)
  else
    UnequipTabard!
  true
