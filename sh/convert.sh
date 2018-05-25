#!/bin/bash

cp ../xq/2011_to_csv2.xq ./convert_template.xq
cp ../xq/RU_csv4.xq ./convert_template_ru.xq
#xmlfile = "TFS_OPEN_DATA-"

# for (( i = 2011; i <= 2016; i++)) do
#	echo ${i}
# done

for i in {2011..2016} 
do
#	echo $i
#	echo $(($i + 1))
	printf "Processing ${i} incidents..."
	BaseX convert_template.xq > ../csv/${i}_i.csv
	sed -i.bak "s/${i}/$((i + 1))/" convert_template.xq

	printf "Finished. Beginning ${i} Responding Units..."
	BaseX convert_template_ru.xq > ../csv/${i}_ru.csv
	sed -i.bak "s/${i}/$((i + 1))/" convert_template_ru.xq
	printf "Finished.\n"
done

rm convert_template.xq.bak
rm convert_template_ru.xq.bak
