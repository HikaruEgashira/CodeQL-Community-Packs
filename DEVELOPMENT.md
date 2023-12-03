## Create first Database

```sh
gh extensions install github/gh-codeql
gh codeql set-version latest
```

```sh
cd test
gh codeql database create --language=ruby --source-root=rails-tutorial -- rails-tutorial-db
gh codeql database analyze rails-tutorial-db --format=sarifv2.1.0 --output=rails-tutorial/query-results.sarif --download --verbose codeql/ruby-queries
```
