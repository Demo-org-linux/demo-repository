# Shell Scripting Project - GitHub API Integration

visit this link for detailed information with images https://drive.google.com/drive/folders/1Vm-4ZNs59tZdIQXUB7hb3hykvdqwzJ_7?usp=drive_link
## Prerequisites
- GitHub account
- AWS account
- AWS CLI installed

## Project Overview
This project involves integrating with the GitHub API using a shell script to list users in a specific GitHub organization/repository. The script retrieves user information using GitHub's REST API and filters the output to display only the relevant user data.

## Steps to Reproduce

### Create GitHub Organization and Repository
1. Create a new organization group named "Demo-org-linux" on GitHub.
2. Create a repository named "demo-repository" within the organization.

### Write Shell Script
1. Create a new file named `list-users.sh` in the repository.
2. Write shell script code to interact with the GitHub API, specifically the GET API command to retrieve user information.
3. Utilize GitHub's REST API documentation for the GET API command.

### Launch AWS EC2 Instance
1. Go to the AWS console and launch an EC2 instance.
2. Choose the free tier Amazon Linux AMI with a KMS key.

### SSH Connection to EC2 Instance
1. Open the terminal in VSCode or your local computer.
2. Establish an SSH connection to the EC2 instance.

### Install Dependencies
1. Install `git` on the EC2 instance using `sudo yum install git -y`.
2. If not already installed, install `jq` using `sudo yum install jq -y`.

### Clone Repository
1. Clone the GitHub repository onto the EC2 instance using the HTTPS URL obtained from the GitHub repository's "Code" section.
   - Make sure your Organization’s visibility is public.

### Set GitHub Credentials
1. After cloning, direct to the `list-users.sh` file.
2. Set GitHub username and personal access token as environment variables:
   - `export username="github username"`
   - `export token=""`
3. Generate a personal access token in GitHub under "Settings" > "Developer settings" > "Personal access tokens". Choose appropriate permissions. **Do not share this token with anyone.**

### Execute Script
1. Run the script `list-users.sh` with the organization name and repository name as command-line arguments:
#### `/list-users.sh Demo-org-linux demo-repository'`

3. If necessary, grant execute permissions to the script using `chmod 777 list-users.sh`.

### View Output
- The script will list the users in the specified GitHub organization/repository.
- The output will display the usernames of the users. It is showing two users because an additional member was added to the Organization.

### Termination
- Terminate the EC2 instance from the AWS console after completing the project to avoid unnecessary charges.

## Usage
Replace the command: 
##### `/list-users.sh Demo-org-linux demo-repository'`

with the desired organization name followed by the repository name to list users from a different GitHub project or organization.

