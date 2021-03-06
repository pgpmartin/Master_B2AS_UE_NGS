#!/bin/bash
#SBATCH --account=form_2022_07
#SBATCH --job-name=starIndex
#SBATCH --output=/shared/projects/form_2022_07/TD_RNAseq/log/01_a_STARindex_%j.out
#SBATCH --error=/shared/projects/form_2022_07/TD_RNAseq/log/01_a_STARindex_%j.err
#SBATCH --time=06:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=6G

#chargement modules
module load star/2.7.9a

#nombre de coeurs
nthreads=${SLURM_CPUS_PER_TASK}

#Nom de l'√©chantillon
formdir="/shared/projects/form_2022_07"
workdir="${formdir}/TD_RNAseq"
bankdir="${workdir}/bank"


#Index STAR

genomedir="${bankdir}/star_index"
mkdir -p "$genomedir"

STAR \
  --runThreadN "${nthreads}" \
  --runMode genomeGenerate \
  --genomeDir "${genomedir}" \
  --genomeFastaFiles "${bankdir}/TAIR10.fa" \
  --sjdbGTFfile "${bankdir}/TAIR10_GFF3_genes.gff" \
  --sjdbGTFtagExonParentTranscript Parent \
  --genomeSAindexNbases 12 \
;

#Fin du script
