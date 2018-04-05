pdftotext -layout s1.pdf
tr -d '\n' < s1.txt > s1temp.txt && mv s1temp.txt s1.txt
sed -i 's/MDL16CS/\nMDL16CS/g' s1.txt
sed -i 'N;s/   \+/ /g' s1.txt
sed -i 's/\o14//g' s1.txt
sed -i 's/ELE/\nELE/g' s1.txt
sort -h  s1.txt>s1temp.txt && mv s1temp.txt s1.txt
join -1 1 -2 1 s1.txt studentsregno.txt>csresults.txt
sed  's/,//g;s/MA101(//;s/PH100(//;s/BE110(//;s/BE10105(//;s/BE103(//g;s/EE110(//g;s/EE100(//;s/PH110(//;s/CS110(//g' csresults.txt>csresults2.txt
sed  's/O)/10/g;s/A+)/9/g;s/A)/8.5/g;s/B+)/8/g;s/B)/7/g;s/C)/6/g;s/P)/5/g;s/F)/0/g' csresults2.txt>temp.txt
awk '{print $1,(($2*4)+($3*4)+($4*3)+($5*3)+($6*3)+($7*3)+$8+$9+$10)/23}' temp.txt>s1gpa.txt
pdftotext -layout s2.pdf
tr -d '\n' < s2.txt > s2temp.txt && mv s2temp.txt s2.txt
sed -i 's/MDL16CS/\nMDL16CS/g;s/TCE16/\nTCE/g' s2.txt
sed -i 'N;s/   \+/ /g' s2.txt
sed -i 's/\o14//g' s2.txt
sed -i 's/ELE/\nELE/g' s2.txt
sort -h  s2.txt>s2temp.txt && mv s2temp.txt s2.txt
join -1 1 -2 1 s2.txt studentsregno.txt>s2results.txt



