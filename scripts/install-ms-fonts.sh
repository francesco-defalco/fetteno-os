#!/usr/bin/env bash

# Fail the GitHub Actions build immediately if any command fails
set -oue pipefail

echo "=== Installing Microsoft Core Fonts ==="

# 1. Identify the current Fedora base version used by Bluefin
FEDORA_VERSION=$(rpm -E %fedora)

# 2. Inject the Copr repository directly into the root system configuration
curl -sLo /etc/yum.repos.d/dawid-mscorefonts.repo "https://copr.fedorainfracloud.org/coprs/dawid/mscorefonts/repo/fedora-${FEDORA_VERSION}/dawid-mscorefonts-fedora-${FEDORA_VERSION}.repo"

# 3. Install the package via rpm-ostree
rpm-ostree install mscore-fonts

echo "=== Microsoft Fonts installed successfully! ==="
