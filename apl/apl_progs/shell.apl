decl
string command;
integer pid,a;

enddecl

integer main()
{

print("Enter command : >");
print("#>");

read(command);

while(command!="exit") do

pid=Fork();

if(pid >=0) then
a=Wait(pid);

endif;

if(pid==-1) then
print("...FORK_ERR...");
endif;

if(pid==-2) then
a=Exec(command);

if(a==-1) then
print("XXX...Error...XXX");
break;
endif;
endif;


print("#>");
read(command);
endwhile;

print("...Exit...");
return 0;
}