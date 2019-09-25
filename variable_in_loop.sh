increment=5000000;
t=40000000;
t_end=90000000;
while [ $t -le $t_end ]
	do
		echo $t;
		t=$(($t+$increment)); # incrementing t
	done