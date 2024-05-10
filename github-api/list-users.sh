#!/bin/bash

#################
#about: Executing this code will list the name of the users
# Name: Vishnu Sharma
# email: vishnusharma11d00@gmail.com
#################


helper()

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and personal access token
# Instead of hard-coding the username and token, we export them and take it from the cli
#USERNAME is same as Git-hub and generate a token from github
USERNAME=$username  
TOKEN=$token

# User and Repository information
#example: Demo-org-linux = $1 and demo-repository = $2 
REPO_OWNER=$1
REPO_NAME=$2

#####################################
# the command to get-api as given in documents is:
#curl -L \
#  -H "Accept: application/vnd.github+json" \
#  -H "Authorization: Bearer <YOUR-TOKEN>" \
#  -H "X-GitHub-Api-Version: 2022-11-28" \
#  https://api.github.com/repos/OWNER/REPO/issues
######################################


# Function to make a GET request to the GitHub API. 
### This function just makes up till the url part in the above command
function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"

    # Send a GET request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}



# Function to list users with read access to the repository
### This function uses the above function to form the complete command including- repos/OWNER/REPO/issues
function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"
    #the jq helps to filter the json file and just see the collaborators name
    
    # Display the list of collaborators with read access
    if [[ -z "$collaborators" ]]; then
        echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}


##this is in case $1 and $2 are not given in cli arguments
function helper{
expected_cmd_args=2
if [ $# -ne $expected_cmd_args ];then 
  echo "please execute the script with required cmd args"
  echo "asd"
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
