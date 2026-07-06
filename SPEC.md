# Moon Package Registry (Monorepo)

Moon packages live in this repository under `packages/<name>/` and are released via **per-package git tags** (`<name>/vX.Y.Z`).

Client: [moon-lang](https://github.com/nnxlxde-stack/moon-lang) (`moon add`, `moon vendor`, `moon publish`).

## Catalog

Machine-readable index: [catalog/index.json](catalog/index.json)

Raw URL:
`https://raw.githubusercontent.com/nnxlxde-stack/moon-pkg/main/catalog/index.json`

## Monorepo layout

```
moon-pkg/
  packages/
    review-kit/
      Moonfile
      moon.pkg.json
      src/lib.moon
  catalog/index.json
```

## Dependency syntax

```moonfile
dependencies:
  Core.FS
  github.com/nnxlxde-stack/moon-pkg/review-kit: "0.1.0"
```

Import:

```moon
import github.com.nnxlxde-stack.moon-pkg.review-kit
```

## Tags

| Package | Tag format | Example |
|---------|------------|---------|
| Standalone repo | `v0.1.0` | `github.com/org/lib: "0.1.0"` |
| Monorepo package | `<name>/v0.1.0` | `review-kit/v0.1.0` |

## Supported hosts

`github.com`, `gitlab.com`, self-hosted HTTPS git.

## CLI

```bash
moon add github.com/nnxlxde-stack/moon-pkg/review-kit@0.1.0
moon vendor
moon publish
```

Vendored cache: `.moon/packages/<owner>/<repo>/<package>/<version>/`

## CI verification

Every PR runs `scripts/verify-packages.ps1` — `moon check` on all `moon.pkg.json` exports. No network required.

## Adding a package

1. Add `packages/<name>/` with `Moonfile`, `moon.pkg.json`, sources
2. Register in `catalog/index.json`
3. Open PR (CI must pass)
4. From package dir: `moon publish` → creates tag `<name>/vX.Y.Z`
5. Push tag to this repository