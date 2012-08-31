    #!/bin/bash
    # A shell script to add mysql database, username and password.
    # It can also grant remote access on fly while creating the database.
    # -------------------------------------------------------------------------
    # Copyright (c) 2007 nixCraft project <http://cyberciti.biz/fb/>
    # This script is licensed under GNU GPL version 2.0 or above
    # -------------------------------------------------------------------------
    # This script is part of nixCraft shell script collection (NSSC)
    # Visit http://bash.cyberciti.biz/ for more information.
    # -------------------------------------------------------------------------
    # Last updated on Jan/09/2010
    # -------------------------------------------------------------------------
    _db="$1"
    _user="$2"
    _pass="$3"
    _dbremotehost="$4"
    _dbrights="$5"
     
    ## Path to mysql bins ##
    mysql="/usr/bin/mysql"
    ## Mysql root settings ##
    _madminuser='root'
    _madminpwd='MySQL-PassWord'
    _mhost='localhost'
     
    # make sure we get at least 3 args, else die
    [[ $# -le 2 ]] && { echo "Usage: $0 'DB_Name' 'DB_USER' 'DB_PASSORD' ['remote1|remote2|remoteN'] ['DB_RIGHTS']"; exit 1; }
     
    # fallback to ALL rights
    [[ -z "${_dbrights}" ]] && _dbrights="ALL"
     
    # build mysql queries
    _uamq="${mysql} -u "${_madminuser}" -h "${_mhost}" -p'${_madminpwd}' -e 'CREATE DATABASE ${_db};'"
    _upermq1="${mysql} -u "${_madminuser}" -h "${_mhost}" -p'${_madminpwd}' -e \"GRANT ${_dbrights} ON ${_db}.* TO ${_user}@localhost IDENTIFIED BY '${_pass}';\""
     
     
    # run mysql queries
    $_uamq
    $_upermq1
     
     
    # read remote host ip in a bash loop
    # build queires to grant permission to all remote webserver or hosts via ip using the same username
    IFS='|'
    for i in ${_dbremotehost}
    do
    _upermq2="${mysql} -u "${_madminuser}" -h "${_mhost}" -p'${_madminpwd}' -e \"GRANT ${_dbrights} ON ${_db}.* TO ${_user}@${i} IDENTIFIED BY '${_pass}';\""
    $_upermq2
    done
