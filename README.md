# Moon Package Registry

Спецификация и фикстуры для распространения пакетов Moon через **GitHub Releases** и **semver git tags** (`vX.Y.Z`).

Клиентская реализация (`moon add`, `moon vendor`, `moon publish`) живёт в [moon-lang](https://github.com/nnxlxde-stack/moon-lang).

## Документация

См. [SPEC.md](SPEC.md) — формат `moon.pkg.json`, синтаксис зависимостей в Moonfile, layout пакета.

## Фикстуры

| Путь | Описание |
|------|----------|
| `fixtures/review-kit/` | Пример пакета для тестов vendor/resolver |

## Связанные репозитории

| Репозиторий | Описание |
|-------------|----------|
| [moon-lang](https://github.com/nnxlxde-stack/moon-lang) | Интерпретатор и CLI |
| [moon-vscode](https://github.com/nnxlxde-stack/moon-vscode) | Расширение VS Code |

## Лицензия

MIT