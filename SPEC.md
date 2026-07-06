# Moon Package Registry (Git Tags)

Moon packages are distributed via **Git tags** (`vX.Y.Z`) and optionally **GitHub/GitLab Releases**.

Client implementation lives in [moon-lang](https://github.com/nnxlxde-stack/moon-lang) (`moon add`, `moon vendor`, `moon publish`).

## Supported hosts

| Host | Example dependency |
|------|-------------------|
| `github.com` | `github.com/org/lib: "1.0.0"` |
| `gitlab.com` | `gitlab.com/acme/toolkit@2.0.0` |
| Self-hosted | `git.example.com/org/lib: "0.1.0"` |

Vendor clones via HTTPS: `https://<host>/<owner>/<repo>.git` at tag `vX.Y.Z`.

## Package layout

```
my-package/
  Moonfile              # package "my-package"
  moon.pkg.json         # exports + moon version constraint
  src/
    lib.moon
```

## moon.pkg.json

```json
{
  "name": "my-package",
  "version": "0.1.0",
  "moon": ">=0.3.0",
  "exports": ["src/lib.moon"]
}
```

## Moonfile dependency syntax

```moonfile
dependencies:
  Core.FS
  github.com/org/review-kit: "0.1.0"
  gitlab.com/acme/toolkit: "2.0.0"
```

## CLI

```bash
moon add github.com/org/lib@0.2.0
moon add gitlab.com/acme/toolkit@2.0.0
moon vendor
moon publish    # validate package + create local git tag
```

Vendored cache: `.moon/packages/<owner>/<repo>/<version>/` (gitignored).

## Fixtures

| Path | Description |
|------|-------------|
| `fixtures/review-kit/` | Sample package for vendor/resolver tests in moon-lang |

## Related repositories

| Repository | Role |
|------------|------|
| [moon-lang](https://github.com/nnxlxde-stack/moon-lang) | CLI client (`MoonRegistry`) |
| [moon-vscode](https://github.com/nnxlxde-stack/moon-vscode) | Editor extension |