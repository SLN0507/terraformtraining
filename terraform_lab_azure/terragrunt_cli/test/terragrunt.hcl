terraform {
  extra_arguments "common_vars" {
    commands = ["plan", "apply"]

    arguments = [
      "-var-file=../account.tfvars",
      "-var-file=../region.tfvars"
    ]
  }
}
