integer main()
{
	integer i;
	integer ppid;
	integer status;
	integer childpid;
	string t;
	i=0;
	integer fileDescriptor;
	integer counter;
	counter=0;
	status=Create("thousand.dat");
	fileDescriptor=Open("thousand.dat");
	while(i<1000) do
	status=Write(fileDescriptor,i);
	i=i+1;
	endwhile;
	
	
	
	childpid=Fork();
	
	if(childpid==-2) then
	ppid=Getppid();
	status=Wait(ppid);
	
	else
	i=0;
	status=Seek(fileDescriptor,0);
	while(i<50) do
	status=Read(fileDescriptor,t);
	i=i+1;
	print(t);
	endwhile;
	status=Signal();
	status=Wait(childpid);
	endif;

	if(childpid==-2) then
	i=0;
	while(i<50) do
	status=Read(fileDescriptor,t);
	i=i+1;
	print(t);
	endwhile;
	status=Signal();
	endif;

return 0;
}
