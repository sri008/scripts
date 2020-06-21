#!/bin/bash

end=50
for i in {1..5}
do 
number=$RANDOM
let "number %= $end"
echo "Random number $number"
done
