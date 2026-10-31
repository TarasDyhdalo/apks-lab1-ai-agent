---
agent: agent
description: "Додати pytest, venv, кросплатформні CI-скрипти та zipapp через skill build-and-test."
---

# Create Build

## Передумови

- Існує `src/hello/main.py` з `add` і `main`.
- Skill `project-scaffold` завершився успішно.

## Дії

1. Завантаж skill `build-and-test`.
2. Створи manifest, тест і скрипти без дублювання та непотрібного перезапису.
3. Запусти відповідний скрипт для поточної ОС.

## Очікувані файли

- `pyproject.toml`
- `requirements-dev.txt`
- `tests/test_basic_addition.py`
- `ci.sh`
- `ci.bat`
- `build/hello.pyz` після перевірки

## Команди перевірки

```text
Windows:
.venv\Scripts\python.exe -m pytest
.venv\Scripts\python.exe build\hello.pyz

Linux/macOS:
.venv/bin/python -m pytest
.venv/bin/python build/hello.pyz
```

## Повідомлення про помилку

Якщо залежності не встановились, тест не пройшов або zipapp не запускається, покажи команду та вивід, виправ першопричину і не звітуй про успіх.
