# ���C���֐�
x = x + rk4x(x, y, z)
y = y + rk4y(x, y, z)
z = z + rk4z(x, y, z)
 
print x, y, z 
if(n%cut==0){
	cnt = cnt + 1
	filename = sprintf("png/img_%04d.png",cnt)  #�o�̓t�@�C����
	time	 = sprintf("{/Times:Italic t} = %4.2f",t)  #�^�C�g����
	set title time  font 'Times,18'
	set output filename
	splot DATA using 1:2:3 with line linecolor rgb "red"
}
t = t + dt
n = n+1

if(n <= n_max) reread
n = 0


set out
set terminal wxt enhanced