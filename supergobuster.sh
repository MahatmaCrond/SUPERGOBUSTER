#!/bin/bash

trap exit SIGINT;  

## Bash colours because we like nice things.
YELLOW="\033[01;33m"
BLUE="\033[01;34m"
BOLD="\033[01;01m"
RED="\033[01;31m"
RESET="\033[00m"


if [ $# -eq 0 ]
  then
    printf "\n"
    echo -e "${RED}Usage: ./supergobuster.sh http://IPADDRESS ${RESET}"
    printf "\n"
    echo "SUPERGOBUSTER is an enumeration script that generates a huge amount of requests. Use with caution."
    echo "Based on the original script by lokori https://gist.github.com/lokori/17a604cad15e30ddae932050bbcc42f9"
    printf "\n"
    echo -e "${BOLD}-- Must be a URL in the form of http://10.10.10.10 ${RESET}"
    echo -e "${BOLD}-- Press Ctrl-C to kill entire script${RESET}"
    echo "-- This script will die on a wildcard response."
    printf "\n"
    exit 1
fi

printf "\n"
echo -e "${YELLOW}WHO YOU GONNA CALL? SUPERGOBUSTER! $1 ${RESET}"
printf "\n"

gobuster -u $1 -t 20 -l -k -s 200,204,301,302,307,403 -w /usr/share/seclists/Discovery/Web-Content/common.txt
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/seclists/Discovery/Web-Content/Common-PHP-Filenames.txt
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/seclists/Discovery/Web-Content/tomcat.txt
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/seclists/Discovery/Web-Content/nginx.txt
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/seclists/Discovery/Web-Content/apache.txt
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/seclists/Discovery/Web-Content/RobotsDisallowed-Top1000.txt
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/seclists/Discovery/Web-Content/ApacheTomcat.fuzz.txt
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/seclists/Discovery/Web-Content/frontpage.txt
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/seclists/Discovery/Web-Content/iis.txt
gobuster -u $1 -t 20 -l -k -s 200,204,301,302,307,403 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -x txt
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -x php 
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -x doc 
gobuster -u $1 -l -k -s 200,204,301,302,307,403 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -e -x docx

