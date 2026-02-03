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

| Name                                                          | Description                                                               |
| ------------------------------------------------------------- | ------------------------------------------------------------------------- |
| [direnv-dotenvx](https://github.com/chenasraf/direnv-dotenvx) | Direnv plugin to load .env files using dotenvx                            |
| [gi_gen](https://github.com/chenasraf/gi_gen)                 | Gitignore generator for any type of project                               |
| [sofmani](https://github.com/chenasraf/sofmani)               | Installs software from a declerative config on any system                 |
| [treelike](https://github.com/chenasraf/treelike)             | Outputs a Tree-like representation from strings                           |
| [tx](https://github.com/chenasraf/tx)                         | Tmux session manager                                                      |
| [vstask](https://github.com/chenasraf/vstask)                 | Run VS Code tasks.json from the terminal                                  |
| [watchr](https://github.com/chenasraf/watchr)                 | Terminal UI for running and watching command output                       |
| [cospend-cli](https://github.com/chenasraf/cospend-cli)       | Command-line interface for adding expenses to Nextcloud Cospend projects. |

## Documentation

See more info about brew using `brew help`, `man brew` or check
[Homebrew's documentation](https://docs.brew.sh).

## Contributing

I am developing these packages on my free time, so any support, whether code, issues, or just stars
is very helpful to sustaining their life. If you are feeling incredibly generous and would like to
donate just a small amount to help sustain this project, I would be very very thankful!

<a href='https://ko-fi.com/casraf' target='_blank'>
  <img height='36' style='border:0px;height:36px;'
    src='https://cdn.ko-fi.com/cdn/kofi1.png?v=3'
    alt='Buy Me a Coffee at ko-fi.com' />
</a>

I welcome any issues or pull requests on GitHub. If you find a bug, or would like a new feature,
don't hesitate to open an appropriate issue in the respective package's repository and I will do my
best to reply promptly.
