function through_rectangles_into_angle(r,angle::NTuple{2,HorizonSide})
    num_steps=[]
    while isborder(r,angle[1])==false || isborder(r,angle[2]) # Робот - не в юго-западном углу
        push!(num_steps, moves!(r, angle[2]))
        push!(num_steps, moves!(r, angle[1]))
    end
    return num_steps
end

"""
    moves!(r,sides,num_steps::Vector{Int})

-- перемещает Робота по пути, представленного двумя последовательностями, sides и num_steps 
-- sides - содержит последовательность направлений перемещений
-- num_steps - содержит последовательность чисел шагов в каждом из этих направлений, соответственно; при этом, если длина последовательности sides меньше длины последовательности num_steps, то предполагается, что последовательность sides должна быть продолжена периодически       
"""
function moves!(r,sides,num_steps::Vector{Int})
    for (i,n) in enumerate(reverse!(num_steps))
        moves!(r, sides[mod(i-1, length(sides))+1], n) # - это не рекурсия (не вызов функцией самой себя), это вызов другой, ранее определенной функции
        # выражение индекса массива mod(i-1, length(sides))+1 обеспечисвает периодическое продолжение последовательности из вектора sides до длины вектора num_steps 
    end
end
