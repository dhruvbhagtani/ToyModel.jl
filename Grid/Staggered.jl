struct Grid
	nx::Int
	dx::Float64
	Lx::Float64
     xu::Vector
     xt::Vector
end

function Grid(nx, x_beg, x_end)
	dx = (x_end - x_beg)/(nx + 0.5)
	xu = LinRange(x_beg, x_end - dx/2, nx)
	xt = LinRange(x_beg + dx/2, x_end, nx)

	return Grid(nx, dx, Lx, xu, xt)
end