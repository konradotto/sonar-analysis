#!/bash/bin

# This script assumes that the current working directory 
# is version controlled with git.
# Based on this assumption it triggers an interactive list
# for selecting a git tag and checking out that version of the repository.

get_versions=$(git --no-pager tag)
versions=(${get_versions//$'\n'/ })
len=${#versions[@]}

# iterate versions and add them to a radiolist
RADIOLIST=""

for ((i=0; i<${len}; i++)); 
do 
  RADIOLIST="$RADIOLIST $i ${versions[${i}]} off "
done

# redirect stream 3 to 1 (STDOUT)
exec 3>&1

# show radiolist dialog and store user selection
result=$(dialog --backtitle "Radiolist" \
--radiolist "Select a version" 0 0 $len \
$RADIOLIST 2>&1 1>&3);

# close stream 3 again
exec 3>&-

# check out the selected version
version=${versions[$[result]]}
git checkout tags/${version}
