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
	status=Seek(fileDescriptor,0);

	childpid=Fork();
	if(childpid==-2) then
	ppid=Getppid();
	status=Wait(ppid);
	endif;
	
	while(counter<10) do
	i=0;
	
    if(childpid==2) then
	while(i<50) do
	status=Read(fileDescriptor,t);
	i=i+1;
	print(t);
	endwhile;
	status=Signal();
	status=Wait(childpid);
	
	else
	while(i<50) do
	status=Read(fileDescriptor,t);
	i=i+1;
	print(t);
	endwhile;
	ppid=Getppid();
	status=Signal();
	status=Wait(ppid);
	endif;
    counter=counter+1;
	endwhile;
return 0;
}
