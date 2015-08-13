#!/bin/bash
dir=${PWD##*/}
curl -i -H 'Authorization: token secret token goes here' \
	-d '{
		"name": "'$dir'",
		"description": "new repo",
		"private": false,
		"auto_init": true,
		"has_issues": true,
		"gitignore_template": "nanoc" 
		}' https://api.github.com/user/repos &&

		git init &&
		git remote add origin git@github.com:a-d-gilbert/$dir.git &&
		git pull origin master 

