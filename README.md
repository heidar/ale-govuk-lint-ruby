# What is this?

This is a file for [ALE](https://github.com/w0rp/ale) to allow using the
[GOV.UK Lint](https://github.com/alphagov/govuk-lint) linter for Ruby from
within vim/nvim.

Before using this, consider switching to Rubocop and telling it to load the
GOV.UK Lint rules instead. It's a preferred approach to calling
`govuk-lint-ruby` directly, which is being deprecated.

# Installation

Find your Vim/Neovim configuration folder. This could be `~/.vim` or
`~/.config/nvim` for example.

Create a folder for the linter to live in.

```
mkdir -p ~/.config/nvim/ale_linters/ruby
```

Copy `govuk_lint_ruby.vim` to this directory.

```
cp govuk_lint_ruby.vim ~/.config/nvim/ale_linters/ruby
```

# Usage

ALE will use all available linters by default. That isn't great because it will
use Rubocop and GOV.UK Lint. We want to tell it to use only `govuk-lint-ruby`.

To do this, open your `.vimrc` (Vim) or `init.vim` (Neovim) and add the
following.

```
" Use govuk-lint-ruby to lint Ruby.
let g:ale_linters = {'ruby': ['govuk-lint-ruby']}
```

If you're ever not working on a GOV.UK project, you probably want to comment
that out to go back to Rubocop.

If you use any of the other [Ruby linters](https://github.com/w0rp/ale/tree/master/ale_linters/ruby)
in ALE, such as `rails_best_practices`, then add that to the array.

```
let g:ale_linters = {'ruby': ['govuk-lint-ruby', 'rails_best_practices']}

```
