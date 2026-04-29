#! /bin/bash


#koniec=16
#terazh=
#terazm=$(date +%M)

#zostalo_h=
#zostalo_min=$((60-$terazm))

echo "Do końca pracy o 17 zostało: $((17-($(date +%H)+1))):$((60-$(date +%M)))"

if [ $1 -eq  1 ] 
then
 echo test
fi