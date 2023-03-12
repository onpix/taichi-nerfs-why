# !/bin/bash
ROOT=/Users/why/dev/pycharm-project/taichi-nerfs-why/src
# LOCALDIR=${ROOT}/src

DATE=$(date -R)
LOCKPATH=${LOCALDIR}/modified.lock
echo Sync folder: ${LOCALDIR}
echo "Write the lastest mofification time (${DATE}) to ${LOCKPATH}"
echo ${DATE} > $LOCKPATH

echo Uploading to CSLAB...
echo =====================
rsync -avz --delete --exclude '.git' ${LOCALDIR} node1:~/taichi-nerfs-why
echo =====================
echo ...Done.


echo Uploading to HPC...
echo =====================
rsync -avz --delete --exclude '.git' ${LOCALDIR} hpc:~/taichi-nerfs-why
echo =====================
echo ...Done.


