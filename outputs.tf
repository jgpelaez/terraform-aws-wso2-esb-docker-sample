output "ebs_address" {
  value = "${aws_elb.web.dns_name}"
}

output "ec_address" {
  value = "${aws_instance.web.dns_name}"
}
