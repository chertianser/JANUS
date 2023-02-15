#!/bin/bash
#SBATCH --account=rrg-aspuru
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --mem=240GB
#SBATCH --time=24:00:00
##SBATCH --mail-type=ALL
##SBATCH --mail-user=serchertian@gmail.com
#SBATCH --job-name janus

cd $SLURM_SUBMIT_DIR

module load python/3.8
module load StdEnv/2020
module load gcc/9.3.0
module load openbabel/3.1.1
module load rdkit/2021.09.3
module load openmpi/4.0.3
module load mpi4py/3.1.3
module load scipy-stack

source ~/janus/bin/activate
source ~/xtb-6.5.0/share/xtb/config_env.bash
export PATH=~/mopac-22.0.6-linux/bin:$PATH

srun python -u -m mpi4py.futures Click.py
