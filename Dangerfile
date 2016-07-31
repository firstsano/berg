# Sometimes its a README fix, or something like that - which isn't relevant for
# including in a CHANGELOG for example
has_app_changes = !git.modified_files.grep(/lib/).empty?
has_test_changes = !git.modified_files.grep(/spec/).empty?

if has_app_changes && !has_test_changes
  warn "Tests were not updated"
end

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn "PR is classed as Work in Progress" if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn "Big PR" if git.lines_of_code > 500

# Run rubocop
rubocop.lint
