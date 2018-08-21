#!/bin/sh -login
#PBS -j oe
#PBS -l nodes=1:ppn=5,walltime=00:30:00,mem=32gb
#PBS -m abe
#PBS -N STARindexPkings
#PBS -r n

cd $PBS_O_WORKDIR

module load STAR/2.4.2a


STAR --runThreadN 4 --runMode genomeGenerate --genomeFastaFiles $genome_file --genomeDir $outputdir

# writes out a report that you can refer to on walltime/memory usage etc.
qstat -f $PBS_JOBID
