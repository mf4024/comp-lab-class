#!/bin/bash
#SBATCH --job-name=run-production
#SBATCH --nodes=1
#SBATCH --tasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=8GB
#SBATCH --time=04:00:00 
source /scratch/work/courses/CHEM-GA-2671-2022fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

for i in 1.1 1.0 0.9 0.8 0.7 0.6 0.5
do
    mpirun lmp -var density $i -in 2dWCA.in -log LOGFILE$i.log
    
done
    mpirun lmp -var density 1 -in 2dWCA.in -log LOGFILE1.log