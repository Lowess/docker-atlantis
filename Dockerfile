# Grab image to collect tools from
FROM lowess/terragrunt:0.12.24 as tools

# Official atlantis image
FROM runatlantis/atlantis:v0.13.0

COPY --from=tools /usr/local/bin /usr/local/bin
COPY --from=tools /opt/.terraform.d /opt/.terraform.d
COPY --from=tools /root/.terraformrc /home/atlantis/.terraformrc
COPY --from=tools /root/.terraformrc /root/.terraformrc
