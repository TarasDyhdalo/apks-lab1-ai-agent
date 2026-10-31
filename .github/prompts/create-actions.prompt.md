---
agent: agent
description: "Створити GitHub Actions CI для трьох ОС через skill github-actions."
---

# Create Actions

## Передумови

- Існують `ci.sh`, `ci.bat`, `requirements-dev.txt` і тест.
- `build-and-test` завершився успішно.

## Дії

1. Завантаж skill `github-actions`.
2. Створи `.github/workflows/ci.yml` з одним matrix job.
3. Перевір три ОС, два тригери та відсутність секретів.

## Очікувані файли

- `.github/workflows/ci.yml`

## Команди перевірки

```text
git diff -- .github/workflows/ci.yml
```

## Повідомлення про помилку

Якщо відсутній скрипт або workflow має неправильну ОС, тригер чи зайвий крок, зупинися і повідом конкретну невідповідність.
