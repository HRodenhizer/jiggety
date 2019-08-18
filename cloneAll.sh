#!/bin/sh
set -x

# TODO: segregate q2 repos into separate subdir
printf "What is your GH username?"
read UNAME
ORG="qiime2"
export $ORG
INSTALL_DIR="$HOME/src"

cd $INSTALL_DIR
USER_JSON=$(curl -s "https://${GHTKN}:@api.github.com/users/${UNAME}/repos?per_page=200")
SSH_URLS=$(echo $USER_JSON | jq .[].ssh_url)
echo $SSH_URLS | xargs -n 1 git clone
cd ${INSTALL_DIR}/jiggety

ORG_JSON=$(curl -s "https://${GHTKN}:@api.github.com/orgs/${ORG}/repos?per_page=200")
ORG_REPO_NAMES=$(echo $ORG_JSON | jq .[].name)

cd $INSTALL_DIR
# NOTE: This currently adds upstream remotes ONLY for $ORG repos (qiime2 in this case).
# TODO: Refactor to add upstream remotes for all user repos (where upstream repos exist)
# Consider API calls to individual repos 
# (e.g. https://stackoverflow.com/questions/18580913/github-api-for-a-forked-repository-object-how-to-get-what-repository-its-fork)
add_upstream_remote () {
	if [ -d "$1" ]; then 
		cd $1
		git remote add qiime2 "https://github.com/${ORG}/$1"
		git remote -v
		cd ${INSTALL_DIR}
	fi
}

export ORG
export -f add_upstream_remote
echo $ORG_REPO_NAMES | xargs -n 1 bash -c 'add_upstream_remote "$@"' _

cd ${INSTALL_DIR}/jiggety 


# The following function and invocation are unused here, but are a good backup in case of emergency
del_upstream_remote () {
	if [ -d "$1" ]; then 
		cd $1
		git remote remove qiime2
		git remote -v
		cd ${INSTALL_DIR}
	fi
}

# echo $ORG_REPO_NAMES | xargs -n 1 bash -c 'del_upstream_remote "$@"' _

