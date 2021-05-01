set terminal png enhanced font "Times" 20 size 986, 554
set tics font 'Times,18'
set nokey
set grid
set xr[-2:2]
set yr[-2:2]
set zr[-0.5:2.5]
set xl "x" font"Times:Italic, 22"
set yl "y" font"Times:Italic, 22"
set zl "z" font"Times:Italic, 22"
set view 40,20,1,2
DATA = "langford.data"
set print DATA
 
#-----------------------------------------------
# パラメータ
#-----------------------------------------------
dt		= 0.01			# 時間刻み幅	[s]
dh		= dt/6.				# 座標刻み幅

al		= 1.
be		= 0.7
la		= 0.6
om		= 3.5
rh		= 0.25
ep		= 0

n_max	= 100*150
n		= 0
cut		= 10		#静止画数 n_max/cut
cnt		= 0


#-----------------------------------------------
# 関数の定義
#-----------------------------------------------
f1(x, y, z) = (z-be)*x-om*y
f2(x, y, z) = om*x+(z-be)*y
f3(x, y, z) = la+al*z-z**3/3.-(x**2+y**2)*(1.0+rh*z)+ep*z*x**3

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
					
					
# 初期値
t	= 0.
x	= 0.
y	= 0.3
z	= 0.

					
call "make.plt"