# Hypotrochoid and Epitrochoid Patterns in Flutter

Welcome to the Hypotrochoid and Epitrochoid Patterns Flutter project! This project demonstrates how to create beautiful and interactive hypotrochoid and epitrochoid patterns using Flutter's powerful drawing capabilities. Whether you're an experienced developer or just starting out, this project offers a fun and educational way to explore Flutter's custom painting and UI design features.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Usage](#usage)
    - [Adjusting Parameters](#adjusting-parameters)
- [Code Overview](#code-overview)
    - [Main Widgets](#main-widgets)
    - [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Introduction

Hypotrochoids and epitrochoids are geometric curves formed by tracing a point attached to a circle rolling inside or outside another circle. These curves produce beautiful and intricate patterns that are both mathematically fascinating and artistically stunning. This Flutter project recreates the experience, allowing users to generate and manipulate these intricate patterns through an intuitive mobile interface.

## Features

- **Interactive UI:** Use sliders to adjust the parameters and watch the patterns evolve in real-time.
- **Customizable Designs:** Change radii, distances, and other variables to generate unique hypotrochoid and epitrochoid patterns.
- **Responsive Layout:** The app adapts seamlessly to different screen sizes and orientations, ensuring a consistent and engaging experience.
- **Smooth Animations:** Enjoy fluid transitions as you tweak parameters and see the patterns evolve instantly.

## Getting Started

### Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/Hypotrochoid-and-Epitrochoid-Patterns.git
    cd Hypotrochoid-and-Epitrochoid-Patterns
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```

## Usage

After running the app, you will see hypotrochoid and epitrochoid patterns displayed on the screen. Use the slider at the bottom to adjust the parameters and explore different designs.

### Adjusting Parameters

- **Outer Circle Radius (R):** Controls the radius of the fixed outer circle.
- **Inner Circle Radius (r):** Controls the radius of the rolling inner circle.
- **Distance (d):** Controls the distance from the center of the inner circle to the tracing point.

## Code Overview

### Main Widgets

- **HypotrochoidEpitrochoidDemo:** This is the main widget containing the UI elements, including the slider and the CustomPaint widget.
- **HypotrochoidEpitrochoidPainter:** A custom painter class responsible for drawing the hypotrochoid and epitrochoid patterns on the canvas.

Here is an example of the `HypotrochoidEpitrochoidPainter` class:

```dart
class HypotrochoidEpitrochoidPainter extends CustomPainter {
  final double t;

  HypotrochoidEpitrochoidPainter({required this.t});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final R = 100.0; // Radius of the fixed outer circle
    final r = 30.0;  // Radius of the rolling inner circle
    final d = 60.0;  // Distance from the center of the inner circle

    final path = Path();

    for (double theta = 0.0; theta < 2 * pi; theta += 0.01) {
      final x = (R - r) * cos(theta) + d * cos((R - r) / r * theta);
      final y = (R - r) * sin(theta) - d * sin((R - r) / r * theta);

      if (theta == 0.0) {
        path.moveTo(size.width / 2 + x, size.height / 2 + y);
      } else {
        path.lineTo(size.width / 2 + x, size.height / 2 + y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(HypotrochoidEpitrochoidPainter oldDelegate) {
    return oldDelegate.t != t;
  }
}
```

### Customization

You can modify the `HypotrochoidEpitrochoidPainter` class to change how the patterns are drawn. Adjust the parameters like `R`, `r`, and `d` to see different patterns. Here's how you might do it:

```dart
class HypotrochoidEpitrochoidPainter extends CustomPainter {
  final double t;
  final double R;
  final double r;
  final double d;

  HypotrochoidEpitrochoidPainter({required this.t, required this.R, required this.r, required this.d});

  @override
  void paint(Canvas canvas, Size size) {
    // Drawing logic
  }

  @override
  bool shouldRepaint(HypotrochoidEpitrochoidPainter oldDelegate) {
    return oldDelegate.t != t || oldDelegate.R != R || oldDelegate.r != r || oldDelegate.d != d;
  }
}
```

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request. For major changes, please open an issue first to discuss what you would like to change.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions or suggestions, feel free to reach out:

- Email: saadi47123@gmail.com
- GitHub: [Saad-Rajpoot](https://github.com/Saad-Rajpoot)
- LinkedIn: [Saad Rajpoot](https://www.linkedin.com/in/saad-rajpoot-b3ba85225/)

Thank you for checking out the Hypotrochoid and Epitrochoid Patterns Flutter project! Enjoy creating your own unique patterns and feel free to share your creations with the community.