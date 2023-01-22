.PHONY: tf-init
tf-init:
	cd infra/envs/prod && \
	terraform init

.PHONY: tf-apply
tf-apply:
	cd infra/envs/prod && \
	terraform apply

.PHONY: tf-fmt
tf-fmt:
	terraform fmt -recursive