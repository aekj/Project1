#!/bin/bash

states=( 'North Carolina' 'Washington' 'Minnesota' 'Hawaii' 'Wisconsin' )

for state in ${states[@]}
do
  if [ $state == 'Hawaii' ];
then
    echo "Hawaii is the best!"
else
    echo "I`m not a fan of Hawaii."
fi
done

num=$(echo {0..9})

for num in  ${nums[@]}
do 
   if [ $num = 3] || [ 4num = 5 ] || [ $num = 7 ]
then 
     echo $num
fi
done

ls_out=$(ls)
for x in ${ls_out[@]}
do 
    echo $x
done
