function checkOptions(){
while getopts "om" opt; do
    case $opt in
        o) listFilterFiles $opt $2;;
        m) listFilterFiles $opt $2;;
        \?) 
    esac
 done
}

function listFilterFiles(){
filenames=`ls ./`
for filename in $filenames
do
   if ( [ $1 == "o" ] && [ `isOwner $filename $2` == 1 ] ) || ( [ $1 == "m" ] && [ `isMonth $filename $2` == 1 ] )
   then 
        echo -e "File : $filename, Lines: `wc -l < $filename`"
    fi
done
}

isOwner(){
    if [ $2 == `stat --format "%U" $1` ]
    then
        echo 1
    else
        echo 0
    fi
}

isMonth(){
    if [ $2 == `ls -l $1 | awk -F " " '{print $6}'` ]
    then
        echo 1
    else
        echo 0
    fi
}

if [ $# == 2 ]
then 
    checkOptions $@ $2
else
    echo "Invalid Arguments"
fi