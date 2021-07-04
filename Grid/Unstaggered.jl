struct Grid
    nx::Int
    dx::Float64
    Lx::Float64
     x::Vector
end

function Grid(nx, x_beg, x_end)
    dx = (x_end - x_beg)/nx
    x = LinRange(x_beg, x_end, nx)
    
    return Grid(nx, dx, Lx, x)
end