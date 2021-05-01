# Setting --------------------
set terminal gif animate delay 8 optimize size 1280, 720
set output "lorenz.gif"

set tics font 'Times,18'
set nokey
set grid
set xr[-30:30]
set yr[-30:30]
set zr[0:60]
set xl "x" font "TimesNewRoman:Italic, 22"
set yl "y" font "TimesNewRoman:Italic, 22"
set zl "z" font "TimesNewRoman:Italic, 22"
set view 45,30

DATA = "lorenz.data"
set print DATA

# Parameters --------------------
dt        = 0.01            # Time step
dh        = dt/6.            # coefficient for RK4

sigma    = 10
b        = 8./3.
R        = 28

n_max    = 100*150
n        = 0
cut        = 10            # output frequency: n_max/cut
cnt        = 0

# Functions --------------------
f1(x, y, z) = -sigma*(x-y)
f2(x, y, z) = R*x-y-x*z
f3(x, y, z) = x*y-b*z

# 4th Order Runge-Kutta
rk4x(x, y, zw) = (k1 = f1(x, y, z),\
                    k2 = f1(x + dt*k1/2., y + dt*k1/2., z + dt*k1/2.),\
                    k3 = f1(x + dt*k2/2., y + dt*k2/2., z + dt*k2/2.),\
                    k4 = f1(x + dt*k3, y + dt*k3, z + dt*k3),\
                    dh * (k1 + 2*k2 + 2*k3 + k4))
rk4y(x, y, z) = (k1 = f2(x, y, z),\
                    k2 = f2(x + dt*k1/2., y + dt*k1/2., z + dt*k1/2.),\
                    k3 = f2(x + dt*k2/2., y + dt*k2/2., z + dt*k2/2.),\
                    k4 = f2(x + dt*k3, y + dt*k3, z + dt*k3),\
                    dh * (k1 + 2*k2 + 2*k3 + k4))
rk4z(x, y, z) = (k1 = f3(x, y, z),\
                    k2 = f3(x + dt*k1/2., y + dt*k1/2., z + dt*k1/2.),\
                    k3 = f3(x + dt*k2/2., y + dt*k2/2., z + dt*k2/2.),\
                    k4 = f3(x + dt*k3, y + dt*k3, z + dt*k3),\
                    dh * (k1 + 2*k2 + 2*k3 + k4))

# Initial value
t    = 0.
x    = 0.
y    = 0.3
z    = 0.

call "make.plt"