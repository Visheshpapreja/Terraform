output printname {
    value = "Hello, ${var.username}, your age is ${var.age}"  
  
}

#we can execute like
#terraform plan -var "variable-name=variable-value" -var "variable-2-age=variable-2-value"
#terraform plan -var "username=visheshpapreja" -var "age-28"