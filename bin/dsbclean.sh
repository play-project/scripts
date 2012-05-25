#!/bin/bash
# Clean all the PETALS DSB temporary files in the /tmp directory


echo "Cleaning /tmp folder..."

# Looping since rm can not handle huge amount of files...
for i in `seq 0 9`
do
	rm -fr /tmp/PETALS-WSNPOLLER2JBI-$i*
	rm -fr /tmp/PETALS-WS2JBI-$i*
	rm -fr /tmp/PETALS-JBI2WS-$i*
	rm -fr /tmp/petalstmpdir$i*
done
echo "Done!"
