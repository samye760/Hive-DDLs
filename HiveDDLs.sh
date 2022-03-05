#!/bin/bash

tables=$1
ddl_name='/home/d88665/HiveTableDDL.txt'
combined_ddl='/home/d88665/HiveDDLs.txt'

wc $tables

wait

cat $tables | while read LINE
do
    sleep .5
    echo $LINE
    sleep .5
	hive -e "show create table $LINE" > temp.txt
    sleep .5
	sed -i '/TBLPROPERTIES/,$d' temp.txt
    sleep .5
	sed -i '$ s/$/;/' temp.txt
    sleep .5
	cat temp.txt >> DDLs.hql
    sleep .5
	echo -e "\n" >> DDLs.hql
    sleep .5
	echo $LINE
    sleep .5
done

sleep .5

sed -i 's/CREATE EXTERNAL TABLE/CREATE EXTERNAL TABLE IF NOT EXISTS/g' DDLs.hql

sleep .5

sed -i 's/edl-test1//g' DDLs.hql

sleep .5

sed -ir 's/2022.*//g' DDLs.hql

WC=$(grep "CREATE EXTERNAL TABLE" DDLs.hql | wc -l)

sleep .5

echo "Table DDL generated for ${WC} tables." 
