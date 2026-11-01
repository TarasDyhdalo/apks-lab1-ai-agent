# Архітектура AI-агента

## Які проблеми вирішує агент

Агент прибирає ручне налаштування типової Python-структури, ізолює залежності у `venv`, уніфікує запуск тестів на різних ОС і створює однаковий zipapp-артефакт. Ідемпотентні правила не створюють дублікати у `.gitignore` чи конфігураціях і не знищують наявні зміни.

## Компоненти

- **Manifest:** `.github/agents/build-engineer.agent.md` описує роль, межі, заборони, порядок і критерії успіху.
- **Skills:** `.github/skills/project-scaffold`, `.github/skills/build-and-test` і `.github/skills/github-actions` містять повторювані процедури.
- **Commands:** `.github/prompts/*.prompt.md` є командами `/git-init`, `/create-project`, `/create-build`, `/create-actions`, `/check` та `/init-project`.
- **Orchestrator:** `/init-project` послідовно викликає команди, перевіряє передумови і зупиняється на першій помилці.

## Skills і commands

`project-scaffold` створює `src/hello`, базовий `README.md` і `.gitignore`. `build-and-test` додає `pyproject.toml`, `requirements-dev.txt`, тест, `ci.sh`, `ci.bat` і zipapp. `github-actions` створює один matrix workflow для Ubuntu, Windows і macOS. Prompt-файли задають передумови, дії, очікувані файли та перевірки для кожного етапу.

## Команди

- `git-init` — перевіряє репозиторій, `.gitignore`, status і гілку.
- `create-project` — застосовує `project-scaffold`.
- `create-build` — застосовує `build-and-test`.
- `create-actions` — застосовує `github-actions`.
- `check` — лише читає і звітує таблицею `PASS/FAIL`.
- `init` — оркеструє всі попередні команди.

## Дані між етапами

| Етап | Вхідні дані | Передає далі |
|---|---|---|
| `git-init` | робоча директорія, стан git | підтвердження репозиторію, гілка, `.gitignore` |
| `create-project` | `language=python`, `project_name=hello` | `src/hello/main.py`, `__init__.py`, базовий README |
| `create-build` | вихідна структура | manifest, pytest, скрипти та правила пакування |
| `create-actions` | успішні локальні скрипти | workflow, matrix ОС і шлях артефакту |
| `check` | усі створені файли | таблиця перевірок і фінальний статус |

Етапи передають не секрети, а лише шляхи, параметри, результати команд і статуси перевірок.

## Обробка помилок оркестратором

Перед кроком `/init-project` перевіряє його передумови. Після кроку фіксує результат і перевіряє очікувані файли. Ненульовий код команди, відсутній файл або невдала перевірка означає `FAIL`: оркестратор показує команду, код і стислий вивід, зупиняється та не переходить далі. Успіх не підміняється порожнім артефактом або прихованою помилкою.

## Відповідність файлів ролям

| Файли | Роль |
|---|---|
| `.github/agents/*.agent.md` | manifest |
| `.github/skills/*/SKILL.md` | skills |
| `.github/prompts/*.prompt.md` | commands |
| `.github/prompts/init-project.prompt.md` | orchestrator |
| `src/`, `tests/`, `ci.sh`, `ci.bat` | проєкт і локальна перевірка |
| `.github/workflows/ci.yml` | віддалений CI |
| `README.md`, `docs/usage.md` | документація користувача |