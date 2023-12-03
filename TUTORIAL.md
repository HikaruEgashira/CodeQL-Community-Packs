# CodeQL Tutorial

## Create first Database

```sh
gh extensions install github/gh-codeql
gh codeql set-version latest
```

## Analyze database

```sh
gh codeql database create --language=ruby --source-root=test/rails-tutorial -- dist/rails-tutorial
gh codeql database analyze dist/rails-tutorial --format=sarifv2.1.0 --output=test/rails-tutorial/analysis/query-results.sarif --download --verbose codeql/ruby-queries
```

## Create first Graph

```sh
gh codeql database analyze dist/rails-tutorial --format=dot --output=dist --download --verbose ql/ruby/ql/test/library-tests/modules/ancestors.ql
dot -Tpdf dist/rb/test/ancestors.dot -o test/rails-tutorial/analysis/ancestors.pdf
```

## Next Actions

- [CodeQL workshop for Ruby](https://github.com/githubuniverseworkshops/codeql/tree/main/workshop-2022)
