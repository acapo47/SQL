-- Anthony Capo
-- Package Foo Specification
--
create or replace package foo 
is
	procedure bar(in1 in number, in2 in number, sum1 out number);
	
	function adder (in1 in number, in2 in number)
		return number;
end;
/
sho err

		
		