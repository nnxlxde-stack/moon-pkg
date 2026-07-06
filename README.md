# Moon Package Registry

[![Docs](https://img.shields.io/badge/docs-GitHub%20Pages-5865F2?style=flat-square)](https://nnxlxde-stack.github.io/moon-lang/)

Monorepo пакетов Moon с каталогом и CI-верификацией через `moon check`.

| Репозиторий | Роль |
|-------------|------|
| [moon-lang](https://github.com/nnxlxde-stack/moon-lang) | Интерпретатор и CLI |
| [moon-vscode](https://github.com/nnxlxde-stack/moon-vscode) | Расширение VS Code / Cursor |
| [moon-setup](https://github.com/nnxlxde-stack/moon-setup) | Установка и TUI-менеджер |

## Установка toolchain

```powershell
irm https://raw.githubusercontent.com/nnxlxde-stack/moon-setup/main/install-all.ps1 | iex
irm https://raw.githubusercontent.com/nnxlxde-stack/moon-setup/main/moon-manage.ps1 | iex
```

## Пакеты

| Пакет | Версия | Зависимость |
|-------|--------|-------------|
| review-kit | 0.1.0 | `github.com/nnxlxde-stack/moon-pkg/review-kit: "0.1.0"` |

Каталог: [catalog/index.json](catalog/index.json)

## Быстрый старт

```bash
# В Moonfile проекта:
dependencies:
  github.com/nnxlxde-stack/moon-pkg/review-kit: "0.1.0"

moon vendor
moon check packages/review-kit/src/main.moon
```

## Структура

```
packages/<name>/     # публикуемые пакеты
catalog/             # индекс для tooling
fixtures/            # копии для offline-тестов moon-lang
scripts/             # verify-packages (CI)
```

## Документация

- [Moon Language Docs](https://nnxlxde-stack.github.io/moon-lang/) — язык, Moonfile, CLI, установка
- [SPEC.md](SPEC.md) — теги, monorepo, CI policy

## Лицензия

MIT