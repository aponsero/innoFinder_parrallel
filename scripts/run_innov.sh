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

###############################################################
#run Prodigal
FILE=`head -n +${PBS_ARRAY_INDEX} $SAMPLE_LIST | tail -n 1`
OUTPUT=$OUT/${FILE%.*}.gbk
PROT=$OUT/${FILE%.*}_prot.faa
$PRODIGAL/prodigal -i $FILE -o $OUTPUT -a $PROT -p anon

#############################################################
#run innovirus detection pipeline
cd $INNO_DIR

#./Identify_candidate_fragments_from_gbk.pl -g Example_files/2731957639/2731957639_129103.assembled.gbk -p Pfam-A.hmm -sp signalp-4.1/signalp -th /rsgrps/bhurwitz/alise/tools/inovirus_detector/Inovirus_detector/tmhmm-2.0c/bin/tmhmm

#./Get_inovirus_prediction_score_from_gff_fragments.pl -i Example_files/2731957639/2731957639_129103.assembled_frag_Ga0128599_102362_annot.gff -f Example_files/2731957639/2731957639_129103.assembled_frag_Ga0128599_102362_nucl.fna

