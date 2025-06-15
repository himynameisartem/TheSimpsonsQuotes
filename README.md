# The Simpsons Quotes

An iOS app that fetches quotes from "The Simpsons" using a public API and displays them in a list. When a quote is tapped, a detail screen opens with more information.

---

## Features

- Fetch quotes from the network
- Display a list of quotes (character image, name, and quote)
- Show detailed view of selected quote

---

## Architecture

The project is built with **MVC** architecture and does not use Storyboard:

- **Model** — data structures matching the JSON
- **View** — custom table view cells and layout built entirely in code
- **Controller** — handles data fetching and UI logic

---

## Networking

- Uses `URLSession` for data fetching
- Basic error handling and placeholder display

---

## Tech Stack

- Swift
- UIKit
- URLSession
- MVC pattern
- Programmatic UI with Auto Layout

---

## Installation

1. Clone the repository:
   git clone https://github.com/himynameisartem/TheSimpsonsQuotes.git
2.	Open the .xcodeproj file
3.	Build and run the project in the simulator

# The Simpsons Quotes

Приложение на iOS, которое подгружает цитаты персонажей из сериала "The Simpsons" с помощью сети и отображает их в виде списка. При нажатии на цитату открывается экран с её детальным отображением.

---

## Функциональность

- Загрузка цитат из публичного API
- Отображение списка цитат (имя, цитата, изображение)
- Переход на экран с подробной информацией о выбранной цитате

---

## Архитектура

Проект реализован на **MVC** без использования Storyboard:

- **Model** — структура данных, соответствующая JSON
- **View** — кастомные ячейки и layout, созданные вручную
- **Controller** — управляют загрузкой данных и отображением

---

## Сетевая часть

- Используется `URLSession` для загрузки данных
- Обработка ошибок загрузки и отображение плейсхолдеров

---

## Технологии

- Swift
- UIKit
- URLSession
- MVC
- Auto Layout в коде

---

## 📦 Установка

1. Клонируй репозиторий:
   git clone https://github.com/himynameisartem/TheSimpsonsQuotes.git
2.	Открой .xcodeproj файл
3.	Собери и запусти на симуляторе
