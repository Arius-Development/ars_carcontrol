function changeSeat(index)
    local playerPed = cache.ped
    local vehicle = cache.vehicle

    SetPedIntoVehicle(playerPed, vehicle, index)
end

function toggleWindow(index)
    local vehicle = cache.vehicle

    if not IsVehicleWindowIntact(vehicle, index) then
        RollUpWindow(vehicle, index)
    else
        RollDownWindow(vehicle, index)
    end
end

function toggleEngine()
    local playerPed = cache.ped
    local vehicle = cache.vehicle

    local engine = not GetIsVehicleEngineRunning(vehicle)

    if IsPedInAnyHeli(playerPed) then
        if engine then
            SetVehicleFuelLevel(vehicle, 60.0)
        else
            SetVehicleFuelLevel(vehicle, 0)
        end
    else
        SetVehicleEngineOn(vehicle, engine, false, true)
        SetVehicleJetEngineOn(vehicle, engine)
    end

    while not GetIsVehicleEngineRunning(vehicle) do
        Wait(1)
        DisableControlAction(0, 71, true)
        DisableControlAction(0, 72, true)
    end
end

function toggleDoors(index)
    local doorIndex = index
    local vehicle = cache.vehicle
    local lockStatus = GetVehicleDoorLockStatus(vehicle)
    local doorsNotLocked = lockStatus == 1 or lockStatus == 0
    local doorOpen = GetVehicleDoorAngleRatio(vehicle, doorIndex) == 0

    if vehicle then
        if doorsNotLocked then
            if doorOpen then
                SetVehicleDoorOpen(vehicle, doorIndex, false, false)
            else
                SetVehicleDoorShut(vehicle, doorIndex, false)
            end
        end
    end
end


