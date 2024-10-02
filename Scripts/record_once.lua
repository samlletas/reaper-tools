-- @author samlletas
-- @description Records a single take and plays the recorded input in the next loop

local PLAYING <const> = 1
local RECORDING <const> = 4
local positionPrev = 0.0

local function stopRecordingAfterLoop()
  local state = reaper.GetPlayState()
  local position = math.max(reaper.GetPlayPosition(), 0)
  local loopStart, loopEnd = reaper.GetSet_LoopTimeRange(false, true, 0, 0, false)

  -- Exit when recording stops or no time selection exists
  if state & RECORDING == 0 or loopStart == loopEnd then
    return
  end

  -- When repeat is disabled, stop recording after loop
  if position > loopEnd then
    reaper.Main_OnCommand(1016, 0) -- [Main] Transport: Stop
    return
  end

  -- When repeat is enabled, play recording after loop
  if state & PLAYING > 0 then
    if position < positionPrev then
      reaper.Main_OnCommand(1007, 0) -- [Main] Transport: Play
      return
    end
    positionPrev = position
  end

  reaper.defer(stopRecordingAfterLoop)
end

reaper.Main_OnCommand(40630, 0) -- [Main] Go to start of time selection
reaper.Main_OnCommand(1013, 0)  -- [Main] Transport: Record
stopRecordingAfterLoop()
