#!/bin/bash

############################################################
#							   #
# load-postgres.sh					   #
#							   #
# Loads GNAF data to a postgres database		   #
# 21/08/2020						   #
#							   #
############################################################

PG_HOST="127.0.0.1"
PG_USER="rjk"
PG_PASS="test123"
PG_DB="gnaf"

AUT=$1
AUT_REGEX="Authority_Code_([[:upper:]_]+)_psv\.psv"
DAT=$2
DAT_REGEX="(ACT|NSW|NT|QLD|SA|OT|TAS|VIC|WA)_([[:upper:][:digit:]_]+)_psv\.psv"

echo "*** creating tables ***"
PGPASSWORD=$PG_PASS psql -h $PG_HOST -U $PG_USER -d $PG_DB -a -f create_tables_ansi.sql

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
			echo "\copy $TABLE_NAME FROM '$aut_file' DELIMITER '|' CSV HEADER" | PGPASSWORD=$PG_PASS psql -h $PG_HOST -U $PG_USER -d $PG_DB 
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
			echo "\copy $TABLE_NAME FROM '$dat_file' DELIMITER '|' CSV HEADER" | PGPASSWORD=$PG_PASS psql -h $PG_HOST -U $PG_USER -d $PG_DB
		fi
	done
fi

echo ""
echo "*** creating the PK indexes ***"
#mysql --host=$MYSQL_HOST --user=$MYSQL_USER --password=$MYSQL_PASS $MYSQL_DB < add_pk.sql

