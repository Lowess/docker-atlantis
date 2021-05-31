# Grab image to collect tools from
FROM lowess/terragrunt:0.12.31 as tools

# Official atlantis image
FROM runatlantis/atlantis:v0.15.1

# Install python3
RUN apk --no-cache add bash py-pip g++ python3 python3-dev build-base libffi-dev openssl-dev gnupg

COPY --from=tools --chown=atlantis /usr/local/bin /usr/local/bin
COPY --from=tools --chown=atlantis /opt/.terraform.d /opt/.terraform.d
COPY --from=tools --chown=atlantis /root/.terraformrc /home/atlantis/.terraformrc
COPY --from=tools --chown=atlantis /root/.terraformrc /root/.terraformrc
