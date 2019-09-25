#!/bin/bash
f_name=hdf5_correct_times_velocity.log
# if f_name exists from previous, delete it
if [ -f $f_name ]; then
        rm $f_name
fi
nprocs=1054;
increment=100000;
t=0;
t_end=130000000;

count_total=0
count_correct=0

while [ $t -le $t_end ]
        do
                f_name_h5=hdf_simple_$nprocs\_$t.h5
                # if the h5dump command succeeds, then write the time
                if [ -f $f_name_h5 ]: then
                        h5dump -H hdf_simple_$nprocs\_$t.h5
                        status=$?
                        if [ $status -eq 0 ]; then
                                count_correct=$(($count_correct+1))
                                echo $t >> hdf5_correct_times_velocity.log
                        fi
                fi
                t=$(($t+$increment));
                count_total=$(($count_total+1))
        done

echo count_correct = $count_correct
echo count_total = $count_total
echo All done
