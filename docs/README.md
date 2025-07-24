<!-- qompassai/qonfig/docs/README.md -->

<!-- Qompass AI Qonfig Docs -->

<!-- Copyright (C) 2025 Qompass AI, All rights reserved -->

<!--------------------------------------------------------> 

<details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🧭 Qonfig With Git</strong>
    </summary>
    <blockquote
      style="font-size: 1.2em; line-height: 1.8; padding: 25px; background: #f8f9fa; border-left: 6px solid #667eea; border-radius: 8px; margin: 15px 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

```bash
cd ~/.dotfiles # replace with the path to your dotfiles
git init # initialize repository if needed
git submodule add https://github.com/qompassai/qonfig
cp qonfig/tools/git-submodule/install .
touch qonfig.yaml
```

</blockquote>
<details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🧭 Qonfig With Mercurial</strong>
    </summary>
    <blockquote

```bash
cd ~/.dotfiles # replace with the path to your dotfiles
hg init # initialize repository if needed
echo "qonfig = [git]https://github.com/qompassai/qonfig" > .hgsub
hg add .hgsub
git clone https://github.com/qompassai/qonfig
cp qonfig/tools/hg-subrepo/install .
touch install.conf.yaml
```

To get started, you just need to fill in the `qonfig.yaml` and Qonfig
will take care of the rest. To help you get started we have [an
example](#full-example) config file as well as [configuration
documentation](#configuration) for the accepted parameters.

Note: The `install` script is merely a shim that checks out the appropriate
version of Qonfig and calls the full Qonfig installer. By default, the script
assumes that the configuration is located in `install.conf.yaml` the Qonfig
submodule is located in `qonfig`. You can change either of these parameters by
editing the variables in the `install` script appropriately.

Setting up Qonfig as a submodule or subrepo locks it on the current version.
You can upgrade Qonfig at any point. If using a submodule, run `git submodule
update --remote qonfig`, substituting `qonfig` with the path to the Qonfig
submodule. If using a subrepo, run `git fetch && git checkout origin/master` in
the Qonfig directory.

  <details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #ff6b6b; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🔥 Example Config</strong>
    </summary>
    <blockquote
      style="font-size: 1.2em; line-height: 1.8; padding: 25px; background: #fff5f5; border-left: 6px solid #ff6b6b; border-radius: 8px; margin: 15px 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

```YAML
#
- defaults:
    link:
      relink: true

- clean: ['~']

- link:
    ~/.dotfiles: ''
    ~/.tmux.conf: tmux.conf
    ~/.vim: vim
    ~/.vimrc: vimrc

- shell:
  - [git submodule update --init --recursive, Installing submodules]
```

`install.conf.json`

```json
[
    {
        "defaults": {
            "link": {
                "relink": true
            }
        }
    },
    {
        "clean": ["~"]
    },
    {
        "link": {
            "~/.dotfiles": "",
            "~/.tmux.conf": "tmux.conf",
            "~/.vim": "vim",
            "~/.vimrc": "vimrc"
        }
    },
    {
        "shell": [
            ["git submodule update --init --recursive", "Installing submodules"]
        ]
    }
]
```
