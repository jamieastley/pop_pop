#!/bin/bash

url=$(git config --get remote.origin.url)

re="^(https|git)(:\/\/|@)([^\/:]+)[\/:]([^\/:]+)\/(.+).git$"

# Parse the origin URL and get the user and repo name for links
if [[ $url =~ $re ]]; then    
    protocol=${BASH_REMATCH[1]}
    separator=${BASH_REMATCH[2]}
    hostname=${BASH_REMATCH[3]}
    user=${BASH_REMATCH[4]}
    repo=${BASH_REMATCH[5]}

	# Generates a markdown-friendly changelog by rendering commit hashes and JIRA project codes as hyperlinks.
	# `$1` = commit to...from ref
	git log --pretty=format:'<li> (<a href="https://github.com/'$user'/'$repo'/commits/%H">%h</a>) - %s</li> ' --no-merges $1
else 
	exit 1
fi
