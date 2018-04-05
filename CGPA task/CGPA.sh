pdftotext -layout s1.pdf
tr -d '\n' < s1.txt > s1temp.txt && mv s1temp.txt s1.txt
sed -i 's/MDL16CS/\nMDL16CS/g' s1.txt
sed -i 'N;s/   \+/ /g' s1.txt
sed -i 's/\o14//g' s1.txt
sed -i 's/ELE/\nELE/g' s1.txt
sort -h  s1.txt>s1temp.txt && mv s1temp.txt s1.txt
join -1 1 -2 1 s1.txt studentsregno.txt>s1results.txt
sed -i 's/,//g;s/MA101(//;s/PH100(//;s/BE110(//;s/BE10105(//;s/BE103(//g;s/EE110(//g;s/EE100(//;s/PH110(//;s/CS110(//g' s1results.txt
sed -i  's/O)/10/g;s/A+)/9/g;s/A)/8.5/g;s/B+)/8/g;s/B)/7/g;s/C)/6/g;s/P)/5/g;s/F)/0/g' s1results.txt
awk '{print $1,(($2*4)+($3*4)+($4*3)+($5*3)+($6*3)+($7*3)+$8+$9+$10)/23}' s1results.txt>s1sgpa.txt

pdftotext -layout s2.pdf
tr -d '\n' < s2.txt > s2temp.txt && mv s2temp.txt s2.txt
sed -i 's/MDL16CS/\nMDL16CS/g;s/TCE16/\nTCE/g' s2.txt
sed -i 'N;s/   \+/ /g' s2.txt
sed -i 's/\o14//g' s2.txt
sed -i 's/ELE/\nELE/g' s2.txt
sort -h  s2.txt>s2temp.txt && mv s2temp.txt s2.txt
join -1 1 -2 1 s2.txt studentsregno.txt>s2results.txt
sed -i  's/,//g;s/MA102(//;s/CY100(//;s/BE100(//;s/EC100(//;s/BE102(//g;s/EC110(//g;s/CY110(//;s/CS120(//;s/CS100(//g' s2results.txt
sed -i  's/O)/10/g;s/A+)/9/g;s/A)/8.5/g;s/B+)/8/g;s/B)/7/g;s/C)/6/g;s/P)/5/g;s/F)/0/g' s2results.txt
awk '{print $1,(($2*4)+($3*4)+($4*3)+($5*1)+($6*1)+($7*4)+($8*3)+($9*3)+($10*1))/24}' s2results.txt>s2sgpa.txt

join s1sgpa.txt s2sgpa.txt>s1s2.txt
awk '{print $1,(($2*23)+($3*24))/47}' s1s2.txt>cgpa.txt
