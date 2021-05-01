x = x + rk4x(x, y, z)
y = y + rk4y(x, y, z)
z = z + rk4z(x, y, z)

print x, y, z    # Write x,y,z to DATA

if(n%cut==0){
    cnt = cnt + 1
    time = sprintf("{/TimesNewRoman:Italic t} = %4.2f",t)     # display time
    set title time  font 'TimesNewRoman,18'
    splot DATA using 1:2:3 with line linecolor rgb "red"
}
t = t + dt
n = n+1

if(n &lt;= n_max) reread
n = 0


set out