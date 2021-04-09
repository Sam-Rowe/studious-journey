# Find the Dockerfile for mcr.microsoft.com/azure-functions/dotnet:3.0-dotnet3-core-tools at this URL
# https://github.com/Azure/azure-functions-docker/blob/master/host/3.0/buster/amd64/dotnet/dotnet-core-tools.Dockerfile
FROM mcr.microsoft.com/azure-functions/dotnet:3.0-dotnet3-core-tools

COPY library-scripts/azcli-debian.sh /tmp/library-scripts/
RUN bash /tmp/library-scripts/azcli-debian.sh \
    && curl -Lo /usr/local/bin/bicep https://github.com/Azure/bicep/releases/latest/download/bicep-linux-x64 \
    && chmod +x /usr/local/bin/bicep \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

ARG INSTALL_ZSH=true
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update && curl -ssL https://raw.githubusercontent.com/microsoft/vscode-dev-containers/master/script-library/common-debian.sh -o /tmp/common-script.sh \
    && /bin/bash /tmp/common-script.sh "$INSTALL_ZSH" "$USERNAME" "$USER_UID" "$USER_GID" \
    && rm /tmp/common-script.sh 

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>