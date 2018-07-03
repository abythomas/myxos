integer main()
{
	integer fileDescriptor1;
	integer pid;
	integer fileDescriptor2;
	integer fileDescriptor3;
	integer status;
	string t;
	fileDescriptor1=Open("sample1.dat");
	status=Fork();
	fileDescriptor2=Open("sample2.dat");
	status=Write(fileDescriptor1,"Hello");
	status=Write(fileDescriptor1,"World");
	status=Write(fileDescriptor1,"How");
	status=Write(fileDescriptor1,"Are");
	status=Write(fileDescriptor2,"Hello");
	status=Write(fileDescriptor2,"World");
	status=Write(fileDescriptor2,"How");
	status=Write(fileDescriptor2,"Are");
	status=Fork();
	print(status);
	status=Create("sample3.dat");
	fileDescriptor3=Open("sample3.dat");
	status=Write(fileDescriptor1,"1");
	status=Write(fileDescriptor1,"2");
	status=Write(fileDescriptor1,"3");
	status=Write(fileDescriptor2,"1");
	status=Write(fileDescriptor2,"2");
	status=Write(fileDescriptor2,"3");
	status=Write(fileDescriptor3,"1");
	status=Write(fileDescriptor3,"2");
	status=Write(fileDescriptor3,"3");
	pid=Getpid();
	status=Seek(fileDescriptor1,1);
	status=Seek(fileDescriptor2,1);
	status=Seek(fileDescriptor3,1);
	if(pid==1) then
	status=Seek(fileDescriptor1,0);
	status=Seek(fileDescriptor2,0);
	status=Seek(fileDescriptor3,0);
	endif;
	status=Read(fileDescriptor1,t);
	print("PID:");
	print(pid);
	print(t);
	status=Read(fileDescriptor2,t);
	print("PID:");
	print(pid);
	print(t);
	status=Read(fileDescriptor3,t);
	print("PID:");
	print(pid);
	print(t);

	
	return 0;
}
