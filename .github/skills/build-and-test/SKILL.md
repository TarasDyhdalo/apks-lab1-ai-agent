---
name: build-and-test
description: "Застосовуй для налаштування pytest, venv, кросплатформних ci.sh/ci.bat, zipapp та перевірки Hello World."
---

# Build and Test

## Коли застосовувати

Застосовуй після `project-scaffold`, коли потрібно додати залежності розробки, тест BasicAddition, локальні скрипти CI та виконуваний артефакт `build/hello.pyz`.

## Входи

```text
language=python
project_name=hello
source_dir=src
test_runner=pytest
```

## Дії

1. Перевір наявність `src/hello/main.py` і не починай без нього.
2. Створи `pyproject.toml` з Python 3.10+, pytest і `pythonpath = ["src"]`.
3. Створи `requirements-dev.txt` з `pytest`.
4. Створи `tests/test_basic_addition.py` з класом `TestBasicAddition`, який перевіряє `add`.
5. Створи `ci.sh`: створи `.venv`, встанови `requirements-dev.txt`, запусти `pytest`, створи `build/hello.pyz` через `python -m zipapp src/hello -o build/hello.pyz -m hello.main:main`, запусти артефакт.
6. Створи `ci.bat` з тією самою послідовністю та шляхом `.venv\Scripts\python.exe`.
7. Зроби скрипти зупинятися при першій помилці; не приховуй помилки встановлення чи тестів.

## Виходи

- `pyproject.toml`
- `requirements-dev.txt`
- `tests/test_basic_addition.py`
- `ci.sh`
- `ci.bat`
- `build/hello.pyz` після успішного запуску

## Перевірки

- Переконайся, що використано `.venv/bin/python` на Linux/macOS і `.venv\Scripts\python.exe` на Windows.
- Переконайся, що `pytest` завершився успішно.
- Перевір існування `build/hello.pyz`.
- Перевір, що `python build/hello.pyz` виводить рівно `Hello, World!`.

## Типовий сценарій помилки і що робити

Якщо `pytest` або `zipapp` завершується з помилкою, зупини сценарій, покажи команду та її вивід, виправ першопричину і повтори весь крок. Не створюй порожній або успішно позначений артефакт після невдалої збірки.
