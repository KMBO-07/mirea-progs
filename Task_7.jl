using .ShessMark, .StatBack

function mark_chess(robot)
    init(isodd(sum(move_to_start!((Sud,West)))) # isodd - возвращает true, если аргумент нечетный
    #УТВ: Робот - в юго-западном углу и глобальная переменная модуля инициализирована

    side = Ost
    mark_chess(robot,side)
    while isborder(Nord)==false
        move!(robot,Nord)
        side = inverse(side)
        mark_chess(robot,side)
    end
    #УТВ: Робот - у северной границы поля И маркеры расставлены в шахматном порядке

    for side in (West,Sud) movements!(robot,side) end
    #УТВ: Робот - в юго-западном углу

    move_to_back(robot)
    #УТВ: Робот - в исходном положении
end

function mark_chess(r,side)
    ShessMark.putmarker!(r) # здесь вызывается не стандартная команда Робота, а одноименная функция из модуля
    while isborder(r,side)==false
        move!(r,side)
        ShessMark.putmarker!(r)
    end
end
