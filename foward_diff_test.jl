using ForwardDiff, LinearAlgebra, PolygonOps
interferencias = [ [0,2] , [1,2] ]                                    # posições bidimensionais das interferencias
dispositivos = [[0,0],[0,4]]

function in_low_circle(x,y)
    x_dev = dispositivo[1]
    y_dev= dispositivo[2]  
    oa = [interferencias[1][1] - x_router, interferencias[1][2] - y_router, 0 ]
    op = [x_dev - x_router, y_dev - y_router, 0   ]
    ab = [interferencias[2][1] - interferencias[1][1], interferencias[2][2]- interferencias[1][2], 0]
    ap = [x_dev - interferencias[1][1],  y_dev - interferencias[1][2], 0  ]
    ob = [interferencias[2][1] - x_router,interferencias[2][2] - y_router, 0 ]
    print("\n\n OA:  ", oa)
    print("\n\n OP:  ", op)
    print("\n\n AB:  ", ab)
    print("\n\n AP:  ", ap)
    print("\n\n OB:  ", ob)
    if cross(oa,op)[2] <0 && cross(ab,ap)[2] >0 && cross(ob,op)[2]
    print("\n\n CROSS OA OB:  ", )
    print("\n\n CROSS AB AP:  ", )
    print("\n\n CROSS OB OP:  ", )
    
end
function interference(x,y)
    proj_1 = [(5*cos(atan(interferencias[1][2]/interferencias[1][1])))+x, (5*sin(atan(interferencias[1][2]/interferencias[1][1])))+y] 
    proj_2 = [(5*cos(atan(interferencias[2][2]/interferencias[2][1])))+x, (5*sin(atan(interferencias[2][2]/interferencias[2][1])))+y]
    return inpolygon([x,y],[interferencias[1],interferencias[2],proj_2,proj_1,interferencias[1]])
end 
x = [1.0, 2.0]
ForwardDiff.gradient(x -> interference(x...), x)