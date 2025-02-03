# Local Storage Demo

Implementation of local storage using SharedPreferences.

## Introduction

This project demonstrates how to implement local storage in a Flutter application using SharedPreferences. SharedPreferences is a simple key-value storage solution that is easy to use and suitable for storing small amounts of data.

## Features

- Store and retrieve data using SharedPreferences

## Getting Started

### Prerequisites

- Flutter SDK (version 2.0.0 or higher)
- Dart SDK (version 2.12.0 or higher)
- A code editor (such as Visual Studio Code or Android Studio)

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

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License.
