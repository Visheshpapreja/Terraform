output printname {
    value = "Hello, ${var.username}"

  }

  output printage {
    value = "your age is, ${var.age}"
    
  }

  output printboth {
    value = "your name is ${var.username} and your age is ${var.age}"
    
  }
  #whenever you create variable you just have to mention
  #string
  #number
  #that will save you from silly error mistakes