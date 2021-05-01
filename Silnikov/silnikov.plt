set terminal png enhanced font "Times" 20 size 986, 554
set tics font 'Times,18'
set nokey
set grid
set xr[-2:2]
set yr[-2:2]
set zr[-3:3]
set xl "x" font"Times:Italic, 22"
set yl "y" font"Times:Italic, 22"
set zl "z" font"Times:Italic, 22"
set view 45,30,1,2
DATA = "silnikov.data"
set print DATA
 
#-----------------------------------------------
# パラメータ
#-----------------------------------------------
dt		= 0.01			# 時間刻み幅	[s]
dh		= dt/6.				# 座標刻み幅

a		= 0.4
b		= 0.65
c		= 0.0
d		= 1.0

n_max	= 100*150
n		= 0
cut		= 10		#静止画数 n_max/cut
cnt		= 0


#-----------------------------------------------
# 関数の定義
#-----------------------------------------------
f1(x, y, z) = y
f2(x, y, z) = z
f3(x, y, z) = -a*z-y+b*x*(1-c*x-d*x**2)

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