struct Grid
    nx::Int
    dx::Float64
    Lx::Float64
     xu::Vector
     xt::Vector
end

function Grid(nx, x_beg, x_end)
    dx = (x_end - x_beg)/(nx - 0.5)
    xu = LinRange(x_beg, x_end - dx/2, nx)
    xt = LinRange(x_beg + dx/2, x_end, nx)

    return Grid(nx, dx, Lx, xu, xt)
end

struct Grid_2D
    nx::Int
    ny::Int
    dx::Float64
    dy::Float64
    Lx::Float64
    Ly::Float64
    xu::Vector
    xt::Vector
    yu::Vector
    yt::Vector
end

function Grid(nx, ny, x_beg, x_end, y_beg, y_end)
    dx = (x_end - x_beg)/(nx - 0.5)
    dy = (y_end - y_beg)/(ny - 0.5)
    xu = LinRange(x_beg, x_end - dx/2, nx)
    xt = LinRange(x_beg + dx/2, x_end, nx)
    yu = LinRange(y_beg, y_end - dy/2, ny)
    yt = LinRange(y_beg + dy/2, y_end, ny)
    
    return Grid_2D(nx, ny, dx, dy, Lx, Ly, xu, xt, yu, yt)
end