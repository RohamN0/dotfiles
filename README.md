# 🌌 Roham’s Dotfiles

![Made with Neovim](https://img.shields.io/badge/Made%20with-Neovim-57A143?logo=neovim&style=flat-square)
![Shell](https://img.shields.io/badge/Shell-Zsh-4EAA25?logo=gnu-bash&style=flat-square)
![Wayland](https://img.shields.io/badge/Wayland-Sway-blue?style=flat-square)

> My personal configuration files for Linux, designed for **productivity**, **aesthetic minimalism**, and **portability**.  
> Works best on **Void Linux (Sway + Waybar)** with **WezTerm, Neovim, and Zsh**.

---

## ✨ Features

- **Void Linux** optimized configs  
- **Zsh** – modern shell with plugins, aliases, and a sleek prompt  
- **Neovim** – fully customized IDE-like setup with plugins & keybindings  
- **WezTerm** – fast terminal with custom fonts & colors  
- **Sway + Waybar** – tiling Wayland WM with a clean, dark status bar  
- **GRUB** – custom bootloader configuration  
- **Python/Octave environments** – pre-configured dev environments  
- **MetaTrader 5 (MT5)** – run in Docker with Wine  
- **Cross-machine portability** – one clone + symlink = same workflow everywhere  

---

## 🔧 System Details (Void Linux)

- **Power saving**: [TLP](https://linrunner.de/tlp/) enabled for battery life  
- **Session management**: `seatd` (user must be in `_seatd` group)  
- **Audio**: ALSA with `alsa-utils` service enabled  
- **Init system**: runit (Void default)  

---

## 🛠️ MetaTrader 5 (MT5) via Docker + Wine

Located in [`mt5/`](./mt5).  

This setup runs the **Windows MetaTrader 5 terminal** inside a Linux container using **Wine**.  

1. **Build the image**  
   ```bash
   cd mt5
   docker build -t mt5 .
   ```

2. **Run the container**  
   ```bash
   docker run -d -p 1234:1234 -p 8080:8080 --name mt5-container mt5
   ```

3. **MT5 will start automatically** inside Wine using Supervisor.  
   You can attach to the container to view logs or interact.  

This allows trading on MT5 seamlessly inside Void Linux without dual-booting or using a VM.

---

## 📜 License

MIT License – feel free to fork, adapt, and use.  

---
