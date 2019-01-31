# SUPERGOBUSTER
Based on an original script by <a href="https://github.com/lokori">lokori</a>.

### Usage
./supergobuster.sh http://10.10.10.10

### Details
SUPERGOBUSTER is an enumeration script that generates a huge amount of requests. Use with caution.
- Command must have an argument in the form of http://10.10.10.10 
- Press Ctrl-C to kill entire script
- This script will die if Gobuster receives a wildcard response
- Should work fine for HTTPS/SSL sites
- Prints found for HTTP response codes 200,204,301,302,307,403
