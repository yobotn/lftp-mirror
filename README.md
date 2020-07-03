# Mirror files from remote FTP folder to local folder using LFTP in Linux

```diff
- This script logs errors when unable to connect to server or failed logins only!
```

## Usage
```sh
$ sudo wget https://github.com/yobotn/lftp-mirror/blob/master/config_ftp.txt
$ sudo wget https://github.com/yobotn/lftp-mirror/blob/master/mirror_ftp.sh
```

- **1.** Edit **mirror_ftp.sh** file and set where to mirror your remote ftp folder by changing **LCD** variable.
- **2.** Edit **config_ftp.txt** file and set your ftp login credentials.

##  Documentation

### - config_ftp.txt

- This file is required  to be read from the mirror_ftp.sh file.

 - This file has **SERVER**, **USER**, **PASSWORD** values to connect to the FTP server.

 - **TIMESYNC** value is used to determine how often to repeat mirroring in X minutes.


### - mirror_ftp.sh

 - This file has two parts, the first part is the ***Logger*** function that accept log from the mirroring task, and the second part is the ***LFTP*** script to mirror the files from the remote FTP folder to local folder.


VARIABLE | COMMENT
------------ | -------------
***DEBUG*** | where to show/save logs >  "**0**">**Terminal** "**1**">**Log file**
***LOG_FILE*** | where to save log file
***CONFIG_FILE*** | ftp config file location
***LCD*** | where to mirror files
***PARALLEL*** | how many files to download in 

