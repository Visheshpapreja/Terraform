# output printjoin {
#     value = "${join(",",var.users)}"}
#  }

output printjoin {
    value = "${join("---->",var.users)}"
  
}

output printupper {
        value = "${upper(var.users[0])}"
}

output printlower {
        value = "${lower(var.users[1])}"
}

output printtitle {
        value = "${title(var.users[2])}"
}
