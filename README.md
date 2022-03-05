# Hive-DDLs

This script is used to collect a mass amount of create table DDLs in Hive. This is useful if one needs to migrate a bunch of different tables to separate servers. The usage is to give as the first argument a file with all the table names, and the script will take care of getting and formatting the DDL and placing them all neatly into a new file.
