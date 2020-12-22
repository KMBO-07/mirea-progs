function mean_markers_temperature(r::Robot)
    sum_temperatures, num_markers = get_sum_temperatures(r)
    return sum_temperatures/num_markers
end

function get_sum_temperatures(r::Robot)
    side=Ost
    sum_temperatures, num_markers = get_sum_temperatures(r,side)
    while isborder(r,Nord)==false
        move!(r,Nord)
        side=inverse(side)
        part_sum, part_num = get_sum_temperatures(r,side)
        sum_temperatures+=part_sum
        num_markers+=part_num
    end
    return sum_temperatures, num_markers
end 

function get_sum_temperatures(r::Robot,side::HorizonSide)


    init_values(r) = ismarkers(r) ? (0,0) : (temperanure(r), 1)
    sum_temperatures, num_markers = init_values(r)

    while isborder(r,side)==false
        if ismarker(r)==true
            sum_temperatures += temperature(r)
            num_markers += 1
        end
    end
    return sum_temperatures, num_markers 
end
