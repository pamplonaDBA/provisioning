#!/bin/bash
#
#  PAMPLONA 2020-04
#  script wich sould create de facts file with the started services 
#
#
export PATH=$PATH:/usr/bin:bin:/sbin:/usr/sbin:/usr/local/bin
export LOGDIR=/etc/ansible/facts.d
export  DATE=`date +%F%H%M`
#
## ASM 
export LOGFILE=${LOGDIR}/asm.fact
echo >  ${LOGFILE}
for i in ` cat /etc/oratab|sed -e 's/# line added by Agent/ /g' -e 's/:/ /g' -e '/^$/d' |grep -v '#'|grep  ASM| awk '{ print $1}' `
do
 echo "[ASM]" >>${LOGFILE}
  ORACLE_HOME=` cat /etc/oratab|sed -e 's/# line added by Agent/ /g' -e 's/:/ /g' -e '/^$/d' |grep -v '#'|grep ${i} |awk '{ print $2}' `
  ACTIVO=`ps -ef |grep pmon |grep $i |grep -v grep |wc -l `
  echo "oracle_sid=$i" >>${LOGFILE}
  echo "oracle_home=$ORACLE_HOME" >>${LOGFILE}
  if [ ${ACTIVO} -eq 1 ]
     then
       echo "activo=true" >>${LOGFILE}
     else
       echo "activo=false" >>${LOGFILE}
     fi
 done
## Databases
export LOGFILE=${LOGDIR}/databases.fact
echo >  ${LOGFILE}

for i in ` cat /etc/oratab|sed -e 's/# line added by Agent/ /g' -e 's/:/ /g' -e '/^$/d' |grep -v '#'|grep -v ASM| awk '{ print $1}' `
 do
echo "[$i]" >>${LOGFILE}
ORACLE_HOME=` cat /etc/oratab|sed -e 's/# line added by Agent/ /g' -e 's/:/ /g' -e '/^$/d' |grep -v '#'|grep -w ${i} |awk '{ print $2}' `
ACTIVO=`ps -ef |grep pmon |grep $i |grep -v grep |wc -l `
echo "oracle_sid=$i " >>${LOGFILE}
echo "oracle_home=$ORACLE_HOME ">>${LOGFILE}
if [ ${ACTIVO} -eq 1 ]
 then
 echo "activo=true" >>${LOGFILE}
 else
 echo "activo=false" >>${LOGFILE}
fi
  done

export LOGFILE=${LOGDIR}/listeners.fact
echo >  ${LOGFILE}
#listeners
 for j in `ps -ef |grep lsnr|grep -v grep |awk '{print $9}'`
 do
 ORACLE_HOME=`ps -ef |grep lsnr|grep -v grep| grep -w $j |awk '{print $8}'`
 echo "[$j]" >>${LOGFILE}
 echo "oracle_home=${ORACLE_HOME:0:${#ORACLE_HOME}- 12}" >>${LOGFILE}
done

