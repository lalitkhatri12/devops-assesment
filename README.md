# DevOps Assessment


## Task 1

### Part A

* run the response-script.sh file as below.
* if email utility is configured in your linux box, please change the To Parameter to actual email address in script and run it.

./response-script.sh apache_logs

Cron Job to run this script every hour: 
0 */1 * * * /tmp/response-script.sh

### Part B

* make sure every day logs are getting backed up in backup tape.
* delete logs which are older than 3 months OR zip/tar them and than delete log file.
* create the script to auto delete the log file, run script daily which will auto delete logs which are older than 3 months.
* if still face storage issue, zip/tar all the logs older thn 1 month and delete the logs file.

## Task 2

* Please find Jenkinsfile
* also find Dockerfile
* please pass the BRANCH name in jenkins job to trigger job for staging/release branch.

## THANK YOU
