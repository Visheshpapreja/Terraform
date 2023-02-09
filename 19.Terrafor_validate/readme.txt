Terraform Validate

Once you’ve initialized the directory, it’s good to run the validate command before you run the plan or apply. Validation will catch syntax errors, version errors, and other issues. One thing to note here is that you can’t run validate before you run the init command. You have to initialize the working directory before you can run the validation.



Validate works at the level of checking your code for soundness, including loading modules and ensuring that variables are correctly named.

If you only want the basic syntax of a local file, consider using terraform fmt -write=false. If the formatter is unable to parse the file, it will throw an error.



This command does not check formatting (e.g. tabs vs spaces, newlines, comments etc.).

The following can be reported:

invalid HCL syntax (e.g. missing trailing quote or equal sign)
invalid HCL references (e.g. variable name or attribute which doesn't exist)
same provider declared multiple times
same module declared multiple times
same resource declared multiple times
invalid module name
interpolation used in places where it's unsupported (e.g. variable, depends_on, module.source, provider)
missing value for a variable (none of -var foo=... flag, -var-file=foo.vars flag, TF_VAR_foo environment variable, terraform.tfvars, or default value in the configuration)

terraform validate