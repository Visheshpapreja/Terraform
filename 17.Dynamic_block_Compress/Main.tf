# output "keyname" {
#   value = "${aws_key_pair.key-tf.key_name}"

#}

output "securitygroupsDetails" {
  value = aws_security_group.allow_tls.id

}