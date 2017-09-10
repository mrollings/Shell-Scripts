#! /bin/bash
#
# This script will generate 30 passwords with 2 upper, 2 lower, 2 special character and 14 characters
#
if [[ -z  $1 ||  $1 == "0"  ]]; then
STRICT="0"
else
STRICT="1"
fi
if [[ -z $2 || $2 -ne "0" ]]; then
WORD="1 "
else
WORD="0 -t "
fi
if [ -z $3 ]; then
NUMPWD="30"
else
NUMPWD=$3
fi
DONE=0
i=0
echo -n "Enter Seed Value: "; read -s SEED
APG_PARM=" -M SNCL -a $WORD -m 15 -x 15 -n 1 -E \\\/\~\|\"\'\`\(\)\{\}\?\<\>\[\] -c $SEED"
echo "password list" > "./pwfile.txt"
while [ $DONE == "0" ]
do
PW=`/usr/bin/apg $APG_PARM`; UPPER=`echo $PW |grep -o '[[:upper:]]'| wc -l`; LOWER=`echo $PW | grep -o '[[:lower:]]'| wc -l`; DIGIT=`echo $PW |grep -o '[[:digit:]]'| wc -l`; PUNCT=`echo $PW | grep -o '[[:punct:]]'| wc -l`
if [ $STRICT == "1" ]; then
if [[ ($LOWER -ge "2") && ($UPPER -ge "2") && ($DIGIT -ge "2") && ($PUNCT -ge "2") ]]; then
  echo $i $PW $LOWER $UPPER $DIGIT $PUNCT "GOOD PW !"
  i=$(($i + 1))
  echo $i $PW >> "./pwfile.txt"
else
  echo $i $PW $LOWER $UPPER $DIGIT $PUNCT "BAD PW TRY AGAIN !"
fi
else
  echo $i $PW 
  echo "$0i $PW " >> "./pwfile.txt"
  i=$(($i + 1))
fi
if [ $i == $(($NUMPWD + 1 )) ]; then
  DONE="1";
fi
done
echo "pwfile.txt created"
