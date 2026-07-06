# Moon Package Registry

Monorepo пакетов Moon с каталогом и CI-верификацией через `moon check`.

Клиент: [moon-lang](https://github.com/nnxlxde-stack/moon-lang) · Установка: [moon-setup](https://github.com/nnxlxde-stack/moon-setup)

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
```

## Структура

```
packages/<name>/     # публикуемые пакеты
catalog/             # индекс для tooling
fixtures/            # копии для offline-тестов moon-lang
scripts/             # verify-packages (CI)
```

## Документация

[SPEC.md](SPEC.md) — теги, monorepo, CI policy.

## Связанные репозитории

| Репозиторий | Описание |
|-------------|----------|
| [moon-lang](https://github.com/nnxlxde-stack/moon-lang) | Интерпретатор и CLI |
| [moon-vscode](https://github.com/nnxlxde-stack/moon-vscode) | Расширение VS Code |
| [moon-setup](https://github.com/nnxlxde-stack/moon-setup) | Скрипты установки |

## Лицензия

MIT