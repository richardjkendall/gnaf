#!/bin/bash

############################################################
#							   #
# load-mysql.sh						   #
#							   #
# Loads GNAF data to a MySQL database			   #
# 19/08/2020						   #
#							   #
############################################################

MYSQL_HOST="127.0.0.1"
MYSQL_USER="rjk"
MYSQL_PASS=""
MYSQL_DB="gnaf"

AUT=$1
AUT_REGEX="Authority_Code_([[:upper:]_]+)_psv\.psv"
DAT=$2
DAT_REGEX="(ACT|NSW|NT|QLD|SA|OT|TAS|VIC|WA)_([[:upper:][:digit:]_]+)_psv\.psv"

echo "*** creating tables ***"
mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASS $MYSQL_DB < create_tables_ansi.sql

echo ""
echo "*** Working on Authority codes ***"
echo "Authority files in folder $AUT"
echo ""

if [[ -d "$AUT" ]]; then
	echo "Authority codes is a folder"
	for aut_file in $AUT/*.psv; do
		echo "Got AUT file: $aut_file"
		if [[ "$aut_file" =~ $AUT_REGEX ]]; then
			TABLE_NAME=${BASH_REMATCH[1]}
			echo "Table name: $TABLE_NAME"
			echo "LOAD DATA LOCAL INFILE '$aut_file' INTO TABLE $TABLE_NAME COLUMNS TERMINATED BY '|' LINES TERMINATED BY '\r\n' IGNORE 1 LINES" | mysql --local-infile=1 --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASS $MYSQL_DB
		fi
	done
else
	echo "Authority codes is not a folder"
	exit -1
fi

echo ""
echo "*** Working on data files ***"
echo "Data files in folder $DAT"
echo ""

if [[ -d "$DAT" ]]; then
	echo "Data files is a folder"
	for dat_file in $DAT/*.psv; do
		echo "Got DAT file: $dat_file"
		if [[ "$dat_file" =~ $DAT_REGEX ]]; then
			TABLE_NAME=${BASH_REMATCH[2]}
			echo "Table name: $TABLE_NAME"
			echo "LOAD DATA LOCAL INFILE '$dat_file' INTO TABLE $TABLE_NAME COLUMNS TERMINATED BY '|' LINES TERMINATED BY '\r\n' IGNORE 1 LINES" | mysql --local-infile=1 --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASS $MYSQL_DB
		fi
	done
fi

echo ""
echo "*** creating the PK indexes ***"
mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASS $MYSQL_DB < add_pk.sql

