-- Anthony Capo
-- Package Foo Body
--
create or replace package body foo is
	procedure bar (in1 number, in2 number, sum1 out number)
		is
		begin
			sum1 := in1 + in2;
		end;
		
	function adder(in1 number, in2 number) return number
		is
		begin
			return in1+ in2;
		end;
end foo;
/
sho err
