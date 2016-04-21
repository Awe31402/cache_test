#!/bin/bash

ARRAY_DIMS="1 2 4 8 16 32 64 128 256 512 1024 2048 4096 8192 16384"
FILE_OUT=.txt
RATE=""
TIME=""
rm "*$FILE_OUT"

calmiss(){
for i in $ARRAY_DIMS
do
	if [ $i -eq 1 ]; then
		valgrind --tool=cachegrind ./main $i 2>&1 | grep "miss rate" | awk '{print $2" "$3" "$4}' > tmp_file;
		RATE=`cat tmp_file`
		echo "Dimension "$RATE | sed 's/:/ /g' > data_$1.txt
	fi
	echo "Matrix dimension in $i" 
	valgrind --tool=cachegrind ./main $i 2>&1 | grep "miss rate" | awk '{print $5}' > tmp_file;
	RATE=`cat tmp_file`;
	echo $i"        " $RATE | sed 's/%/           /g' >>  data_$1.txt
done
}

caltime(){
for i in $ARRAY_DIMS
do
	if [ $i -eq 1 ]; then
		{ time ./main 1; } &> tmp_file;
		TIME=`cat tmp_file | awk '{print $1}'`
		echo "Dimension "$TIME > time_$1.txt
	fi
	echo "Matrix dimension in $i" 
	{ time ./main $i; } 2>&1 | tr "\t" " " | cut -d" " -f2 > tmp_file;
	TIME=`cat tmp_file | sed 's/s//g' | sed 's/0m//g'`;
	echo $i"        " $TIME >> time_$1.txt
done

}

if [ "$1" == "" ];then
make clean
make 
echo "In normal order..."
calmiss normal
make clean
make trans
echo "In another order..."
calmiss trans
rm cachegrind*
./plot_miss.sh
exit
fi

if [ "$1" == "t" ];then
make clean
make trans

caltime trans
make clean
make
caltime normal
./plot_time.sh
fi

