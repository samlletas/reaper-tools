-- @author samlletas
-- @description Plays time selection

local PLAYING <const> = 1
local state = reaper.GetPlayState()

if state == 0 then
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_BR_SAVE_CURSOR_POS_SLOT_1"), 0)    -- [Main] SWS/BR: Save edit cursor position, slot 01
  reaper.Main_OnCommand(40630, 0)                                                      -- [Main] Go to start of time selection
  reaper.Main_OnCommand(1007, 0)                                                       -- [Main] Transport: Play
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_BR_RESTORE_CURSOR_POS_SLOT_1"), 0) -- [Main] SWS/BR: Restore edit cursor position, slot 01
elseif state & PLAYING > 0 then
  reaper.Main_OnCommand(1016, 0)                                                       -- [Main] Transport: Stop
end
