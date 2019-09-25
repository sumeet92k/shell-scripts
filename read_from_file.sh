input="hdf_times_slice.log" # name of input file
while IFS= read -r t # the input variable is saved in t
	do
		echo $t;
		EXECUTABLE $t;
		echo done generating xdmf for $t
	done < "$input"