Dotfiles managed by [Dotter](https://github.com/SuperCuber/dotter) to allow for conditionally (or not) sharing dotfiles between my devices.

"Private" dotfiles are stored in the private subrepo. I don't push secrets per se, but instead it's things like my SSH config that I don't necessarily want to be sharing everywhere.
Dotter will simply fail exclaiming it's missing files if the private subrepo is not supplied.

## Systems

For the curious, `otis` is my EndeavourOS gaming PC running KDE. Which is why it also has steam/lutris installed. `zyre` is my EndeavourOS laptop running Niri. I don't game on it, so it doesn't have steam for example. Dotter system setups found in `.dotter/systems/`. The aconfmgr files are templated with conditionals depending on the system, to allow for the afore-mentioned conditional installs like with steam.

## Initial setup

```bash
paru -S dotter-rs-bin
# create a directory for dotfiles
jj git init
dotter init
```

## Cloning from repo

```bash
jj git clone git@github.com:markbeep/dotfiles.git $HOME/.dotfiles
git submodule update --init --recursive # gets the private submodule repo
dotter deploy --dry-run # with --force if required
```

Then add a `.dotter/local.toml` pointing to the right system of "otis" or "zyre":

```toml
includes = [".dotter/systems/otis.toml"]
packages = ["otis"]
```

## Using Jujutsu

[Tutorial](https://docs.jj-vcs.dev/latest/tutorial/)

## Aconfmgr

Remember to run `dots` before running `aconfmgr save`, since the config files are templated and not symlinked.
The `aconfsave` abbreviation in fish is mapped to `dots && aconfmgr save` for this reason.

To ease maintaing the `99-unsorted.sh` aconfmgr file, symlink it into the dotfiles directory. Then empty the file instead of deleting it, after running `aconfsave`.
 
```sh
ln --symbolic /home/mark/.config/aconfmgr/99-unsorted.sh /home/mark/.dotfiles/aconfmgr/99-unsorted.sh
```

Add `--force` if required.
