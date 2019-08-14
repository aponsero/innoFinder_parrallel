#!/bin/sh
set -u
#
# Checking args
#

source scripts/config.sh

if [[ ! -d "$DIR" ]]; then
    echo "$DIR directory does not exist. Please provide a directory containing contigs to process. Job terminated."
    exit 1
fi

if [[ ! -f "$SAMPLE_LIST" ]]; then
   echo "$SAMPLE_LIST does not exist. Please provide a file containing sample names to process. Job terminated."
    exit 1
fi

export NUM_FILES=$(wc -l < "$SAMPLE_LIST")

if [[ $NUM_FILES -eq 0 ]]; then
  echo "Empty sample list, please correct config file. Job terminated."
  exit 1
fi

#
# Job submission
#

PREV_JOB_ID=""
ARGS="-q $QUEUE -W group_list=$GROUP -M $MAIL_USER -m $MAIL_TYPE"

#
## 01-run innovir
#

PROG="01-run-innovir"
export STDERR_DIR="$SCRIPT_DIR/err/$PROG"
export STDOUT_DIR="$SCRIPT_DIR/out/$PROG"
init_dir "$STDERR_DIR" "$STDOUT_DIR"


echo "launching $SCRIPT_DIR/run_innov.sh"

JOB_ID=`qsub $ARGS -v SAMPLE_LIST,DIR,PRODIGAL,STDERR_DIR,STDOUT_DIR,OUT -N run_innov -e "$STDERR_DIR" -o "$STDOUT_DIR" -J 1-$NUM_FILES $SCRIPT_DIR/run_innov.sh`

if [ "${JOB_ID}x" != "x" ]; then
      echo Job: \"$JOB_ID\"
else
      echo Problem submitting job. Job terminated
fi
echo "job successfully submited"

