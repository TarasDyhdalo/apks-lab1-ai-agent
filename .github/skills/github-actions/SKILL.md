---
name: github-actions
description: "Застосовуй для створення мінімального GitHub Actions workflow для Python CI на Ubuntu, Windows і macOS без секретів."
---

# GitHub Actions

## Коли застосовувати

Застосовуй після `build-and-test`, коли `ci.sh` і `ci.bat` вже існують і потрібно додати workflow для push та pull request.

## Входи

```text
workflow=.github/workflows/ci.yml
branches=[develop, master]
oses=[ubuntu-latest, windows-latest, macos-latest]
artifact=build/hello.pyz
```

## Дії

1. Перевір наявність обох скриптів CI та `requirements-dev.txt`.
2. Створи або обережно онови `.github/workflows/ci.yml`.
3. Додай тригери `push` і `pull_request` для гілок `develop` та `master`.
4. Створи одну job з matrix `os: [ubuntu-latest, windows-latest, macos-latest]`.
5. Додай лише кроки checkout, setup-python, запуск `ci.sh` на Linux/macOS (`shell: bash`) або `ci.bat` на Windows (`shell: cmd`), і upload-artifact для `build/hello.pyz`.
6. Не додавай секрети, ключі, токени, зайві jobs чи непотрібні кроки.

## Виходи

- `.github/workflows/ci.yml`

## Перевірки

- Перевір YAML-синтаксис і назви всіх трьох ОС.
- Перевір обидва тригери та обидві гілки.
- Перевір умовний вибір `.sh`/`.bat` і шлях артефакту.
- Переконайся, що вміст не містить секретів.

## Типовий сценарій помилки і що робити

Якщо workflow не відповідає обмеженню кроків або відсутній скрипт для конкретної ОС, не маскуй проблему: повідом невідповідність, виправ лише workflow і повтори статичні перевірки.
