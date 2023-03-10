#!/bin/bash
#OAR -n "Training Model"
#OAR -p gpu>0
#OAR -l /gpu=1,walltime=2:00:00
#OAR -O logs/jupyter-log.txt
#OAR -E logs/jupyter-err.txt
#OAR -t besteffort

export http_proxy=http://11.0.0.254:3142/
export https_proxy=http://11.0.0.254:3142/

cd ~/M2-Prestel-state-from-obs-ML
NSLOTS=$(cat $OAR_NODEFILE | wc -l)

echo $NSLOTS

source ~/M2-Prestel-state-from-obs-ML/venv/bin/activate
ls -s /scratch-local/vforiel ./M2-Prestel-state-from-obs-ML/scratch-local

~/M2-Prestel-state-from-obs-ML/venv/bin/python ~/M2-Prestel-state-from-obs-ML/venv/bin/jupyter-lab --no-browser --port 1235 --IdentityProvider.token=c7b927e4bd9ad9f008a2491c40b8f5d4790945a935674a6e --ServerApp.allow_origin='*'

exit 0
