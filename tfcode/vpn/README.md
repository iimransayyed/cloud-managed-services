#Author: Imran Sayyed

This terraform code will create the aws site to site vpn using virtual private gateway and the customized tunnel properties and creates the below resources:
    1.aws_customer_gateway
    2.aws_vpn_connection
    3.aws_vpn_gateway
    4.vpn_tunnel1_cwlog
    5.vpn_tunnel2_cwlog

To use this code follow the below process/commands.

1. Download the code
2. Go into vpn directory.
3. Change the values of the tags,vpc,rtb & tunnel properties into varriables.tf & s-s-vpn.tfvars file.
4. Run "terraform init" into vpn folder.
5. Run TF Plan terraform plan -var-file=s-s-vpn.tfvars
6. check the plan output and if you find it good then execute "terraform apply -var-file=s-s-vpn.tfvars"
7. To destroy the resources Run "terraform destroy -var-file=s-s-vpn.tfvars"
