steps:
1- mkdir project05
2- mkdir aws
3- cd aws
4- mkdir aws_keys
5- cd aws_keys
6- touch mumbai-windows-keypair.pem
7- nano mumbai-windows-keypair.pem
8- copy paste your key 
9- cd ..
10- cd ..
11- touch main.tf
12- nano main.tf
13- configure vpcid,subnetid,amiid,region
14- touch variables.tf
15- nano variables.tf
16- copy paste the code & change keypair name
17- chmod 400 aws/aws_keys/mumbai-windows-keypair.pem
18- terraform init
19- terraform plan
20- terraform apply
21- copy public ip and check in browser
22- terraform destroy


