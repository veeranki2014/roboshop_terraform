dev:
	@rm -rf .terraform
	@terraform init
	@terraform apply -auto-approve -var-file=env_dev/main.tfvars

prod:
	@rm -rf .terraform
	@terraform init
	@terraform apply -auto-approve -var-file=env_prod/main.tfvars
