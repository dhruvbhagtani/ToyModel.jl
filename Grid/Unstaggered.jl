struct Grid
    nx::Int
    dx::Float64
    Lx::Float64
     x::Vector
end

function Grid(nx, Lx)
    dx = Lx/nx
    x = LinRange(0, Lx, nx)
    
    return Grid(nx, dx, Lx, x)
end