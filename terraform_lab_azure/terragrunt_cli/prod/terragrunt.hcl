terraform {
  extra_arguments "common_vars" {
    commands = ["plan", "apply"]

    arguments = [
      "-var-file=../account_prod.tfvars",
      "-var-file=../region_west.tfvars"
    ]
  }
}
