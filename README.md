# Docker-Terragrunt - Container to run Terragrunt commands

## Usage

```
#--runit--
docker run -it --rm \
    -v ~/.aws:/root/.aws \
    -v ~/.ssh:/root/.ssh \
    lowess/atlantis
```
