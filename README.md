steps:
mkdir project05
mkdir aws
cd aws
mkdir aws_keys
cd aws_keys
touch mumbai-windows-keypair.pem
nano mumbai-windows-keypair.pem
copy paste your key 
cd ..
cd ..
touch main.tf
nano main.tf
configure vpcid,subnetid,amiid,region
touch variables.tf
nano variables.tf
copy paste the code & change keypair name
chmod 400 aws/aws_keys/mumbai-windows-keypair.pem
terraform init
terraform plan
terraform apply
copy public ip and check in browser
terraform destroy
upload your code to github repo
git init
git add .
git commit -m "initial code"
git remote add origin https://______________________
git push https://token@github.com/<accountname>/<githubname>.git

