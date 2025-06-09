# Gohan - It's just dotfiles.

## Setup
Configurations files can be symlinked in place by using GNU `stow`.
There are a few (currently one) exceptions: - the `crontab` file for which
it seems better to `crontab [-u user] cron/crontab`.

## Untracked files
Put your bookmarks/snippets in `scripts/snippets.txt`
and your newsboat feeds in `newsboat/.newsboat/urls`.
