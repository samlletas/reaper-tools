-- @author samlletas
-- @description Go to start of loop/item/project

local loopStart, loopEnd = reaper.GetSet_LoopTimeRange(false, false, 0, 0, false)
local midiEditor = reaper.MIDIEditor_GetActive()

local function runOnMidiEditor(midiEditor, isLoopSelected)
  if isLoopSelected then
    reaper.MIDIEditor_OnCommand(midiEditor, 40438) -- [MIDI Editor] Move cursor to start of loop
  else
    reaper.MIDIEditor_OnCommand(midiEditor, 40036) -- [MIDI Editor] View: Go to start of file
  end
end

local function runOnMain(isLoopSelected)
  if isLoopSelected then
    reaper.Main_OnCommand(40632, 0) -- [Main] Go to start of loop
  else
    reaper.Main_OnCommand(40042, 0) -- [Main] Transport: Go to start of project
  end
end

if midiEditor then
  runOnMidiEditor(midiEditor, loopStart ~= loopEnd)
else
  runOnMain(loopStart ~= loopEnd)
end
