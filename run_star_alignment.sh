#!/bin/sh -login
#PBS -j oe
#PBS -l nodes=1:ppn=13,walltime=03:59:00,mem=140gb
#PBS -m abe
#PBS -r n

cd $PBS_O_WORKDIR

module load STAR/2.4.2a

readfileslist=$(ls -1 $searchphrase | awk -vORS=, '{ print $1 }' | sed 's/,$/\n/')



echo STAR \
--runThreadN 12 \
--genomeDir $genomeDir \
--readFilesIn $readfileslist \
--readFilesCommand zcat \
--outFileNamePrefix $genomeDir/$step \
--outSAMtype BAM SortedByCoordinate \
--limitBAMsortRAM 100000000000 \
--twopassMode Basic \
--sjdbInsertSave All


STAR \
--runThreadN 12 \
--genomeDir $genomeDir \
--readFilesIn $readfileslist \
--readFilesCommand zcat \
--outFileNamePrefix $genomeDir/$step \
--outSAMtype BAM SortedByCoordinate \
--limitBAMsortRAM 100000000000 \
--twopassMode Basic \
--sjdbInsertSave All

# writes out a report that you can refer to on walltime/memory usage etc.
qstat -f $PBS_JOBID
