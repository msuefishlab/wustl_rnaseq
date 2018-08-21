#!/bin/bash -login

### define resources needed:
### walltime - how long you expect the job to run
#PBS -l walltime=04:00:00

### nodes:ppn - how many nodes & cores per node (ppn) that you require
#PBS -l nodes=1:ppn=1

### mem: amount of memory that the job will need
#PBS -l mem=12gb

### you can give your job a name for easier identification
#PBS -N variants_to_table

#PBS -j oe

### load necessary modules, e.g.
module load singularity

cd $PBS_O_WORKDIR

singularity exec /mnt/home/jgallant/jasongallant-gatk_singularity-master.simg /gatk/gatk --java-options “-Xms10g -Xmx10g” \
VariantsToTable \
-V
-F
-O snps_report.table
#Print out the statistics for this job
qstat -f $PBS_JOBID
