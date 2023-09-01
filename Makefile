dev:
	@rm -rf .terraform
	@terraform init -backend-config=env_dev/state.tfvars
	@terraform apply -auto-approve -var-file=env_dev/main.tfvars

dev-destroy:
	@rm -rf .terraform
	@terraform init -backend-config=env_dev/state.tfvars
	@terraform destroy -auto-approve -var-file=env_dev/main.tfvars

prod:
	@rm -rf .terraform
	@terraform init -backend-config=env_prod/state.tfvars
	@terraform apply -auto-approve -var-file=env_prod/main.tfvars

prod-destroy:
	@rm -rf .terraform
	@terraform init -backend-config=env_prod/state.tfvars
	@terraform destroy -auto-approve -var-file=env_prod/main.tfvars
