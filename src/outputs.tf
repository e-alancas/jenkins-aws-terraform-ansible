output "Jenkins-Main-Node-Public-IP" {
  value = aws_instance.jenkins-master.public_ip
}

output "LB-DNS-NAME" {
  value = aws_lb.application-lb.dns_name
}

output "amiId-us-east-1" {
  value     = data.aws_ssm_parameter.linuxAmi.value
  sensitive = true
}

output "amiId-us-west-2" {
  value     = data.aws_ssm_parameter.linuxAmiOregon.value
  sensitive = true
}

output "Jenkins-Main-Node-Private-IP" {
  value = aws_instance.jenkins-master.private_ip
}
output "Jenkins-Worker-Public-IPs" {
  value = {
    for instance in aws_instance.jenkins-worker-oregon :
    instance.id => instance.public_ip
  }
}
output "url" {
  value = aws_route53_record.jenkins.fqdn
}