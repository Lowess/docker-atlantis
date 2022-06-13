# Grab image to collect tools from
FROM lowess/terragrunt:0.12.31 as tools0.12
FROM lowess/terragrunt:0.13.7 as tools0.13
FROM lowess/terragrunt:0.14.11 as tools0.14
FROM lowess/terragrunt:1.0.11 as tools1.0

# Official atlantis image
FROM ghcr.io/runatlantis/atlantis:v0.19.4

ENV DEFAULT_TERRAGRUNT_VERSION=0.23.10

# Install python3
RUN apk --no-cache add bash py-pip g++ python3 python3-dev build-base libffi-dev openssl-dev gnupg

COPY --from=tools0.12 --chown=atlantis /usr/local/bin/terragrunt /usr/local/bin/terragrunt0.23.10
COPY --from=tools0.13 --chown=atlantis /usr/local/bin/terragrunt /usr/local/bin/terragrunt0.26.7
COPY --from=tools0.14 --chown=atlantis /usr/local/bin/terragrunt /usr/local/bin/terragrunt0.28.24
COPY --from=tools1.0 --chown=atlantis /usr/local/bin/terragrunt /usr/local/bin/terragrunt0.35.10

RUN ln -s /usr/local/bin/terragrunt${DEFAULT_TERRAGRUNT_VERSION} /usr/local/bin/terragrunt

COPY --from=tools1.0 --chown=atlantis /opt/.terraform.d /opt/.terraform.d
COPY --from=tools1.0 --chown=atlantis /root/.terraformrc /home/atlantis/.terraformrc
COPY --from=tools1.0 --chown=atlantis /root/.terraformrc /root/.terraformrc
