# chenasraf homebrew tap

Install my package formulae from this tap if you are using Homebrew.

## How do I install these formulae?

### Install package directly

This installs one specific package from the tap:

```sh
brew install chenasraf/tap/<formula>
```

### Install tap

This is how you install the tap, so you will be able to see and install any packages from it:

```sh
brew tap chenasraf/tap
brew install <formula>
```

### In Brewfile

In a [`brew bundle`](https://github.com/Homebrew/homebrew-bundle) `Brewfile`:

```ruby
tap "chenasraf/tap"
brew "<formula>"
```

## Available Formulae

- `treelike` - https://github.com/chenasraf/treelike

## Documentation

See more info about brew using `brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
