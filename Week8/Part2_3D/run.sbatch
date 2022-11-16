#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --time=2:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=3dWCA

module purge 

source /scratch/work/courses/CHEM-GA-2671-2022fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

for i in 0.8 0.9 1.0 1.1 1.2 1.3 1.4 1.5
    do
        mpirun lmp -var density $i -in 3dWCA.in -log density_$i.log
    done
        mpirun lmp -var density 1 -in 3dWCA.in -log LOGFILE1.log