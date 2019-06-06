with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;

procedure soeada is
--creating an array with unknown range until user input
	type list is array(Integer range<>) of Boolean;
    input1: Integer;
    
    
    procedure dothesoe(input:integer) is
		i: Integer;
		j: Integer;
--user input creating the array with now known range
		pnumlist: list:= (0..input =>True);
		outfp : File_Type;
--getting the current time to use for runtime calculation
		Start_Time : Time := Clock;
		Finish_Time : Time;
		time : Duration;
		
	begin
		i:=2;
		while(i*i <= input) loop
			if(pnumlist(i))then
				j :=i*2;
				while(j<= input) loop
					pnumlist(j) := false;
					j:=j+i;
				end loop;
			end if;
			i := i+1;
		end loop;
		Finish_Time := Clock;
		time := Finish_Time - Start_Time;
		put("The time in seconds: ");
		put(Duration'image(time));
		create(outfp,out_file, "outputADA.txt");
		i:=2;
		while(i<=input) loop
			if(pnumlist(i))then
				put_line(outfp,Integer'image(i));
			end if;
			i:=i+1;
		end loop;
		close(outfp);
    end dothesoe;
    
begin
    Put("Enter upper limit: ");
    input1:= Integer'Value(Get_Line);
--    put(Integer'image(input1));
    dothesoe(input1);

end soeada;
