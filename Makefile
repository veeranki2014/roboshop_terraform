dev:
	@rm -rf .terraform
	@terraform init -backend-config=env_dev/state.tfvars
	@terraform apply -auto-approve -var-file=env_dev/main.tfvars

prod:
	@rm -rf .terraform
	@terraform init -backend-config=env_prod/state.tfvars
	@terraform apply -auto-approve -var-file=env_prod/main.tfvars
