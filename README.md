# basic nixos-config

Flake-based NixOS configuration for my personal machine.

## System

| Component | Spec |
|-----------|------|
| CPU | AMD Ryzen 5 5500 |
| GPU | NVIDIA GTX 1060 6GB (Pascal) |
| RAM | 24GB DDR4 |

## Stack

- **NixOS** (unstable channel) with flakes and home-manager
- **Hyprland** compositor via UWSM (Universal Wayland Session Manager)
- **SDDM** display manager with Wayland backend
- **Caelestia Shell** v2.1.0 for the desktop environment
- **PipeWire** with PulseAudio compatibility
- **Fish** shell

## Structure

| File | Purpose |
|------|---------|
| `flake.nix` | Flake inputs and system output definition |
| `configuration.nix` | System-level config — hardware, drivers, services, packages |
| `home.nix` | User-level config via home-manager — shell, desktop environment |
| `hardware-configuration.nix` | Auto-generated hardware scan (not committed) |

## Notable configuration decisions

**NVIDIA:** GTX 1060 (Pascal) uses the `legacy_580` driver package 
with `open = false` — the open kernel modules don't support Pascal. 
`NVreg_PreserveVideoMemoryAllocations=1` is set as a kernel parameter 
for stability. 32-bit graphics support enabled for Steam/Proton 
compatibility.

**Wayland:** Hyprland runs via UWSM rather than directly, which 
handles the session lifecycle more cleanly with systemd.

**nix-ld:** Enabled to allow dynamically linked binaries built 
for standard Linux distros to run without patching.

**Flake inputs:** nixpkgs (unstable), home-manager, and 
caelestia-shell pinned to v2.1.0 — all following nixpkgs to 
avoid version conflicts.

## Background

Previously ran Arch Linux, BlackArch, and Kali Linux before 
settling on NixOS for its declarative configuration model and 
reproducibility. The entire system state is defined in these 
files — a fresh install from this flake produces an identical 
environment.
