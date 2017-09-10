#!/bin/bash
echo
echo -e "Please enter username for account or type Exit: \c"
read UserName
while [ $UserName != "Exit" ]
do
    useradd $UserName #
    passwd $UserName 
echo Account is ready for use.
done
echo Leaving script ...
exit

