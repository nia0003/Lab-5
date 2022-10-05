#! /bin/sh
#Sanity check
if [ $# - lt 1 ] || [ $# -gt 1 ]; then
echo "File not included"
else echo "File included"
exit
fi

#initialize variable
reverse=""

#read in data
name=`grep ">" $1`
sequence=`grep -v ">" $1`

#Sanity check
echo "Name: $name"

#calculate length of sequence
len=${#sequence}

echo "Length: $len"

#loop through sequence in reverse
reverse=`rev $sequence | tr 'ATGC' 'TACG'`

# Sanity check
echo "$sequence
$reverse
"

#complement sequence
rc=`echo $reverse | tr 'atcg' 'tagc'`

# Sanity check
echo "$rc
"

echo $name >$1.rc.txt
echo $rc >>$1.rc.txt
