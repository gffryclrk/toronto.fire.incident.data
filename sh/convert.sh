#!/bin/bash

cp ../xq/2011_to_csv2.xq ./convert_template.xq
#xmlfile = "TFS_OPEN_DATA-"

# for (( i = 2011; i <= 2016; i++)) do
#	echo ${i}
# done

for i in {2011..2016} 
do
#	echo $i
#	echo $(($i + 1))
	echo "Processing ${i}.."
	BaseX convert_template.xq >> ../csv/${i}.csv
	sed -i.bak 's/${i}/$((i + 1))/' convert_template.xq
	printf "done ${i}\n"
done
