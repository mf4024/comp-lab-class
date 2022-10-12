#!/bin/bash
#SBATCH --job-name=run-gromacs
#SBATCH --nodes=1
#SBATCH --tasks-per-node=20
#SBATCH --mem=8GB
#SBATCH --time=24:00:00 
module purge
module load gromacs/openmpi/intel/2020.4
mpirun -np 1 gmx_mpi grompp -f minim.mdp -c 1AKI_solv_ions.gro -p topol.top -o em.tpr
mpirun -np 48 gmx_mpi mdrun -v -deffnm em
mpirun -np 1 gmx_mpi grompp -f nvt.mdp -c em.gro -r em.gro -p topol.top -o nvt.tpr
mpirun -np 48 gmx_mpi mdrun -deffnm nvt
mpirun -np 1 gmx_mpi grompp -f npt.mdp -c nvt.gro -r nvt.gro -t nvt.cpt -p topol.top -o npt.tpr
mpirun -np 48 gmx_mpi mdrun -deffnm npt
