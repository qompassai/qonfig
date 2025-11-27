<!-- qompassai/qonfig/docs/README.md -->
<!-- Qompass AI Qonfig Docs -->
<!-- Copyright (C) 2025 Qompass AI, All rights reserved -->
<!--------------------------------------------------------> 

<h2> Qompass AI Qonfig Documentation</h2>

To get started, you just need to fill in the `qonfig.yaml` and Qonfig
will take care of the rest. 

Note: The `install` script is merely a shim that checks out the appropriate
version of Qonfig and calls the full Qonfig installer. By default, the script
assumes that the configuration is located in `qonfig.yaml` the Qonfig
submodule is located in `qonfig`. You can change either of these parameters by
editing the variables in the `install` script appropriately.

Setting up Qonfig as a submodule or subrepo locks it on the current version.
You can upgrade Qonfig at any point. If using a submodule, run `git submodule
update --remote qonfig`, substituting `qonfig` with the path to the Qonfig
submodule. If using a subrepo, run `git fetch && git checkout origin/master` in
the Qonfig directory.

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
</details>
</blockquote>

<details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🧭 Qonfig With Mercurial</strong>
    </summary>
    <blockquote>

```bash
cd ~/.dotfiles # replace with the path to your dotfiles
hg init # initialize repository if needed
echo "qonfig = [git]https://github.com/qompassai/qonfig" > .hgsub
hg add .hgsub
git clone https://github.com/qompassai/qonfig
cp qonfig/tools/hg-subrepo/install .
touch qonfig.yaml
```

</details>
</blockquote>

  <details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #ff6b6b; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🔥 Example Minimal Configs</strong>
    </summary>
    <blockquote>
      style="font-size: 1.2em; line-height: 1.8; padding: 25px; background: #fff5f5; border-left: 6px solid #ff6b6b; border-radius: 8px; margin: 15px 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

```YAML
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

`qonfig.json`

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
</blockquote>
 </details>

<details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🔗 Linking</strong>
    </summary>
    <blockquote
      style="font-size: 1.2em; line-height: 1.8; padding: 25px; background: #f8f9fa; border-left: 6px solid #667eea; border-radius: 8px; margin: 15px 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

### Link

Link commands specify how files and directories should be symbolically linked.
If desired, items can be specified to be forcibly linked, overwriting existing
files if necessary. Environment variables in paths are automatically expanded.

#### Format

Link commands are specified as a dictionary mapping targets to source
locations. Source locations are specified relative to the base directory (that
is specified when running the installer). Directory names should *not* contain
a trailing "/" character.

Link commands support an (optional) extended configuration. In this type of
configuration, instead of specifying source locations directly, targets are
mapped to extended configuration dictionaries. These dictionaries map `path` to
the source path, specify `create` as `true` if the parent directory should be
created if necessary, specify `relink` as `true` if incorrect symbolic links
should be automatically overwritten, specify `force` as `true` if the file or
directory should be forcibly linked, and specify `relative` as `true` if the
symbolic link should have a relative path.

#### Example

```yaml
- link:
    ~/.config/terminator:
      create: true
      path: config/terminator
    ~/.vim: vim
    ~/.vimrc:
      relink: true
      path: vimrc
    ~/.zshrc:
      force: true
      path: zshrc
```

</blockquote>
 </details>

<details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🐚 Shell Commands</strong>
    </summary>
    <blockquote
      style="font-size: 1.2em; line-height: 1.8; padding: 25px; background: #f8f9fa; border-left: 6px solid #667eea; border-radius: 8px; margin: 15px 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

### Shell

Shell commands specify shell commands to be run. Shell commands are run in the
base directory (that is specified when running the installer).

#### Format

Shell commands can be specified in several different ways. The simplest way is
just to specify a command as a string containing the command to be run.

Another way is to specify a two element array where the first element is the
shell command and the second is an optional human-readable description.

Shell commands support an extended syntax as well, which provides more
fine-grained control. A command can be specified as a dictionary that contains
the command to be run, a description, and whether `stdin`, `stdout`, and
`stderr` are enabled. In this syntax, all keys are optional except for the
command itself.

#### Example

```yaml
- shell:
  - mkdir -p ~/src
  - [mkdir -p ~/downloads, Creating downloads directory]
  -
    command: read var && echo Your variable is $var
    stdin: true
    stdout: true
  -
    command: read fail
    stderr: true
```

</blockquote>
 </details>

<details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🐚 Clean</strong>
    </summary>
    <blockquote
      style="font-size: 1.2em; line-height: 1.8; padding: 25px; background: #f8f9fa; border-left: 6px solid #667eea; border-radius: 8px; margin: 15px 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

### Clean

Clean commands specify directories that should be checked for dead symbolic
links. These dead links are removed automatically. Only dead links that point
to the dotfiles directory are removed.

#### Format

Clean commands are specified as an array of directories to be cleaned.

#### Example

```yaml
- clean: ['~']
```

</blockquote>
 </details>

<details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🙋 Defaults</strong>
    </summary>
    <blockquote
      style="font-size: 1.2em; line-height: 1.8; padding: 25px; background: #f8f9fa; border-left: 6px solid #667eea; border-radius: 8px; margin: 15px 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

### Defaults

Default options for plugins can be specified so that options don't have to be
repeated many times. This can be very useful to use with the link command, for
example.

Defaults apply to all commands that follow setting the defaults. Defaults can
be set multiple times; each change replaces the defaults with a new set of
options.

#### Format

Defaults are specified as a dictionary mapping action names to settings, which
are dictionaries from option names to values.

#### Example

```yaml
- defaults:
    link:
      create: true
      relink: true
```
</blockquote>
 </details>

<details>
    <summary
      style="font-size: 1.4em; font-weight: bold; padding: 15px; background: #667eea; color: white; border-radius: 10px; cursor: pointer; margin: 10px 0;">
      <strong>🔌 Plugins</strong>
    </summary>
    <blockquote
      style="font-size: 1.2em; line-height: 1.8; padding: 25px; background: #f8f9fa; border-left: 6px solid #667eea; border-radius: 8px; margin: 15px 0; box-shadow: 0 2px 8px rgba(0,0,0,0.1);">

Qonfig also supports custom directives implemented by plugins. Plugins are
implemented as subclasses of `qonfig.Plugin`, so they must implement
`can_handle()` and `handle()`. The `can_handle()` method should return `True`
if the plugin can handle an action with the given name. The `handle()` method
should do something and return whether or not it completed successfully.

All built-in Qonfig directives are written as plugins that are loaded by
default, so those can be used as a reference when writing custom plugins.

Plugins are loaded using the `--plugin` and `--plugin-dir` options, using
either absolute paths or paths relative to the base directory. It is
recommended that these options are added directly to the `install` script.

</blockquote>
 </details>
