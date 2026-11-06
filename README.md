<div align="center">

<img src="./resources/banner.png" alt="Atomic Blueberry"/>

[![Build for AMD/Intel](https://github.com/Krosseye/atomic-blueberry/actions/workflows/build-amd-intel.yml/badge.svg)](https://github.com/Krosseye/atomic-blueberry/actions/workflows/build-amd-intel.yml)
&nbsp;
[![Build for NVIDIA](https://github.com/Krosseye/atomic-blueberry/actions/workflows/build-nvidia.yml/badge.svg)](https://github.com/Krosseye/atomic-blueberry/actions/workflows/build-nvidia.yml)

</div>  

## Introduction

> [!WARNING]  
>Atomic Blueberry is in an experimental phase, **everything** is subject to change. **It is not intended for everday use.**

**Atomic Blueberry** is an experimental [OCI](https://en.wikipedia.org/wiki/Open_Container_Initiative) image designed for high-performance computing environments, including gaming PCs and professional workstations. It leverages the capabilities of [Universal Blue](https://universal-blue.org/) and [Fedora Atomic](https://fedoraproject.org/atomic-desktops/) technologies with the [BlueBuild](https://blue-build.org/) framework to provide a cutting-edge, [containerized operating system](https://fedoraproject.org/wiki/Changes/OstreeNativeContainerStable) experience.

## Key Features

- **Regular Updates**
- **Optimized Performance**
- **Extensive Software Support**

## Included Drivers and Utilities

- **[v4l2loopback](https://github.com/umlaeute/v4l2loopback):** For creating virtual video devices.

- **[xpadneo](https://github.com/atar-axis/xpadneo) & [xone](https://github.com/BoukeHaarsma23/xonedo/):** Advanced Xbox One controller support via Bluetooth and USB.

- **[steam-devices](https://github.com/ValveSoftware/steam-devices):** Udev rules for Steam hardware peripherals.

## Pre-installed Applications

### Productivity

- **[OBS Studio](https://flathub.org/apps/com.obsproject.Studio):** Powerful tool for video capture, recording, and streaming.
- **[ONLYOFFICE](https://flathub.org/apps/org.onlyoffice.desktopeditors):** Comprehensive suite for document creation and editing.
- **[Kdenlive](https://flathub.org/apps/org.kde.kdenlive):** Video editing application with advanced editing features.
- **[Bottles](https://flathub.org/apps/com.usebottles.bottles):** Run Windows software on Linux.

### Development

- **[VSCodium](https://flathub.org/apps/com.vscodium.codium):** Versatile code editor for multiple programming languages.
- **[Distrobox](https://distrobox.it/) & [BoxBuddy](https://flathub.org/apps/io.github.dvlv.boxbuddyrs):** Enables running any Linux distribution within your terminal and provides a GUI for management.
- **[Boxes](https://flathub.org/apps/org.gnome.Boxes):** Simplifies virtual machine setup and management.

### Gaming

- **[Steam](https://flathub.org/apps/com.valvesoftware.Steam) & [Heroic Games Launcher](https://flathub.org/apps/com.heroicgameslauncher.hgl):** Access to thousands of games with compatibility layer support for Windows titles.
- **[ProtonUp-Qt](https://flathub.org/apps/net.davidotek.pupgui2) & [Protontricks](https://flathub.org/apps/com.github.Matoking.protontricks):** Additional tools for enhancing the gaming experience across various platforms.

## Installation Options

> [!IMPORTANT]  
> AMD and Intel users should use `ghcr.io/krosseye/atomic-blueberry`, and Nvidia users should use `ghcr.io/krosseye/atomic-blueberry-nvidia`

### Rebase

> [!WARNING]  
> **[This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.**

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

### ISO

> [!IMPORTANT]  
> **Pre-built ISOs are currently not available, this is planned for the future.**

If built on Fedora Atomic, you can generate an offline ISO with the instructions available [here](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso).

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/krosseye/atomic-blueberry
```
