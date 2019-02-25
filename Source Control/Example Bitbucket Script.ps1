# prep a folder
cd C:/Projects/Repos
mkdir Sandbox
# clone the repo (need to be signed in with Bitbucket in your browser)
git clone https://SimonStride@bitbucket.org/etlbi/sandbox.git
cd sandbox
ii .

# ***make changes***

# review changes
git status

# use stage “.” to prep all changes
git stage .

# get the latest from everyone else
git pull

# commit to Source Control with a sensible message
git commit –m "my example commit message"

# sync your changes to the rest of the world
# change this bit to commit to a different branch
git push origin master
