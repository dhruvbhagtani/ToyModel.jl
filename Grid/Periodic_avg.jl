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