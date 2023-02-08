output "printnameage" {
    value = "Hello, ${var.username}, your age is ${var.age}"
  
}
#To execute another tfvar file
#then command is terraform plan -var-file=filename
#terraform plan -var-file=development.tfvar