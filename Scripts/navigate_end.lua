-- @author samlletas
-- @description Go to end of loop/item/project

local loopStart, loopEnd = reaper.GetSet_LoopTimeRange(false, false, 0, 0, false)
local midiEditor = reaper.MIDIEditor_GetActive()

local function runOnMidiEditor(isLoopSelected)
  if isLoopSelected then
    reaper.MIDIEditor_OnCommand(midiEditor, 40439) -- [MIDI Editor] Move cursor to end of loop
  else
    reaper.MIDIEditor_OnCommand(midiEditor, 40037) -- [MIDI Editor] View: Go to end of file
  end
end

local function runOnMain(isLoopSelected)
  if isLoopSelected then
    reaper.Main_OnCommand(40633, 0) -- [Main] Go to end of loop
  else
    reaper.Main_OnCommand(40043, 0) -- [Main] Transport: Go to end of project
  end
end

if midiEditor then
  runOnMidiEditor(loopStart ~= loopEnd)
else
  runOnMain(loopStart ~= loopEnd)
end
