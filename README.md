<!-- SPDX-License-Identifier: 0BSD -->

# filter-wsl-path - filter out most non-WSL path dirs

`filter-wsl-path.sh` can be sourced in a Bourne-style shell to remove
directories from `$PATH` that appear to reside on a Windows system outside WSL.
It's only useful on WSL systems, which by default get lots of extra `$PATH`
directories that can interfere with some programs inside WSL (such as `node`).

## License

This software is licensed under [0BSD](https://spdx.org/licenses/0BSD.html).
See [**`LICENSE`**](LICENSE).

## Usage guide

### Basic concepts

I use this when I need it, such as when using `node` or other commands that use
it such as `pyright`. You could probably use this all the time, but I haven't
tested it out that way.

You need to have a Python 3 interpreter installed and available via the
`python3` command, because `filter-wsl-path.sh` does part of its work using
Python. Most systems, especially most systems used in WSL, *do* have a working
`python3`. This is a system utility. The virtual environment is only used for
development purposes, including static analysis.

`filter-wsl-path.sh` only does this **for the current shell, not permanently**.
It must be *sourced*, not executed.

### Using it without installing

To run `filter-wsl-path.sh` from inside the top-level repository directory that
contains it:

```sh
. ./filter-wsl-path.sh
```

Most Bourne-style shells support `source` as an alternative spelling of `.`, so
you could use this instead if you prefer:

```sh
source ./filter-wsl-path.sh
```

### Installing and using

You may want to install it to `~/bin`. If `~/bin` exists, you can install it by
running:

```sh
./deploy
```

Then, assuming `~/bin` is on your path, you will be able to run use it whenever
you like by running:

```sh
. filter-wsl-path.sh
```

Note that you do not use `./`, but you need the `.`. You must separate the `.`
from `filter-wsl-path.sh`.

Since most Bourne-style shells support `source` as an alternative spelling of
`.`, so you could use this instead if you prefer:

```sh
source filter-wsl-path.sh
```

## What is retained in `$PATH`

### The rule, and small list of exceptions

Everything outside `/mnt` is kept. Also, the directories that contain Windows
commands that are frequently useful to use from within WSL—currently,
`clip.exe`, `code`, and `code-insiders`—are also kept.

If you have directories under `/mnt` in `$PATH`, they would usually be removed
even if they are not related to WSL. In a WSL system, that is unlikely. If you
were to use this script on a non-WSL system, that might occasionally be a
problem, but it doesn't really make sense to do that.

### Previewing

You can preview what `filter-wsl-path.sh` would set `$PATH` to by running:

```sh
get-filtered-wsl-path
```

If you didn't run `./deploy` to install it, then that won't work, but this
will, so long as you're in the top-level repository directory:

```sh
./get-filtered-wsl-path
```

You can compare that to the actual current `$PATH`. One way to see the current
`$PATH` is to run:

```sh
printenv PATH
```
