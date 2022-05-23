#!/bin/bash
#set -x
if [ -z $1 ] ; then
test=$(pwd)
else
test=$1
fi




assertion=$(grep "Assertion Failed" $test/console.log | tr "," "." )
planeVersion=$(grep "eric-pc-up-data-plane" $test/Pcg*/kubectl/kube_info/k-get-configmaps-all-namespaces.yaml | grep helm.sh | awk '{print $2}')
gatewayVersion=$(grep "eric-pc-gateway" $test/Pcg*/kubectl/kube_info/k-get-configmaps-all-namespaces.yaml | grep -v helm | grep chart | awk '{print $2}')
testDate=$(basename $test)
echo ",###" $planeVersion "," $gatewayVersion "###," $testDate "," $assertion
