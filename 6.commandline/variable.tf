output printname {
    value = "Hello, ${var.username}"
}

#we can execute like
#terraform plan -var "variable-name=variable-value"
#terraform plan -var "username=visheshpapreja"