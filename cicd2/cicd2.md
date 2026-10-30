# gate test 
cd devops-bootcamp-shipit && code . 

cd launchpad && npm run test

echo $?

##remove color hash
npm run test

echo $?



# branch protection
Settings → Branches → Add branch protection rule

Branch name pattern: main

[x] Require status checks to pass before merging → test

[x] Do not allow bypassing the above settings

Create
