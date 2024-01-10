#!/bin/bash

mashmap -q $1 -r $2 -k 3 --pi 50 -s 100 -K --dense --output forward.out
mashmap -q $2 -r $1 -k 3 --pi 50 -s 100 -K --dense --output reverse.out
C1=$(awk '{print $1}' forward.out | sort -u | wc -l)
C2=$(awk '{print $1}' reverse.out | sort -u | wc -l)
T1=$(grep -c ">" < "$1")
T2=$(grep -c ">" < "$2")
result=$(echo "($C1 + $C2) / ($T1 + $T2)" | bc -l)
echo "Estimated POCP: $result"
