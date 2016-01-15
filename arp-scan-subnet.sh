#!/bin/bash
for a in $(seq 10 10); do
    for b in $(seq 42 42); do
        for c in $(seq 0 0); do
            for d in $(seq 0 255); do
		echo -e "$a.$b.$c.$d \n"  ;
#                sh -c "arping -A -q -c 1 -T $a.$b.$c.$d $TARGET_MAC
                sh -c "arping -I eth0 -A -q -c 1 $a.$b.$c.$d $TARGET_MAC
                if [ \$? = 0 ]; then
                    echo Got answer with address: $a.$b.$c.$d
		else
			echo Meh for:  $a.$b.$c.$d
                fi" &
            done
            wait
        done
    done
done
