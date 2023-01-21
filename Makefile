.PHONY: tf-init
tf-init:
	cd infra/prod && \
	terraform init

.PHONY: tf-apply
tf-apply:
	cd infra/prod && \
	terraform apply

.PHONY: tf-fmt
tf-fmt:
	terraform fmt -recursive