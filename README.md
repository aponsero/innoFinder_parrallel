# innoFinder_parrallel
Pipeline for parallelization of the InnoFinder tool. Use on an HPC system.

## Requirements

### Inovirus detector
This pipeline requires to download and install [Inovirus detector](https://bitbucket.org/srouxjgi/inovirus/src/master/Inovirus_detector/) on the HPC. 
### Prodigal
This pipeline requires to download and install [Inovirus detector](https://bitbucket.org/srouxjgi/inovirus/src/master/Inovirus_detector/) on the HPC.

## Quick start

### Edit scripts/config.sh file

please modify the

  - PRODIGAL= Path to Prodigal bin directory
  - INNO_DIR=Path to Inovirus detector bin directory
  - OUT= Path to output directory
  - DIR= Path to the directory where the contig dataset is
  - SAMPLE_LIST= Path to text file containing the list of sample to process

You can also modify

  - BIN = change for your own bin directory.
  - MAIL_TYPE = change the mail type option. By default set to "bea".
  - QUEUE = change the submission queue. By default set to "standard".
  
  ### Run pipeline
  
  Run 
  ```bash
  ./submit.sh
  ```
  This command will place one job in queue.
