function ∂xu_cd!(dfdx, f, grid, cross = false)
    nx, dx = grid.nx, grid.dx
    
    if cross == false
        dfdx[1] = 1/(2*dx) * (f[2] - f[nx])
        dfdx[nx] = 1/(2*dx) * (f[1] - f[nx-1])
        for i in 2:nx-1
            dfdx[i] = 1/(2*dx) * (f[i+1] - f[i-1])
        end
    else
        ∂x_fd!(dfdx, f, grid)
    end
end
    
function ∂xt_cd!(dfdx, f, grid, cross = false)
    nx, dx = grid.nx, grid.dx
    
    if cross == false
        dfdx[1] = 1/(2*dx) * (f[2] - f[nx])
        dfdx[nx] = 1/(2*dx) * (f[1] - f[nx-1])
        for i in 2:nx-1
            dfdx[i] = 1/(2*dx) * (f[i+1] - f[i-1])
        end
    else
        ∂x_bd!(dfdx, f, grid)
    end
end

function ∂x_bd!(dfdx, f, grid)
    nx, dx = grid.nx, grid.dx
    dfdx[1] = 1/(dx) * (f[1] - f[nx])
    for i in 2:nx
        dfdx[i] = 1/(dx) * (f[i] - f[i-1])
    end
end

function ∂x_fd!(dfdx, f, grid)
    nx, dx = grid.nx, grid.dx
    dfdx[nx] = 1/(dx) * (f[1] - f[nx])
    for i in 1:nx-1
        dfdx[i] = 1/(dx) * (f[i+1] - f[i])
    end
end

function adv_x_Euler!(adv, dfdx, f, a, grid)
    ∂x_bd!(dfdx, f, grid)
    @. adv = (a + abs(a)) * 0.5 * dfdx
    ∂x_fd!(dfdx, f, grid)
    @. adv = adv + (a - abs(a)) * 0.5 * dfdx
end