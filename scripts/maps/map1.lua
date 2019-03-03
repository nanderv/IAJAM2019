--
-- Created by IntelliJ IDEA.
-- User: nander
-- Date: 02/03/2019
-- Time: 10:16
-- To change this template use File | Settings | File Templates.
--

local map = {}
map.name = "tutorial"
map.description = "explains basic things"


map.generate = function()
    local station_1, i1 = scripts.entities.station(6000, 500, "west", 3, 3, nil, nil, 'r')
    local station_2, i2 = scripts.entities.station(5200, 1300, "centraal", 3, 3, nil, 1.25*math.pi, 'r')
    local station_3, i3 = scripts.entities.station(3800, 2700, "centraal", 3, 3, nil, nil, 'r')
    local station_4, i4 = scripts.entities.station(3400, 3100, "oost", 3, 3, nil, 0.5*math.pi, 'r')
    local station_5, i5 = scripts.entities.station(2800, 3700, "west", 3, 3, nil, nil, 'r')
    local station_6, i6 = scripts.entities.station(2400, 4100, "centraal", 3, 3, nil, nil, 'r')

    local station_7, i7 = scripts.entities.station(2800, 3500, "centraal", 3, 3, nil, 1.25*math.pi, 'c')
    local station_8, i8 = scripts.entities.station(2800, 3100, "oost", 3, 3, nil, 1.25*math.pi, 'c')
    local station_9, i9 = scripts.entities.station(2800, 2500, "west", 3, 3, nil, nil, 'c')
    local station_10, i10 = scripts.entities.station(3800, 2500, "centraal", 3, 3, nil, 1.25*math.pi, 'c')
    local station_11, i11 = scripts.entities.station(5400, 2500, "centraal", 3, 3, nil, nil, 'c')
    local station_12, i12 = scripts.entities.station(6000, 2500, "oost", 3, 3, nil, 1.25*math.pi, 'c')
    local station_13, i13 = scripts.entities.station(6800, 2500, "west", 3, 3, nil, nil, 'c')
    local station_14, i14 = scripts.entities.station(6800, 3100, "centraal", 3, 3, nil, nil, 'c')

    local station_15, i15 = scripts.entities.station(3000, 1700, "centraal", 3, 3, nil, nil, 'g')
    local station_16, i16 = scripts.entities.station(3800, 1500, "oost", 3, 3, nil, nil, 'g')
    local station_17, i17 = scripts.entities.station(5200, 1500, "west", 3, 3, nil, nil, 'g')
    local station_18, i18 = scripts.entities.station(6200, 2300, "centraal", 3, 3, nil, 1.25*math.pi, 'g')
    local station_19, i19 = scripts.entities.station(5800, 3100, "centraal", 3, 3, nil, nil, 'g')
    local station_20, i20 = scripts.entities.station(4800, 3300, "oost", 3, 3, nil, nil, 'g')
    local station_21, i21 = scripts.entities.station(3400, 3300, "west", 3, 3, nil, nil, 'g')
    local station_22, i22 = scripts.entities.station(3000, 3100, "west", 3, 3, nil, 0.75*math.pi, 'g')

    core.entity.add(station_1)
    core.entity.add(station_2)
    core.entity.add(station_3)
    core.entity.add(station_4)
    core.entity.add(station_5)
    core.entity.add(station_6)
    core.entity.add(station_7)
    core.entity.add(station_8)
    core.entity.add(station_9)
    core.entity.add(station_10)
    core.entity.add(station_11)
    core.entity.add(station_12)
    core.entity.add(station_13)
    core.entity.add(station_14)
    core.entity.add(station_15)
    core.entity.add(station_16)
    core.entity.add(station_17)
    core.entity.add(station_18)
    core.entity.add(station_19)
    core.entity.add(station_20)
    core.entity.add(station_21)
    core.entity.add(station_22)

    core.entity.add(scripts.entities.connector(i2, i17))
    core.entity.add(scripts.entities.connector(i3, i10))
    core.entity.add(scripts.entities.connector(i4, i21))
    core.entity.add(scripts.entities.connector(i5, i7))
    core.entity.add(scripts.entities.connector(i8, i22))
    core.entity.add(scripts.entities.connector(i12, i18))

    --red line
    local route_1, r1 = scripts.entities.route(i1, i2, nil, 'r')
    local route_2, r2 = scripts.entities.route(i2, i3, nil, 'r')
    local route_3, r3 = scripts.entities.route(i3, i4, nil, 'r')
    local route_4, r4 = scripts.entities.route(i4, i5, nil, 'r')
    local route_5, r5 = scripts.entities.route(i5, i6, nil, 'r')
    local route_6, r6 = scripts.entities.route(i6, i5, nil, 'r')
    local route_7, r7 = scripts.entities.route(i5, i4, nil, 'r')
    local route_8, r8 = scripts.entities.route(i4, i3, nil, 'r')
    local route_9, r9 = scripts.entities.route(i3, i2, nil, 'r')
    local route_10, r10 = scripts.entities.route(i2, i1, nil, 'r')

    --cyan line
    local route_11, r11 = scripts.entities.route(i7, i8, nil, 'c')
    local route_12, r12 = scripts.entities.route(i8, i9, nil, 'c')
    local route_13, r13 = scripts.entities.route(i9, i10, nil, 'c')
    local route_14, r14 = scripts.entities.route(i10, i11, nil, 'c')
    local route_15, r15 = scripts.entities.route(i11, i12, nil, 'c')
    local route_16, r16 = scripts.entities.route(i12, i13, nil, 'c')
    local route_17, r17 = scripts.entities.route(i13, i14, nil, 'c')
    local route_18, r18 = scripts.entities.route(i14, i13, nil, 'c')
    local route_19, r19 = scripts.entities.route(i13, i12, nil, 'c')
    local route_20, r20 = scripts.entities.route(i12, i11, nil, 'c')
    local route_21, r21 = scripts.entities.route(i11, i10, nil, 'c')
    local route_22, r22 = scripts.entities.route(i10, i9, nil, 'c')
    local route_23, r23 = scripts.entities.route(i9, i8, nil, 'c')
    local route_24, r24 = scripts.entities.route(i8, i7, nil, 'c')

    --green line
    local route_25, r25 = scripts.entities.route(i15, i16, { { x = 3200, y = 1500 } }, 'g')
    local route_26, r26 = scripts.entities.route(i16, i17, nil, 'g')
    local route_27, r27 = scripts.entities.route(i17, i18, { { x = 5600, y = 1500 }, { x = 6200, y = 2100 } }, 'g')
    local route_28, r28 = scripts.entities.route(i18, i19, { { x = 6200, y = 2700 } }, 'g')
    local route_29, r29 = scripts.entities.route(i19, i20, { { x = 5600, y = 3300 } }, 'g')
    local route_30, r30 = scripts.entities.route(i20, i21, nil, 'g')
    local route_31, r31 = scripts.entities.route(i21, i22, { { x = 3200, y = 3300 } }, 'g')
    local route_32, r32 = scripts.entities.route(i22, i15, { { x = 2600, y = 2700 }, { x = 2600, y = 2100 } }, 'g')

    core.entity.add(route_1)
    core.entity.add(route_2)
    core.entity.add(route_3)
    core.entity.add(route_4)
    core.entity.add(route_5)
    core.entity.add(route_6)
    core.entity.add(route_7)
    core.entity.add(route_8)
    core.entity.add(route_9)
    core.entity.add(route_10)
    core.entity.add(route_11)
    core.entity.add(route_12)
    core.entity.add(route_13)
    core.entity.add(route_14)
    core.entity.add(route_15)
    core.entity.add(route_16)
    core.entity.add(route_17)
    core.entity.add(route_18)
    core.entity.add(route_19)
    core.entity.add(route_20)
    core.entity.add(route_21)
    core.entity.add(route_22)
    core.entity.add(route_21)
    core.entity.add(route_24)
    core.entity.add(route_25)
    core.entity.add(route_26)
    core.entity.add(route_27)
    core.entity.add(route_28)
    core.entity.add(route_29)
    core.entity.add(route_30)
    core.entity.add(route_31)
    core.entity.add(route_32)

    local line_1, l1 = scripts.entities.line({ r1, r2, r3, r4, r5, r6, r7, r8, r9, r10 }, { r = 1, g = 0, b = 0 })
    local line_2, l2 = scripts.entities.line({ r11, r12, r13, r14, r15, r16, r17, r18, r19, r20, r21, r22, r23, r24 },
        { r = 0, g = 1, b = 1 })
    local line_3, l3 = scripts.entities.line({ r25, r26, r27, r28, r29, r30, r31, r32 }, { r = 0, g = 1, b = 0 })
    core.entity.add(line_1)
    core.entity.add(line_2)
    core.entity.add(line_3)

    local spotter = scripts.entities.spotter(i1, 1, {}, 'spotter')
    core.entity.add(spotter)

    local police = scripts.entities.spotter(i2, 3, {}, 'spotter')
    core.entity.add(police)

    local train_1, t1 = scripts.entities.train(l1, 3, 2)
    local train_2, t2 = scripts.entities.train(l1, 6, 3)
    local train_3, t3 = scripts.entities.train(l2, 4, 3)
    local train_4, t4 = scripts.entities.train(l2, 9, 2)
    local train_5, t5 = scripts.entities.train(l2, 14, 3)
    local train_6, t6 = scripts.entities.train(l3, 3, 3)
    local train_7, t7 = scripts.entities.train(l3, 7, 2)
    core.entity.add(train_1)
    core.entity.add(train_2)
    core.entity.add(train_3)
    core.entity.add(train_4)
    core.entity.add(train_5)
    core.entity.add(train_6)
    core.entity.add(train_7)
    local police = scripts.entities.spotter(i2, 1, scripts.entities.actions.in_metro(t1), 'spotter')
    core.entity.add(police)
    local police = scripts.entities.police(i2, {})
    core.entity.add(police)
end
return map
