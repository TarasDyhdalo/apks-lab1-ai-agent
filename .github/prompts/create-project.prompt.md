---
agent: agent
description: "Створити вихідну структуру Python Hello World через skill project-scaffold."
---

# Create Project

## Передумови

- `/git-init` успішно завершено.
- Вхідні параметри: `language=python`, `project_name=hello`.

## Дії

1. Завантаж skill `project-scaffold`.
2. Перед кожним створенням перевір існування файла.
3. Виконай усі дії skill та повідом результат.

## Очікувані файли

- `src/hello/__init__.py`
- `src/hello/main.py`
- `README.md`
- `.gitignore`

## Команди перевірки

```text
test -f src/hello/main.py
python -m hello
```

## Повідомлення про помилку

Якщо відсутній `main.py`, немає функцій `add` і `main` або виник конфлікт файла, зупинися та вкажи шлях і першопричину.
