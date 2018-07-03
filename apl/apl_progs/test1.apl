decl 
	integer a;
	integer status;
	integer fileDescriptor;
enddecl

integer main()
{
	status=Create("myfile.dat");
	fileDescriptor=Open("myfile.dat");
	a=0;
	while(a<1000) do
		status=Write(fileDescriptor,a);
		print(status);
		a=a+1;
	endwhile;
	print("Status:");
	status=Close(fileDescriptor);
	print(status);
	return 0;
}