-- @author samlletas
-- @description Records a single take and plays the recorded input in the next loop

local PLAYING <const> = 1
local RECORDING <const> = 4
local positionPrev = 0.0

local function stopRecordingAfterLoop()
    local state = reaper.GetPlayState()
    local position = math.max(reaper.GetPlayPosition(), 0)
    local loopStart, loopEnd = reaper.GetSet_LoopTimeRange(false, true, 0, 0, false)

    if state & RECORDING == 0 or loopStart == loopEnd or position > loopEnd then
        return
    end

    if state & PLAYING > 0 then
        if position < positionPrev then
            reaper.Main_OnCommand(1007, 0) -- play
            return
        end
        positionPrev = position
    end

    reaper.defer(stopRecordingAfterLoop)
end

reaper.Main_OnCommand(1013, 0) -- record
stopRecordingAfterLoop()
