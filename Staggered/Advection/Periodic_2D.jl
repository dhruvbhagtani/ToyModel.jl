#--------------------------------------∂f/∂x---------------------------------------#

#----------------------------------------------------------------------------------#

function ∂xu_cd!(dfdx::Array{Float64, 2}, f, grid, cross = false)
    
    nx, ny, dx = grid.nx, grid.ny, grid.dx

    if cross == false
        for j in 1:ny
            dfdx[1, j] = 1/(2*dx) * (f[2, j] - f[nx, j])
            dfdx[nx, j] = 1/(2*dx) * (f[1, j] - f[nx-1, j])
            for i in 2:nx-1
                dfdx[i, j] = 1/(2*dx) * (f[i+1, j] - f[i-1, j])
            end
        end
    else
        ∂x_fd!(dfdx, f, grid)
    end
end

function ∂xt_cd!(dfdx::Array{Float64, 2}, f, grid, cross = false)
    
    nx, ny, dx = grid.nx, grid.ny, grid.dx

    if cross == false
        for j in 1:ny
            dfdx[1, j] = 1/(2*dx) * (f[2, j] - f[nx, j])
            dfdx[nx, j] = 1/(2*dx) * (f[1, j] - f[nx-1, j])
            for i in 2:nx-1
                dfdx[i, j] = 1/(2*dx) * (f[i+1, j] - f[i-1, j])
            end
        end
    else
        ∂x_bd!(dfdx, f, grid)
    end
end

function ∂x_bd!(dfdx::Array{Float64, 2}, f, grid)
    
    nx, ny, dx = grid.nx, grid.ny, grid.dx

    for j in 1:ny
        dfdx[1, j] = 1/(dx) * (f[1, j] - f[nx, j])
        for i in 2:nx
            dfdx[i, j] = 1/(dx) * (f[i, j] - f[i-1, j])
        end
    end
end

function ∂x_fd!(dfdx::Array{Float64, 2}, f, grid)
    
    nx, ny, dx = grid.nx, grid.ny, grid.dx

    for j in 1:ny
        dfdx[nx, j] = 1/(dx) * (f[1, j] - f[nx, j])
        for i in 1:nx-1
            dfdx[i, j] = 1/(dx) * (f[i+1, j] - f[i, j])
        end
    end
end

function adv_x_Euler!(adv, dfdx, f, a, grid)
    ∂x_bd!(dfdx, f, grid)
    @. adv = (a + abs(a)) * 0.5 * dfdx
    ∂x_fd!(dfdx, f, grid)
    @. adv = adv + (a - abs(a)) * 0.5 * dfdx
end

#----------------------------------------------------------------------------------#



#--------------------------------------∂f/∂y---------------------------------------#

#----------------------------------------------------------------------------------#

function ∂yu_cd!(dfdy::Array{Float64, 2}, f, grid, cross = false)
    
    nx, ny, dy = grid.nx, grid.ny, grid.dy
    
    if cross == false
        for i in 1:nx
            dfdy[i, 1] = 1/(2*dy) * (f[i, 2] - f[i, ny])
            dfdy[i, ny] = 1/(2*dy) * (f[i, 1] - f[i, ny-1])
            for j in 2:ny-1
                dfdy[i, j] = 1/(2*dy) * (f[i, j+1] - f[i, j-1])
            end
        end
    else
        ∂y_fd!(dfdy, f, grid)
    end
end

function ∂yt_cd!(dfdy::Array{Float64, 2}, f, grid, cross = false)
    
    nx, ny, dy = grid.nx, grid.ny, grid.dy
    
    if cross == false
        for i in 1:nx
            dfdy[i, 1] = 1/(2*dy) * (f[i, 2] - f[i, ny])
            dfdy[i, ny] = 1/(2*dy) * (f[i, 1] - f[i, ny-1])
            for j in 2:ny-1
                dfdy[i, j] = 1/(2*dy) * (f[i, j+1] - f[i, j-1])
            end
        end
    else
        ∂y_bd!(dfdy, f, grid)
    end
end

function ∂y_bd!(dfdy::Array{Float64, 2}, f, grid)

    nx, ny, dy = grid.nx, grid.ny, grid.dy
    for i in 1:nx
        dfdy[i, 1] = 1/(dy) * (f[i, 1] - f[i, ny])
        for j in 2:ny
            dfdy[i, j] = 1/(dy) * (f[i, j] - f[i, j-1])
        end
    end
end

function ∂y_fd!(dfdy::Array{Float64, 2}, f, grid)
    
    nx, ny, dy = grid.nx, grid.ny, grid.dy
    for i in 1:nx
        dfdy[i, ny] = 1/(dy) * (f[i, 1] - f[i, ny])
        for j in 1:ny-1
            dfdy[i, j] = 1/(dy) * (f[i, j+1] - f[i, j])
        end
    end
end

function adv_y_Euler!(adv, dfdy, f, a, grid)
    ∂y_bd!(dfdy, f, grid)
    @. adv = (a + abs(a)) * 0.5 * dfdy
    ∂y_fd!(dfdy, f, grid)
    @. adv = adv + (a - abs(a)) * 0.5 * dfdy
end
