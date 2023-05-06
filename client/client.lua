require "client.functions"

lib.registerRadial({
    id = 'doors',
    items = {
        {
            label = 'Back right door',
            icon = 'right-long',
            onSelect = function()
                toggleDoors(3)
            end
        },

        {
            label = 'Fron right door',
            icon = 'right-long',
            onSelect = function()
                toggleDoors(1)
            end
        },

        {
            label = 'Front left door',
            icon = 'left-long',
            onSelect = function()
                toggleDoors(0)
            end
        },
        {
            label = 'Back left door',
            icon = 'left-long',
            onSelect = function()
                toggleDoors(2)
            end
        },

    }
})



lib.registerRadial({
    id = 'seats',
    items = {
        {
            label = 'Back right seat',
            icon = 'right-long',
            onSelect = function()
                changeSeat(2)
            end
        },

        {
            label = 'Front Right seat',
            icon = 'right-long',
            onSelect = function()
                changeSeat(0)
            end
        },
        {
            label = 'Fron Left seat',
            icon = 'left-long',
            onSelect = function()
                changeSeat(-1)
            end
        },
        {
            label = 'Back left seat',
            icon = 'left-long',
            onSelect = function()
                changeSeat(1)
            end
        },

    }
})


lib.registerRadial({
    id = 'windows',
    items = {
        {
            label = 'Back right window',
            icon = 'right-long',
            onSelect = function()
                toggleWindow(3)
            end
        },

        {
            label = 'Front Right window',
            icon = 'right-long',
            onSelect = function()
                toggleWindow(1)
            end
        },
        {
            label = 'Fron Left window',
            icon = 'left-long',
            onSelect = function()
                toggleWindow(0)
            end
        },
        {
            label = 'Back left window',
            icon = 'left-long',
            onSelect = function()
                toggleWindow(2)
            end
        },

    }
})


lib.onCache('vehicle', function(value)

    if not value then
        lib.removeRadialItem('doors') 
        lib.removeRadialItem('seats')
        lib.removeRadialItem('windows')
        lib.removeRadialItem('engine')
        lib.removeRadialItem('hood')
        lib.removeRadialItem('trunk')
        return 
    end


    lib.addRadialItem({
        {
            id = 'doors',
            label = 'Doors',
            icon = 'door-open',
            menu = 'doors',
        },
        {
            id = 'seats',
            label = 'Seats',
            icon = 'chair',
            menu = 'seats'
        },
        {
            id = 'windows',
            label = 'Windows',
            icon = 'city',
            menu = 'windows'
        },
        {
            id = 'engine',
            label = 'Toggle Engine',
            icon = 'power-off',
            onSelect = function ()
                toggleEngine()
            end
        },
        {
            id = 'hood',
            label = 'Hood',
            icon = 'car',
            onSelect = function ()
                toggleDoors(4)
            end
        },
        {
            id = 'trunk',
            label = 'Trunk',
            icon = 'car-rear',
            onSelect = function ()
                toggleDoors(5)
                
            end
        },
    })

end)
