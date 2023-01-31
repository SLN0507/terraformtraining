provider aws {
  region = "us-west-2"
}


output "out" {
  value     = "xyz"
  sensitive = false
}

# mod/main.tf, our module containing a sensitive output

output "a" {
  value     = "secret"
  sensitive = true
}

