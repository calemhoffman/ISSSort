#!/bin/sh
# These options are MANDATORY in LCRC; Your qsub will fail if you don't provide them.
#PBS -A HELIOS
#PBS -l select=1
#PBS -l walltime=48:00:00

# Highly recommended
# The first 15 characters of the job name are displayed in the qstat output:
#PBS -N HELIOS_IS757

# If you want to merge stdout and stderr, use the -j option
# oe=merge stdout/stderr to stdout, eo=merge stderr/stdout to stderr, n=don't merge
# #PBS -j n

# Controlling email notifications
# When to send email b=job begin, e=job end, a=job abort, j=subjobs (job arrays), n=no mail
#PBS -m be
#PBS -M calem.hoffman@gmail.com

echo "ISSSort Running in Parallel"
dir=$(pwd)
echo "${dir}"
cd ${dir}/iss_crh/38k
echo "$(pwd)"

count=0
for i in {4..191}
do
    ./sort_IS757_lcrc.sh $i & #
    count=$((count+1))
    echo "Counter Status: $count"
    if [ $count -eq 35 ]; then
	#echo "inside"
        wait
    	count=0
    fi
done

wait
echo "ISSSort Finished"