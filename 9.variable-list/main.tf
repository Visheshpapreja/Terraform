output printname1 {
    value = "first user is ${var.username[0]}"
  
}

#terraform plan -var 'username=["value","value1","value2","value3"]'
#terraform plan -var 'username=["vishesh","ramesh","suresh","prakash"]