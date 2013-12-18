#Scripts

Preface
-------
This is a collection of scripts I have collected over time...from bash/shell, python, perl to php. Using cPanel frequently gave me the idea to put these together for easy deployment and management. Some of the code I wrote, some I changed, some I didn't even edit. Normally these are smaller scripts that don't need their own repo.

***Use at your own risk.***

If you're unsure how to use these you should leave this page now.

Script | Usage
--- | ---
adddnszone | ./adddnszone example.com 8.8.8.8 [profile]
addmysqldbanduser | ./addmysqldbanduser 'DB_Name' 'DB_USER' 'DB_PASSORD' ['remote'] ['DB_RIGHTS']
checkdomainserialnumbers | ./checkdomainserialnumbers ns1 ns2 domain
chmod-copy-perms.sh | ./chmod-copy-perms.sh /copy/perm/from /copy/perm/to
chown-copy-ownership.sh | ./chown-copy-ownership.sh /copy/ownership/from /copy/ownership/to
chmodwp | ./chmodwp /path/or/file
cpremovefrontpage | ./cpremovefrontpage
dumpnetworkinfo | ./dumpnetworkinfo
geoip | ./geoip 'ip or url'
getdatacenterinfo | ./getdatacenterinfo example.com example2.com ...
getmemoryusage | python getmemoryusage
installvnstat | ./installvnstat
mysqloptimizefragmentedtables | ./mysqloptimizefragmentedtables
patchwhmcsgc | ./patchwhmcsgc
node-and-npm | ./node-and-npm

___

### [checkdomainserialnumbers](https://github.com/tripflex/scripts/blob/master/checkdomainserialnumbers)
This can be used to see if two different name servers have the same record or not.  DNS records are tracked by the serial number that is increased each time there is an update, which is based off the date.  The reason DNS servers would have different records is because of caching, this is an easy way to check.

### [dumpnetworkinfo](https://github.com/tripflex/scripts/blob/master/dumpnetworkinfo)
Running this script will automatically generate and output a file in the same directory with the syntax `network.D-M-Y.info.txt` .  This is normally a script I will use to diagnose network problems at a later time, or I send it to people to generate a report on their machine to troubleshoot remotely.

### [chmod-copy-perms.sh](https://github.com/tripflex/scripts/blob/master/chmod-copy-perms.sh)
This is a simple shell script that will copy all permissions from one directory to another.  You should only need this if you forget to use -p to retain permissions when copying files.  Much easier to use this script than start all over and copy the files again.  This script will recursively copy all permissions from one directory/file to another.

### [chown-copy-ownership.sh](https://github.com/tripflex/scripts/blob/master/chown-copy-ownership.sh)
This is a simple shell script that will copy ownership from one directory to another.  You should only need this if you forget to use -p to retain permissions when copying files.  Much easier to use this script than start all over and copy the files again.  This script will recursively copy all ownership from one directory/file to another.

### [node-and-npm](https://github.com/tripflex/scripts/blob/master/node-and-npm)
Simple and quick script that will download and install the lastest version of Node.js and NPM (Node Package Manager) on Ubuntu/Debian.  It will also add node and npm to path variable in .bashrc file.

### [getmemoryusage](https://github.com/tripflex/scripts/blob/master/getmemoryusage)
This is a Python script that will output memory usage **Per Program** as a whole, which can be very useful when tracking down memory issues, leaks, etc.  It's also just a lot easier way to view on a program/script basis.

### [mysqloptimizefragmentedtables](https://github.com/tripflex/scripts/blob/master/mysqloptimizefragmentedtables)
[source](http://meinit.nl/optimize-only-fragmented-tables-mysql)

This script is courtesy of [meinit.nl](http://meinit.nl), and it will run through every table in every database and ***check*** if the table is fragmented, and ***only*** optimize if needed.  Because tables are locked during optimization, you can't write to them.  This prevents optmization when it's not necessary.

### [patchwhmcsgc](https://github.com/tripflex/scripts/blob/master/patchwhmcsgc)
This was a script I wrote to patch WHMCS Google Checkout security vulnerability.  When you have a lot of servers, with a lot of customers using WHMCS...it can be very tedious updating them all.  Created a version that took list of servers to update, but simplified this one to allow users to run it on their own server when only needing to update one.
