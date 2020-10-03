#!/bin/bash

set -e

if [ $# -ne 1 ]; then
  printf "%s\n" ">>> invalid command-line arguments ($#) -> specify path to input directory"
  exit 1
fi

OUTPUT_DIR=${1}

#batch_driver.py -l 1 -i ${OUTPUT_DIR}/ntuples/*/* -o ${OUTPUT_DIR}/jobs -n 5000 -p JMETriggerAnalysisDriverPhase2
#batch_monitor.py -i ${OUTPUT_DIR}/jobs

merge_batchOutputs.py   -l 1 -i ${OUTPUT_DIR}/jobs/*/*.root    -o ${OUTPUT_DIR}/outputs
jmeAnalysisHarvester.py -l 1 -i ${OUTPUT_DIR}/outputs/*/*.root -o ${OUTPUT_DIR}/harvesting
