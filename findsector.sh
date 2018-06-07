#/bin/bash
echo "print input your file keyword?"
read keyword
echo "Please input your lun path (example : Pool1/lun)"
read lunpath


for i in $(zdb -eddddd $lunpath  | grep "L0 " | tail -n +2 | awk '{print $3":10000"}'); 
do echo $i;
found=$(zdb -eR Pool1 $i 2>&1 | grep $keyword | wc -l) 
if [ $found -gt 0 ];
then
echo "find disk sector = $i"
zdb -eR Pool1 $i > /root/result 2>&1
echo "result file save at /root/result"
exit 0


fi
 done
