---
agent: agent
description: "Оркеструвати повний цикл git-init, створення проєкту, build, GitHub Actions і перевірки."
---

# Init

## Передумови

- Робоча директорія визначена.
- Доступні prompts `/git-init`, `/create-project`, `/create-build`, `/create-actions`, `/check`.

## Дії

1. Послідовно виконай `/git-init`, `/create-project`, `/create-build`, `/create-actions`, `/check`.
2. Перед кожним кроком перевір його передумови.
3. Працюй ідемпотентно: перед створенням або зміною перевіряй файл; коректні
   наявні файли не перезаписуй, а позначай їх `SKIPPED` із поясненням.
4. Не виконуй commit, push або перемикання гілок. Не змінюй історію git.
5. Після кожного кроку звітуй про створені, змінені, пропущені або перевірені файли
   зі статусом `PASS`, `FAIL` або `SKIPPED`.
6. При першій помилці негайно зупинися, не переходь до наступного кроку і не вважай роботу успішною.
7. Наприкінці виведи підсумковий звіт із результатом кожного кроку, статусами
   `PASS`/`FAIL`/`SKIPPED` і залишковими діями. Якщо будь-який крок має `FAIL`,
   підсумковий статус має бути `FAIL`.

## Очікувані файли

- `.gitignore`
- `src/hello/__init__.py`
- `src/hello/main.py`
- `pyproject.toml`
- `requirements-dev.txt`
- `tests/test_basic_addition.py`
- `ci.sh`
- `ci.bat`
- `.github/workflows/ci.yml`
- `README.md`
- `docs/usage.md`

## Команди перевірки

```text
git status --short
.venv\Scripts\python.exe -m pytest
python build\hello.pyz
git ls-files build .venv
```

На Linux/macOS використовуй відповідно:

```text
git status --short
.venv/bin/python -m pytest
python build/hello.pyz
git ls-files build .venv
```

## Повідомлення про помилку

Повідомлення має містити назву кроку, команду, код завершення, стислий вивід і вказівку, що наступні кроки не виконувалися.
