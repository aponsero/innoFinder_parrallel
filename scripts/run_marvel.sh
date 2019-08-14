#!/bin/bash

#PBS -l select=1:ncpus=28:mem=6gb
#PBS -l walltime=24:00:00
#PBS -l place=free:shared

HOST=`hostname`
LOG="$STDOUT_DIR/${HOST}.log"
ERRORLOG="$STDERR_DIR/${HOST}.log"

if [ ! -f "$LOG" ] ; then
    touch "$LOG"
fi
echo "Started `date`">>"$LOG"
echo "Host `hostname`">>"$LOG"


SAMPLE=`head -n +${PBS_ARRAY_INDEX} $SAMPLE_LIST | tail -n 1`
FILE="${SAMPLE}_contigs_fixed.fa"
BAM="${SAMPLE}_contigs.bam"

#run metabat2
cd $OUT
DEPTH="$OUT/${SAMPLE}_DEPTH.txt"
OUT_BIN="$OUT/${SAMPLE}_bin"
$METABAT/jgi_summarize_bam_contig_depths --outputDepth $DEPTH $BAM
$METABAT/metabat2 -i $FILE -a $DEPTH -m 1500 -s 10000 -o $OUT_BIN/bin

source activate marvel
cd $VIR_DIR
#run marvel
python3 marvel_bins.py -i $OUT_BIN -t 28
