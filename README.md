# Mirror files from remote FTP folder to local folder using LFTP in Linux

```diff
- This script logs errors when unable to connect to server or failed logins only!
```

## Usage
```sh
$ sudo wget https://github.com/yobotn/lftp-mirror/blob/master/config_ftp.txt
$ sudo wget https://github.com/yobotn/lftp-mirror/blob/master/mirror_ftp.sh
```

- Edit **mirror_ftp.sh** file and set where to mirror your remote ftp folder by changing **LCD** variable.
- Edit **config_ftp.txt** file and set your ftp login credentials.

```sh
$ sudo vim mirror_ftp.sh
$ sudo vim config_ftp.txt 
```

or

```sh
$ sudo nano mirror_ftp.sh 
$ sudo nano config_ftp.txt
```

- Now you can make the **mirror_ftp.sh** file an executable or run it with bash directly.

**Executable**
```sh
$ sudo chmod +x mirror_ftp.sh
$ sudo ./mirror_ftp.sh
```

**Bash**
```sh
$ sudo bash mirror_ftp.sh
```

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

