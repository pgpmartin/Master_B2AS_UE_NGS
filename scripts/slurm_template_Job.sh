#!/bin/bash
#SBATCH --account=form_2022_07
#SBATCH --job-name=<MyJOB>
#SBATCH --output=</Path/to/outputFile_%j.out>
#SBATCH --error=</Path/to/errorFile_%j.err>
#SBATCH --time=04:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --mem-per-cpu=6G

#chargement modules
module load <somemodule>

#nombre de coeurs
nthreads=${SLURM_CPUS_PER_TASK}

#Nom de l'√©chantillon
SampleName="MyOnlySample"

#Faire quelque chose avec cet √©chantillon

echo "$SampleName"

#Fin du script
