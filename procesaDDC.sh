#!/bin/bash
#set -x
runningTest=$1
kpiPattern=$2
additionalVars=$3

if [ -z $1 ] ; then
    runningTest=$(pwd)
else
    runningTest=$1
fi

runningTest=$(readlink -f ${runningTest})

#runningTest=/proj/pcc_pcg_logs/automation/eric-pc-gateway/master/stability/PcgAo_Stability_DPI_Multifeature_EBM_stable_LoadNormal_Small_MesosA_3h/1.48.0-34/220401_183109/PcgAo_Stability_DPI_Multifeature_EBM_stable_LoadNormal_Small_MesosA_3h_20220401_124552_714


#kpiPattern="reporting_ebm"
#kpiPattern="ebm"
#kpiPattern="pc_up_pktio"
#kpiPattern="pc_up_pktio"
kpiPattern="pc_up_event_reporting_sent_events"
additionalVars="code,result,operation,type,role,source,reason,action,resend,instance,cpu,workload_name"



dateex=$(date +%F_%H_%M_%S)


#mkdir $HOME/results/fullddc$dateex
mkdir  -p $HOME/ddc/process
rm $HOME/ddc/process/*
#echo Descomprimiendo
cd  $HOME/ddc/process
for i in $(find ${runningTest} -name 'diag*.tar.gz') ; do
    printf "Process file : $i\n"
    tar  xzfO $i  --wildcards "diag*/metrics*"   | tar xzf - --strip-components 1  --wildcards "*$kpiPattern*"
done



initialVar="__name__"
addVar="$initialVar,$additionalVars"
IFS=', ' read -r -a arrAddVar<<< "$addVar"
addedVars=""
addedRes=""
for i in "${arrAddVar[@]}"; do
  addedVars="${addedVars}| .metric.${i} as \$var_${i}"
  addedRes="${addedRes} + [\$var_${i}]"
done
salida=".data.result []  $addedVars | .values [] $addedRes | @csv "
echo $salida > command.jq


echo "TS,VALUE,KPI,${additionalVars},date" >  output

"Temp directory
TMP=$HOME/tmp
mkdir -p ${TMP}

$HOME/bin/dataPrueba.sh $runningTest > ${TMP}/${USER}_dataprueba.txt 

jq -r -f command.jq *$kpiPattern* >>  output
awk -F"," '{OFS=",";  if (NR>1){ $(NF+1)=strftime("%Y-%m-%d %H:%M:%S", $1)} ; print $0;}'  output > ${TMP}/${USER}_outputDdc.txt
#awk -F"," '{OFS=",";  if (NR>1){ $(NF+1)=strftime("%Y-%m-%d %H:%M:%S", $1)} ; print $0}'  output > fullddc$dateex.csv
mkdir -p $HOME/results
paste ${TMP}/$USER_outputDdc.txt ${TMP}/${USER}_dataprueba.txt> $HOME/results/fullddc$dateex.csv
