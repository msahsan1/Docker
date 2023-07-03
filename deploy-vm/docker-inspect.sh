while read -r   name ; do
     echo $name; docker inspect $name | grep -i IPA	
done < data

