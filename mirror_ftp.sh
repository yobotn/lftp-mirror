#!/bin/bash

##########################
#	  Logging Script
##########################

DEBUG="1" #0-TERMINAL/1-FILE

LOG_FILE="log.lftp"

logErrors() {

    while read ERR

		do

			if grep -vq "source\|Removing\|Transferring" <<< "${ERR}"; then

				RESULT=$(date)" [ERROR] ${ERR}"

				if [ "${DEBUG}" -eq "0" ]; then
					echo "${RESULT}"
				fi

				if [ "${DEBUG}" -eq "1" ]; then
					echo "${RESULT}" >> log.lftp
				fi

			fi

		done

}

##########################
#	   Mirror Script
##########################

CONFIG_FILE="configFTP.txt"

if [ ! -f "${CONFIG_FILE}" ]; then

	MSG=$(date)" [INFO] No configuration file were found!"

	if [ "${DEBUG}" -eq "0" ]; then
		echo "${MSG}"
	fi

	if [ "${DEBUG}" -eq "1" ]; then
		echo "${MSG}" >> log.lftp
	fi

	exit 0
fi

. ${CONFIG_FILE}

SERVER=${SERVER}

USER=${USER}

PASS=${PASSWORD}

LCD="/var/www/html/kioskolam/photos/content"
mkdir -p ${LCD}

RCD="/"

PARALLEL=2

while true

    do

		lftp  -f "

			set ftp:ssl-force true

			set ftp:ssl-protect-data true

			set ssl:verify-certificate no

			open -u $USER,$PASSWORD $SERVER

			mirror --only-newer --parallel=$PARALLEL --continue --delete --verbose $RCD $LCD

			bye

		"  2>&1 | logErrors

		sleep "${TIMESYNC}m"

done