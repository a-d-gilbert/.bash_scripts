#!/bin/bash
S1='ssh'
S2='http'
S3='help'
S4='.'
if [  $1 == $S3 ] 
then
        echo "================================================================"
        echo "Example: gitinit ssh myUserName ."
        echo "This will use the current directory over ssh to create a repo."
        echo " "
        echo "Example git init http myUserName /path/to/dir"
        echo "This will use the path to the directory over http to create repo."
        echo "================================================================="

elif [ $# != 3 ] 
then
        echo "Usage gitinit [ssh | http] [github username] [directory]"
        echo "Enter 'gitinit help' for an example." 

else    
        dir=$3

        cd $dir && git init $S4 && touch README.md &&
        git add $S4 && git commit -m "first commit"

        if [ $1 == $S1 ] 
        then
                git remote add origin git@github.com:$2/${PWD##*/}.git &&
                git push origin master
        elif [ $1 == $S2 ] 
        then
                git remote add origin https://github.com/$2/${PWD##*/}.git &&
                git push origin master
        else
                echo "Please specify proper connection type."
                echo "Usage gitinit [ssh | http] [github username] [directory]"
                echo "Enter gitinit help for an example." 
        fi 
fi
