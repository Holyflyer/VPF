#!/bin/bash
# for Vdeploy PRDRTS generation
ulimit -s 60000
if [ ! -d /opt/visionplus/flex/DV@18/ ]; then echo "There are no directory /opt/visionplus/flex/DV@18/";exit;fi
prd_rts="/opt/visionplus/flex/DV@18/VS.@18.FBAU.PRDRTS"
echo "REBUILD FBAU.PRDRTS starting..."
echo `whoami` `date +"%H:%M:%S"` rm -rf ${prd_rts}.'*';rm -rf ${prd_rts}.*
prd_bases=`ls -d /opt/visionplus/flex/DV@99/* | grep F102.PRD.`
for prd_base in $prd_bases;do
  prd_root=${prd_base//99/18}
  mkdir -p ${prd_root//F102.PRD/FBAU.PRDRTS}
  echo `date +"%H:%M:%S"` cp $prd_base/'*';cp -n --preserve $prd_base/* ${prd_root//F102.PRD/FBAU.PRDRTS}/
done

prd_fbaus=`ls -d /opt/visionplus/flex/DV@18/* | grep FBAU.PRD.`
for prd_fbau in $prd_fbaus;do
  #prd_root=${prd_base//18/99}
  mkdir -p ${prd_fbau//FBAU.PRD/FBAU.PRDRTS}
  echo `date +"%H:%M:%S"` cp $prd_fbau/'*';cp -n --preserve $prd_fbau/* ${prd_fbau//FBAU.PRD/FBAU.PRDRTS}/
done
