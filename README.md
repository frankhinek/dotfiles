# dotfiles
> Personal collection of dotfiles for Mac OS X

Your dotfiles are how you personalize your system. These are mine.

## Approach

Initially I planned to include the installation of Homebrew, zsh, Atom, and
other applications along with configuration related dotfiles.  I took a queue
from Caarlos0's [machine](https://github.com/caarlos0/machine) project and
decided to copy the pattern of keeping [software installation](https://github.com/frankhinek/mac-setup) and
[configuration](https://github.com/frankhinek/dotfiles) in separate repositories.

## Compatibility

These scripts and dotfiles have only been tested on macOS X El Capitan.

## Components

Individual components are organized by topic area. If you add a new topic to your dotfiles, for example "Go", you can simply add a `go` directory and store the associated files there.

The project is organized as follows:

* **bin/**: Anything in bin/ will get added to your $PATH and be made available everywhere.
* **topics/*`topic_name`*/*.zsh**: Any files ending in .zsh get loaded into your environment.
* **topics/*`topic_name`*/install.sh**: Any file named install.zsh is executed and is expected to run configuration shell commands or add extensions/modules.
* **topics/*`topic_name`*/aliases.zsh**: Any file named aliases.zsh adds shell aliases.
* **topics/*`topic_name`*/path.zsh**: Any file named path.zsh is loaded first and is expected to setup $PATH or similar.
* **topics/*`topic_name`*/completion.zsh**: Any file named completion.zsh is loaded last and is expected to setup autocomplete.
* **topics/*`topic_name`*/*.symlink**: Any files ending in .symlink get symlinked to your $HOME directory. This enables versioning and updating of dotfiles without systems that look for the .dotfiles being aware.  The symlink operation occurs when scripts/bootstrap.sh is executed.

## Roadmap

- [x] Create bootstrap script
- [x] Configure zsh
- [x] Configure antibody
- [x] Configure git
- [x] Configure iTerm2
- [ ] Configure atom

## Thanks

Rather than forking an existing dotfile repository I started from a blank canvas
and added only what I needed.  However, nearly every bit of this was copied
directly from or heavily based on work by the individuals listed below.
Thanks to all that shared their work!

* [caarlos0/dotfiles](https://github.com/caarlos0/dotfiles)
* [holman/dotfiles](https://github.com/holman/dotfiles)

## Additional References

There are sure to be thousands of different collections of dotfiles but here are
a few I came across.  I did not reuse any code from these, but they may be
valuable as a source of ideas for others.

* [davidkna/dotfiles](https://github.com/davidkna/dotfiles)
* [marceldiass/dotfiles](https://github.com/marceldiass/dotfiles)
* [wkentaro/dotfiles](https://github.com/wkentaro/dotfiles)
* [pragmaticivan/dotfiles](https://github.com/pragmaticivan/dotfiles)
