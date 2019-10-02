	!let's solve (a*d2y+b*dy+c=0)
        real k1,k2	
	p=0.0    !initial value
	q=1.0    !final value
	r=1000.0 !numbers of points
	
	y=1     !initial condition 
	
	h=(q-p)/r  !increment
	yo=1     !y(0-h)  find your self
	open(9,file='2orddiff.dat')  ! file name
	do t=p,q,h
	a=1       !from equn
	b=3       !from equation
	c=2      !from equation
	x=y
	 y=((b*h+2*a)*y-a*yo-c*h**2)/(a+b*h) 
	   !!!!!!dont use this equation. USE values for (bh-2a),a,.....   

	write(9,*)t,y
	
	yo=x
	
	enddo
	close(9)
	end
	real function f(h,y)
	real h,y
	f=h  ! your_function
	end
	
