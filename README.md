<div align="center">

<img src="./resources/banner.png" alt="Atomic Blueberry"/>

[![Build images](https://github.com/Krosseye/atomic-blueberry/actions/workflows/build.yml/badge.svg)](https://github.com/Krosseye/atomic-blueberry/actions/workflows/build.yml)

</div>

## About

> [!WARNING]
> Atomic Blueberry is experimental and anything may change. It is not intended for everyday use.

Atomic Blueberry is my personal [Fedora Kinoite](https://fedoraproject.org/atomic-desktops/kinoite/) (KDE) image, built on [Universal Blue](https://universal-blue.org/) with [BlueBuild](https://blue-build.org/). It's stock Fedora with the drivers and apps I use for gaming and development preinstalled, so a fresh install doesn't need setting up by hand. Others are welcome to use it.

## What's included

The highlights are below. The full package list lives in [recipes/shared/](recipes/shared/).

- **Gaming:** Steam, Heroic Games Launcher, MangoHud and gamescope, plus Xbox controller drivers ([xone](https://github.com/dlundqvist/xone) for the USB/wireless dongle, [xpadneo](https://github.com/atar-axis/xpadneo) for Bluetooth)
- **Content creation:** OBS Studio with Vulkan game capture and a working virtual camera, Kdenlive
- **Development:** [VSCodium](https://vscodium.com/) (installed as an RPM, so its terminal and dev containers work with the host), Distrobox via BoxBuddy, GNOME Boxes for virtual machines
- **Desktop:** Valve's Vapor theme from the Steam Deck
- **Nvidia image:** Nvidia's open driver built in (GTX 16 / RTX 20 series and newer)

Apps are installed as Flatpaks from [Flathub](https://flathub.org/) on first boot. This includes Firefox, which replaces the Fedora RPM version.

## Installation Options

> [!IMPORTANT]  
> AMD and Intel users should use `ghcr.io/krosseye/atomic-blueberry`, and Nvidia users should use `ghcr.io/krosseye/atomic-blueberry-nvidia`.
> The Nvidia image uses Nvidia's open kernel driver, which needs a GTX 16 series, RTX 20 series or newer card. Older cards (GTX 10 series and earlier) are not supported.

### Rebase

To rebase an existing atomic Fedora installation to the latest build of Atomic Blueberry:

1. Install the unsigned image to update keys and policies:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/krosseye/atomic-blueberry:latest
systemctl reboot
```

2. Complete the rebase with the signed image:

```bash
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/krosseye/atomic-blueberry:latest
systemctl reboot
```

For NVIDIA, use `atomic-blueberry-nvidia` in both commands.

### ISO

> [!IMPORTANT]  
> **Pre-built ISOs are currently not available, this is planned for the future.**

If built on Fedora Atomic, you can generate an offline ISO with the [BlueBuild CLI](https://blue-build.org/how-to/generate-iso/):

```bash
sudo bluebuild generate-iso --iso-name atomic-blueberry.iso image ghcr.io/krosseye/atomic-blueberry
```

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/krosseye/atomic-blueberry
```
