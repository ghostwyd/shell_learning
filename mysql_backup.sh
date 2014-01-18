#! /bin/sh

dir=`dirname $0`
if [ "$dir" = "" ];then
    dir="."
fi
cd $dir

date_str=`date +"%Y-%m-%d"`
data_base="tras"
passwd="tras"
user="tras"
file_name="tras_backup.${date_str}"
tar_name="${file_name}.tar.gz"

/usr/local/mysql/bin/mysqldump -u$user -hlocalhost -p$passwd $data_base  > $file_name
tar zcvf $tar_name $file_name
if [ $? -eq 0 ];then
    rm -f $file_name
fi

find . -maxdepth 1 -name "tras_backup.*" -type f -ctime +7
find . -maxdepth 1 -name "tras_backup.*" -type f -ctime +7 -exec  rm {} \; 
