! Program that shows prime numbers

PROGRAM soeFortran
	
    call dothething()
   
END program soeFortran

subroutine dothething()
    implicit none
    logical, allocatable, dimension(:) :: list
    integer :: upper
    integer :: i,j
    integer :: start, finish, count_rate
    
    write(*,*) "Please enter the upper limit :"
    read(*,*) upper
    allocate(list(0:upper))
    
    do i= 0,upper
        list(i) = .true.
    end do
    
    i=2
    call system_clock(start, count_rate)
    !write(*,*) start
    do while(i*i <= upper)
        if(list(i).eqv. .true.)then
            j=i*2
            do while(j<= upper)
                list(j) = .false.
                j=j+i
            end do
        end if 
        i = i+1
    end do
    call system_clock(finish, count_rate)
    !write(*,*) finish
    print '("Time = ",f6.5," seconds.")',((finish-start)/real(count_rate))
    i=2
    open(unit=9, file='fortranOut.txt', status='replace',action='write')
    do while(i<=upper)
        if(list(i) .eqv. .true.)then
            write(9,*) i
        endif
        i=i+1
    end do
    close (9,status='keep')
end
