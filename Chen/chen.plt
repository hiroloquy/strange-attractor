set terminal png enhanced font "Times" 20 size 986, 554
set tics font 'Times,18'
set nokey
set grid
set xr[-50:50]
set yr[-50:50]
set zr[0:90]
set xl "x" font"Times:Italic, 22"
set yl "y" font"Times:Italic, 22"
set zl "z" font"Times:Italic, 22"
set view 40,20,1,2
DATA = "chen.data"
set print DATA

#=================== Parameters ====================
dt		= 0.01      # Time step	[s]
dh		= dt/6.

a		= 33
b		= 2
c		= 30

n_max	= 100*150
n		= 0
cut		= 10        #　Number of frames: n_max/cut
cnt		= 0

#=================== Functions ====================
f1(x, y, z) = a*(y-x)
f2(x, y, z) = -x*z+(c-a)*x+c*y
f3(x, y, z) = x*y-b*z

rk4x(x, y, zw) = (k1 = f1(x, y, z),\
					k2 = f1(x + dt*k1/2., y + dt*k1/2., z + dt*k1/2.),\
					k3 = f1(x + dt*k1/2., y + dt*k1/2., z + dt*k1/2.),\
					k4 = f1(x + dt*k3, y + dt*k3, z + dt*k3),\
					dh * (k1 + 2*k2 + 2*k3 + k4))
rk4y(x, y, z) = (k1 = f2(x, y, z),\
					k2 = f2(x + dt*k1/2., y + dt*k1/2., z + dt*k1/2.),\
					k3 = f2(x + dt*k1/2., y + dt*k1/2., z + dt*k1/2.),\
					k4 = f2(x + dt*k3, y + dt*k3, z + dt*k3),\
					dh * (k1 + 2*k2 + 2*k3 + k4))
rk4z(x, y, z) = (k1 = f3(x, y, z),\
					k2 = f3(x + dt*k1/2., y + dt*k1/2., z + dt*k1/2.),\
					k3 = f3(x + dt*k1/2., y + dt*k1/2., z + dt*k1/2.),\
					k4 = f3(x + dt*k3, y + dt*k3, z + dt*k3),\
					dh * (k1 + 2*k2 + 2*k3 + k4))

# Initial value
t	= 0.
x	= 0.
y	= 0.3
z	= 0.

call "make.plt"