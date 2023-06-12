function checkOptions(){
while getopts "om" opt; do
    case $opt in
        o) listAllFiles 'o' $2;;
        m) listAllFiles 'm' $2;;
    esac
 done
}

function listAllFiles(){
filenames=`ls ./`
for filename in $filenames
do
   if ( [ $1 == "o" ] && [ `functionIsOwner` == "true" ] ) || ( [ $1 == "m" ] && [ `functionIsMonth` == "true" ] )
   then 
    echo -e "File : $filename, Lines: `wc -l < $filename`"
    fi
done
}

functionIsOwner(){
    echo "true"
}

functionIsMonth(){
    echo "true"
}

checkOptions $@ $2
