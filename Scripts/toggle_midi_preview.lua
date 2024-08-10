-- @description Toggle MIDI preview on play/stop
-- @author cfillion (modified by samlletas)
-- @version 1.1.1
-- @changelog Toggles on play/stop
-- @provides [main=main,midi_editor] .
-- @link
--   https://cfillion.ca
--   Forum Thread http://forum.cockos.com/showthread.php?t=169896
-- @donation https://www.paypal.me/cfillion

local PLAYING <const> = 1
local MIDI_SECTION <const> = 32060
local TOGGLE_CMD <const> = 40041

function main_loop()
  local state = reaper.GetPlayState()
  local toggle = reaper.GetToggleCommandStateEx(MIDI_SECTION, TOGGLE_CMD)

  if (state & PLAYING > 0 and toggle > 0) or (state & PLAYING == 0 and toggle == 0) then
    reaper.MIDIEditor_LastFocused_OnCommand(TOGGLE_CMD, 0)
  end

  reaper.defer(main_loop)
end

reaper.defer(main_loop)
