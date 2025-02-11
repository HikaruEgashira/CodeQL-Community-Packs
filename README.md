# CodeQL Community Packs

<!-- markdownlint-disable -->
<div align="center">

[![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)](https://github.com/HikaruEgashira/CodeQL-Community-Packs)
[![GitHub Actions](https://img.shields.io/github/actions/workflow/status/HikaruEgashira/CodeQL-Community-Packs/publish.yml?style=for-the-badge)](https://github.com/HikaruEgashira/CodeQL-Community-Packs/actions/workflows/publish.yml?query=branch%3Amain)
[![GitHub Issues](https://img.shields.io/github/issues/HikaruEgashira/CodeQL-Community-Packs?style=for-the-badge)](https://github.com/HikaruEgashira/CodeQL-Community-Packs/issues)
[![GitHub Stars](https://img.shields.io/github/stars/HikaruEgashira/CodeQL-Community-Packs?style=for-the-badge)](https://github.com/HikaruEgashira/CodeQL-Community-Packs)
[![Licence](https://img.shields.io/github/license/Ileriayo/markdown-badges?style=for-the-badge)](./LICENSE)

</div>
<!-- markdownlint-restore -->

Collection of community-driven CodeQL query, library and extension packs

## Getting started

### Default query suites

Using a `hikae/codeql-LANG-queries` query pack will reference the default suite for that pack (e.g. `python.qls` for python). However, you may use a different suite such as `python-audit.qls` by referencing the query pack with the following syntax: `hikae/codeql-python-queries:suites/python-audit.qls`. The examples below work for both syntaxes.

### Using a community pack from the CodeQL Action

> [!IMPORTANT]
> For language aliases in `strategy.matrix.language`, use `cpp` instead of `c-cpp`, `java` instead of `java-kotlin` and `javascript` instead of `javascript-typescript`.

```yaml
- name: Initialize CodeQL
  uses: github/codeql-action/init@v2
  with:
    languages: ${{ matrix.language }}
    packs: hikae/codeql-${{ matrix.language }}-queries
```

### Using a community pack from the CLI configuration file

```bash
$ cat codeql-config.yml | grep -A 1 'packs:'
packs:
  - hikae/codeql-python-queries
```

### Using a community pack from the CodeQL CLI

```bash
codeql database analyze db/ --download hikae/codeql-python-queries --format=sarif-latest --output=results.sarif
```
