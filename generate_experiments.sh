seeds=(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16)

TYPE=experiment_name


# Scale loop loop
for item in 0.75 0.5 0.25 0.1
do
    # Scale factor loop
    for (( i=0; i<${#seeds[@]} ; i+=2 )) ; do
        seed1=${seeds[i]}
        seed2=${seeds[i+1]}

        EXP=${TYPE}_item${item}_seed${seed1}${seed2}
        NAME1=${TYPE}_item${item}_seed${seed1}
        NAME2=${TYPE}_item${item}_seed${seed2}

        qsub -N ${EXP} -o ${OUTPUTS}${EXP}.txt \
        -v "NAME1='${NAME1}',NAME2='${NAME2}',SEED1='${seed1}',SEED2='${seed2}'" \
        ./train.pbs
    done
done

