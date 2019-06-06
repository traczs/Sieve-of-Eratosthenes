identification division.
program-id. soeCob.
environment division.
input-output section.
file-control.
	select standard-input assign to keyboard.
	select standard-output assign to display.
	select ifile assign to dynamic ws-fname
		organization is line sequential.
    
data division.
file section.
fd standard-input.
    01 stdin-record   pic x(80).
fd standard-output.
    01 stdout-record  pic x(80).
fd ifile.
01 num1.
	05 num2 pic 9(18).

working-storage section.
77  num pic 9(18) usage is computational.
77  i pic 9(18) usage is computational.
77  j pic 9(18) usage is computational.
77  k pic 9(18) usage is computational.
77 ws-fname pic x(30).
01  array-area.
    02 r pic x(1) occurs 30 times.
01  input-area.
    02 in-r   pic x(30).
    02 filler pic x(79).
01  prim-num.
	05 pnum pic 9 occurs 0 to 1000000000 times depending on num.
    
procedure division.
	open input standard-input, output standard-output.
	display "enter max number". 
	read standard-input into input-area.
	move in-r to array-area.
	compute num = function numval(array-area).
	move 0 to i.
	perform init until i is equal to num.
	move 2 to i.
	perform loop1 until k is greater than num.
	move 2 to i.
	move "outputCobol.txt" to ws-fname.
	open output ifile.
	perform printthings until i is greater than num.
	close ifile.
	stop run.

init.
	move 1 to pnum(i).
	add 1 to i.
end-init.
	
loop1.
	if pnum(i) is equal to 1
	then 
		move i to j
		multiply 2 by j
		perform loop2 until j is greater than num
	end-if.
	add 1 to i.
	move i to k.
	multiply k by k.
end-loop1.
	
loop2.
	move 0 to pnum(j).
	add i to j.
end-loop2.

printthings.
	if pnum(i) is equal to 1
	then
		move i to num2
		write num1 from num2
	end-if.
	add 1 to i.
end-printthings.
