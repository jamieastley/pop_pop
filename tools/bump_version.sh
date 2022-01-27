#!/bin/bash

# ! SHOULD BE EXECUTED FROM WORKSPACE ROOT

# Thanks goes to @pete-otaqui for the initial gist:
# https://gist.github.com/pete-otaqui/4188238
#
# Original version modified by Marek Suscak
#
# works with a file called VERSION in the current directory,
# the contents of which should be a semantic version number
# such as "1.2.3" or even "1.2.3-beta+001.ab"

# this script will display the current version, automatically
# suggest a "minor" version update, and ask for input to use
# the suggestion, or a newly entered value.

# once the new version number is determined, the script will
# pull a list of changes from git history, prepend this to
# a file called CHANGELOG.md (under the title of the new version
# number), give user a chance to review and update the changelist
# manually if needed and create a GIT tag.

NOW="$(date +'%B %d, %Y')"
RED="\033[1;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
RESET="\033[0m"

LATEST_HASH=`git log --pretty=format:'%h' -n 1`

QUESTION_FLAG="${GREEN}?"
WARNING_FLAG="${YELLOW}!"
NOTICE_FLAG="${CYAN}❯"

PACKAGE_PATH="packages/${1}"

ADJUSTMENTS_MSG="${QUESTION_FLAG} ${CYAN}Now you can make adjustments to ${WHITE}CHANGELOG.md${CYAN}. Then press enter to continue."
PUSHING_MSG="${NOTICE_FLAG} Committing changes and tagging release, don't forget to push to ${WHITE}origin${CYAN}\n!"

if [ -f ${PACKAGE_PATH}/VERSION ]; then
    CURRENT_VERSION=`cat ${PACKAGE_PATH}/VERSION | sed "s/${1}-v//"`
    BASE_LIST=(`echo $CURRENT_VERSION | tr '.' ' '`)
    V_MAJOR=${BASE_LIST[0]}
    V_MINOR=${BASE_LIST[1]}
    V_PATCH=${BASE_LIST[2]}
    echo "${NOTICE_FLAG} Current version: ${WHITE}$CURRENT_VERSION"
    echo "${NOTICE_FLAG} Latest commit hash: ${WHITE}$LATEST_HASH"
    V_MINOR=$((V_MINOR + 1))
    V_PATCH=0
    SUGGESTED_VERSION="$V_MAJOR.$V_MINOR.$V_PATCH"
    echo "${QUESTION_FLAG} ${CYAN}Enter a version number [${WHITE}$SUGGESTED_VERSION${CYAN}]: "
    read INPUT_STRING
    if [ "$INPUT_STRING" = "" ]; then
        INPUT_STRING=$SUGGESTED_VERSION
    fi
    echo "${NOTICE_FLAG} Will set new version to be ${WHITE}$INPUT_STRING"
    echo $INPUT_STRING > ${PACKAGE_PATH}/VERSION
    echo "# $INPUT_STRING \n" > ${PACKAGE_PATH}/tmpfile
	
	# Generate and format changelog from commits between `$CURRENT_VERSION` and `HEAD`
	sh tools/generate_changelog.sh $1-v$CURRENT_VERSION...HEAD >> ${PACKAGE_PATH}/tmpfile
    echo "" >> ${PACKAGE_PATH}/tmpfile
    echo "" >> ${PACKAGE_PATH}/tmpfile
    cat ${PACKAGE_PATH}/CHANGELOG.md >> ${PACKAGE_PATH}/tmpfile
    mv ${PACKAGE_PATH}/tmpfile ${PACKAGE_PATH}/CHANGELOG.md
	
	# Bump build number in `pubspec.yaml`
	export NEW_VERSION=$INPUT_STRING
	perl -i -pe 's/^(version:\s[0-9]+.[0-9]+.[0-9]+.*)$/"version: $ENV{NEW_VERSION}"/e' ${PACKAGE_PATH}/pubspec.yaml
 
    echo "$ADJUSTMENTS_MSG"
    read
    echo "$PUSHING_MSG"
    git add ${PACKAGE_PATH}/CHANGELOG.md ${PACKAGE_PATH}/VERSION ${PACKAGE_PATH}/pubspec.yaml &&
	git commit -m "chore(${1}): v${NEW_VERSION}" -m "- Update \`CHANGELOG.md\` and \`pubspec.yaml\`" && 
	git tag -a -m "${1}-v${NEW_VERSION}" "${1}-v${NEW_VERSION}"
else
    echo "${WARNING_FLAG} Could not find a VERSION file."
    echo "${QUESTION_FLAG} ${CYAN}Do you want to create a version file and start from scratch? [${WHITE}y${CYAN}]: "
    read RESPONSE
    if [ "$RESPONSE" = "" ]; then RESPONSE="y"; fi
    if [ "$RESPONSE" = "Y" ]; then RESPONSE="y"; fi
    if [ "$RESPONSE" = "Yes" ]; then RESPONSE="y"; fi
    if [ "$RESPONSE" = "yes" ]; then RESPONSE="y"; fi
    if [ "$RESPONSE" = "YES" ]; then RESPONSE="y"; fi
    if [ "$RESPONSE" = "y" ]; then
		INITIAL_VERSION=0.1.0
        echo $INITIAL_VERSION > ${PACKAGE_PATH}/VERSION
        echo "# $INITIAL_VERSION \n" > ${PACKAGE_PATH}/CHANGELOG.md

		# Generate and format changelog from commits
		# $2 arg intentionally empty so as to capture all commits up to HEAD
        sh tools/generate_changelog.sh "" >> ${PACKAGE_PATH}/CHANGELOG.md
        echo "" >> ${PACKAGE_PATH}/CHANGELOG.md
        echo "" >> ${PACKAGE_PATH}/CHANGELOG.md

		# Bump build number
		export NEW_VERSION=$INPUT_STRING
		perl -i -pe 's/^(version:\s[0-9]+.[0-9]+.[0-9]+.*)$/"version: '$INITIAL_VERSION'"/e' ${PACKAGE_PATH}/pubspec.yaml

        echo "$ADJUSTMENTS_MSG"
        read
        echo "$PUSHING_MSG"
        git add ${PACKAGE_PATH}/CHANGELOG.md ${PACKAGE_PATH}/VERSION ${PACKAGE_PATH}/pubspec.yaml &&
        git commit -m "chore(${1}): v0.1.0" -m "- Update \`CHANGELOG.md\` and \`pubspec.yaml\` " && 
		git tag -a -m "${1}-v0.1.0" "${1}-v0.1.0" 
    fi
fi

echo "${NOTICE_FLAG} Finished."

