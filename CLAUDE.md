# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A personal dotfiles/config/scripts collection ("cli_tools") for setting up and administering macOS (and some Linux/FreeBSD) machines. There is no application to build — this is shell scripts and config files that get copied onto a machine's home directory. There is no package manager, build step, or test framework; "testing" is limited to a GitHub Actions smoke check.

## Repository structure

- `configs/` — dotfiles and tool configs, grouped by purpose, meant to be copied into `$HOME`:
  - `shells/` — `bashprofile`, `bashrc`, `zshrc` (bash/zsh startup files; `.bash_profile` sources `.bashrc`, which includes Tiny Care Terminal bits)
  - `tools/` — `vimrc` (uses Vundle plugins), `hammerspoon` (macOS window-management Lua config), `tmux`, `wtfconfig.yml`, `Brewfile` (Homebrew bundle)
  - `versioncontrol/` — `gitconfig` plus per-context includes (`gitconfig-mids`, `gitconfig-thd`, `gitconfig-fa`) for switching identity/settings by employer/personal context
  - `vscode/` — VS Code workspace files and `settings.json`
- `scripts/` — executable scripts, grouped by admin domain:
  - `sysadmin/cli-setup` — the main installer (see below)
  - `sysadmin/crontabs.sh` — dumps every local user's crontab (needs sudo)
  - `devops/tools/` — `git_check.sh` and `masspull.sh`, both operate on a directory of git repo checkouts (loop over `./*/` subdirectories doing `git fetch`/`git pull`)
  - `devops/builds/actions_test.sh` and `devops/tests/actions_test.sh` — trivial scripts invoked by CI (currently identical stub scripts)
  - `macadmin/shell/mac_user_create.sh` — creates a macOS standard service user via `dscl`
  - `macadmin/osa/quitting.scpt` — AppleScript that announces running apps via `say`
  - `netadmin/pingtimestamp.sh` — wraps `ping` output with timestamps
- `images/` — misc image assets referenced elsewhere (e.g. terminal/theme screenshots)
- `.github/workflows/actions_test.yml` — CI workflow

## Key conventions / gotchas

- **`cli-setup` uses relative paths and must be run from `scripts/sysadmin/`.** It copies configs via paths like `../../configs/shells/bashprofile`, so invoke it as `cd scripts/sysadmin && ./cli-setup -c` (or `-t` / `-h`), not from the repo root.
  - `-t` (triage): installs shells + tmux only
  - `-c` (cli): installs shells, tmux, vim (+ Vundle), and git config
  - `-h` (home): not currently fully implemented — only runs `shells` (per the script's own comments, `-c` and `-h` are meant to differ by adding oh-my-zsh, but that isn't implemented either)
  - Git config setup checks for `$HOME/src/thd/` to decide whether to install the THD (employer) gitconfig include in addition to the personal one.
  - It copies each config file straight over any existing destination in `$HOME` (plain `cp -rv`, no backup) — be aware re-running it will silently overwrite a user's current dotfiles.
- **Multiple gitconfig includes exist for separating identities** (personal `mids`, employer `thd`, `fa`) — when editing git config, keep values in the correct context-specific file rather than the shared top-level `gitconfig`.
- **`git_check.sh` and `masspull.sh` assume they are run from a parent directory containing multiple git repo checkouts as immediate subdirectories** — they `cd` into each `./*/` and run git commands, then `cd ..`.
- Scripts target macOS primarily, with some tested on Debian/Ubuntu/FreeBSD (per README) — don't assume GNU-only shell/utility behavior; several scripts intentionally use `#!/bin/sh` and POSIX-compatible syntax.
- CI (`.github/workflows/actions_test.yml`) runs a single `build` job on `macos-latest` for `pull_request`/`workflow_dispatch`, and just executes `scripts/devops/tests/actions_test.sh` as a smoke test. It doesn't lint shell scripts or validate config installation.

## Common tasks

- Run the CI smoke script locally: `bash scripts/devops/tests/actions_test.sh`
- Install triage config on a new machine: `cd scripts/sysadmin && ./cli-setup -t`
- Install full CLI config on a new machine: `cd scripts/sysadmin && ./cli-setup -c`
- Sync all repo checkouts in the current directory's subfolders: `bash scripts/devops/tools/git_check.sh` (or `masspull.sh` for a simpler pull-only version)
