using CircularArrays

function avg_val(u, t, u_avg, t_avg)
    for i in 2:nx-1
        u_avg[i] = (u[i] + u[i+1])*0.5
        t_avg[i] = (t[i-1] + t[i])*0.5
    end
    
    u_avg[1] = (u[1] + u[2])*0.5
    u_avg[nx] = (u[nx] + u[1])*0.5
    t_avg[1]  = (t[nx] + t[1])*0.5
    t_avg[nx] = (t[nx-1] + t[nx])*0.5
end

function avg_val(u, v, h, uavg_x, havg_x, vavg_y, havg_y, uavg_xy, vavg_xy, grid)

#                    ----v---- ----v---- ----v
#                   |    |    |    |    |    |
#                   u----h----u----h----u----h
#                   |    |    |    |    |    |
#                    ----v---- ----v---- ----v
#                   |    |    |    |    |    |
#                   u----h----u----h----u----h
#                   |    |    |    |    |    |
#                    ----v---- ----v---- ----v
#                   |    |    |    |    |    |
#                   u----h----u----h----u----h

    h = CircularArray(h)
    u = CircularArray(u)
    v = CircularArray(v)

    nx, ny = grid.nx, grid.ny
    for i in 1:nx
        for j in 1:ny
            uavg_xy[i, j] = 0.25*(u[i, j-1] + u[i, j] + u[i+1, j-1] + u[i+1, j])
            vavg_xy[i, j] = 0.25*(v[i-1, j] + v[i-1, j+1] + v[i, j] + v[i, j+1])
            uavg_x[i, j] = (u[i, j] + u[i+1, j])*0.5
            havg_x[i, j] = (h[i-1, j] + h[i, j])*0.5
            vavg_y[i, j] = (v[i, j] + v[i, j+1])*0.5
            havg_y[i, j] = (h[i, j-1] + h[i, j])*0.5
        end
    end

    #=for i in 2:nx-1
        for j in 2:ny-1 
            uavg_xy[i, j] = 0.25*(u[i, j-1] + u[i, j] + u[i+1, j-1] + u[i+1, j])
            vavg_xy[i, j] = 0.25*(v[i-1, j] + v[i-1, j+1] + v[i, j] + v[i, j+1])
        end
    end

    for i in 1:nx-1
        uavg_x[i, j] = (u[i, j] + u[i+1, j])*0.5
    end

    for i in 2:nx
        havg_x[i, j] = (h[i-1, j] + h[i, j])*0.5
    end

    for j in 1:ny-1
        vavg_y[i, j] = (v[i, j] + v[i, j+1])*0.5
    end

    for j in 2:ny
        havg_y[i, j] = (h[i, j-1] + h[i, j])*0.5
    end=#
end