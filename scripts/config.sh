export CWD=$PWD
# where programs are
export PRODIGAL="/rsgrps/bhurwitz/alise/tools/Prodigal/"
export INNO_DIR=""
# where the dataset to prepare is
export OUT="/rsgrps/bhurwitz/alise/my_data/Nostoc_project/Lichen_metagenomes/experiments/2-Viral_search_assembly1/Innovirus_detection"
export DIR="/rsgrps/bhurwitz/alise/my_data/Nostoc_project/Lichen_metagenomes/experiments/2-Viral_search_assembly1/dataset1"
export SAMPLE_LIST="/rsgrps/bhurwitz/alise/my_data/Nostoc_project/Lichen_metagenomes/experiments/2-Viral_search_assembly1/dataset1/inno_list.txt"
#place to store the scripts
export SCRIPT_DIR="$PWD/scripts"
# User informations
export QUEUE="standard"
export GROUP="bhurwitz"
export MAIL_USER="aponsero@email.arizona.edu"
export MAIL_TYPE="bea"

#
# --------------------------------------------------
function init_dir {
    for dir in $*; do
        if [ -d "$dir" ]; then
            rm -rf $dir/*
        else
            mkdir -p "$dir"
        fi
    done
}

# --------------------------------------------------
function lc() {
    wc -l $1 | cut -d ' ' -f 1
}
