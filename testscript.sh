#!/bin/bash

#cd /opt/SP/oracle/crm/siebsrvr/
#. ./siebenv.sh
#cd /opt/SP/oracle/crm/siebsrvr/bin/

buildid=$1
#SBL_CCSX21.4_B-29

if [ $# -eq 0 ]; then
    echo "No build_id provided exiting..."
	echo "Usage: script.sh buildid [OPTIONS]"
    exit 1
fi


trimid=$(echo "$buildid" | cut -d '_' -f2-)


export ddlquery="ddldict /u SADMIN /p Rogrusta88 /c entpprod_DSN /d SIEBEL /f /opt/SP/oracle/crm/siebsrvr/ddlsync/schema_$trimid.ddl /e y /a y /l /opt/SP/oracle/crm/siebsrvr/ddlsync/expschem_$trimid.log /n Siebel Repository-$buildid /T DCIR"


echo "modified ddl query" $ddlquery

echo $(date +"%d-%m-%y-%r")

#cd /opt/SP/oracle/crm/siebsrvr/bin/

export ddlquery2="ddlimp /u SIEBEL /p Teradion57 /c entpprod_DSN /f /opt/SP/oracle/crm/siebsrvr/ddlsync/schema_$trimid.ddl /e n /B SIEBEL_DATA /X SIEBEL_INDEX /G SSE_ROLE /Q /opt/SP/oracle/crm/siebsrvr/ddlsync/ddlsync_sql_$trimid.log /l /opt/SP/oracle/crm/siebsrvr/ddlsync/ddl_check_schema_$trimid.log /9 Y /S N"

echo "modified ddl query2" $ddlquery2

echo $(date +"%d-%m-%y-%r")
# more /opt/SP/oracle/crm/siebsrvr/ddlsync/ddlsync_sql_CCSX21.4_A-56.log