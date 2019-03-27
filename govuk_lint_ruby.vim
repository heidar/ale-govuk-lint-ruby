" Author: heidar - https://github.com/heidar, ynonp - https://github.com/ynonp,
" Eddie Lebow https://github.com/elebow
" Based on the ale rubocop linter
" Description: govuk-lint-ruby, GOVUK's code style analyzer for Ruby files

call ale#Set('ruby_govuk_lint_ruby_executable', 'govuk-lint-ruby')
call ale#Set('ruby_govuk_lint_ruby_options', '')

function! ale_linters#ruby#govuk_lint_ruby#GetCommand(buffer) abort
    let l:executable = ale#Var(a:buffer, 'ruby_govuk_lint_ruby_executable')

    return ale#handlers#ruby#EscapeExecutable(l:executable, 'govuk-lint-ruby')
    \   . ' --format json --force-exclusion '
    \   . ale#Var(a:buffer, 'ruby_govuk_lint_ruby_options')
    \   . ' --stdin ' . ale#Escape(expand('#' . a:buffer . ':p'))
endfunction

function! ale_linters#ruby#rubocop#GetType(severity) abort
    if a:severity is? 'convention'
    \|| a:severity is? 'warning'
    \|| a:severity is? 'refactor'
        return 'W'
    endif

    return 'E'
endfunction

call ale#linter#Define('ruby', {
\   'name': 'govuk-lint-ruby',
\   'executable': {b -> ale#Var(b, 'ruby_govuk_lint_ruby_executable')},
\   'command': function('ale_linters#ruby#govuk_lint_ruby#GetCommand'),
\   'callback': 'ale#ruby#HandleRubocopOutput',
\})
