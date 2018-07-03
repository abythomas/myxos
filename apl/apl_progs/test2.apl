integer main()
{
	integer pid;
	pid=Fork();
	if(pid==-2) then
	
	pid=Exec("even.xsm");
	endif;

	integer status;
	status=Wait(pid);
	print(1);
	print(3);
	print(5);
	print(7);
	print(9);
	print(11);
	print(13);
	print(15);
	print(17);
	print(19);
	return 0;
	

}