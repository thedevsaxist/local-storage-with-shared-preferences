# Local Storage Demo

Implementation of local storage using Hive, SharedPreferences and SQLite.

## Introduction

This project demonstrates how to implement local storage in a Flutter application using three different methods: Hive, SharedPreferences, and SQLite. Each method has its own advantages and use cases, and this project provides examples of how to use each one.

## Features

- Store and retrieve data using Hive
- Store and retrieve data using SharedPreferences
- Store and retrieve data using SQLite

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/local_storage_demo.git
    ```
2. Navigate to the project directory:
    ```sh
    cd local_storage_demo
    ```
3. Install the dependencies:
    ```sh
    flutter pub get
    ```

## Usage

### Hive

1. Initialize Hive in your main file:
    ```dart
    void main() async {
      await Hive.initFlutter();
      runApp(MyApp());
    }
    ```
2. Open a box and use it to store and retrieve data:
    ```dart
    var box = await Hive.openBox('myBox');
    box.put('key', 'value');
    var value = box.get('key');
    ```

### SharedPreferences

1. Store data using SharedPreferences:
    ```dart
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('key', 'value');
    ```
2. Retrieve data using SharedPreferences:
    ```dart
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString('key');
    ```

### SQLite

1. Initialize the database:
    ```dart
    var database = openDatabase(
      'my_db.db',
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE my_table(id INTEGER PRIMARY KEY, value TEXT)",
        );
      },
    );
    ```
2. Insert and retrieve data:
    ```dart
    await database.insert(
      'my_table',
      {'id': 1, 'value': 'value'},
    );
    List<Map> result = await database.query('my_table');
    ```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.
