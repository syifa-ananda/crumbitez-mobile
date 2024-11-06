# Crumbitez Mobile Application

## Assignment 7

### Questions and Answers

1. Explain what are stateless widgets and stateful widgets, and explain the difference between them.

Stateless widgets are like static displays, they show content that does not change once it is created, such as a simple label or an image. However, stateful widgets are more dynamic, allowing content to change over time, like a button that updates when clicked or a form that reflects user input. The difference is that stateless widgets stay the same once they are built, while stateful widgets can update themselves as things change, providing more interactivity in the app.

2. Mention the widgets that you have used for this project and its uses.

- MaterialApp: This is the root widget of the application that defines the app's overall theme, routes, and other settings. 
- Scaffold: Provides a basic layout structure for the app, including the AppBar, body, and floating action buttons. 
- AppBar: A material design app bar used for the top section of the screen.
- Column: A layout widget that arranges its children vertically. It's used to display multiple widgets in a vertical sequence.
- Row: A layout widget that arranges its children horizontally. 
- Padding: Adds padding (spacing) around the child widget. 
- Text: Displays a string of text on the screen. 
- GridView: A widget that arranges its children in a grid. It is used to display a grid of buttons (View Product, Add Product, Logout) as ItemCards.
- Card: A material design card used to display content in a visually distinct way.
- Material: Wraps a widget in a Material Design container. It is used for applying visual styling like color and border-radius to the buttons (ItemCards).
- InkWell: A widget that responds and feedback when the user taps on the buttons.
- Icon: Displays a material design icon. It is used in ItemCard to show the respective icons (list, add, logout) for each action button.
- SnackBar: A widget that displays a message when a button is tapped.

3. What is the use-case for setState()? Explain the variable that can be affected by setState().

In Flutter, setState() is used within a StatefulWidget to notify the framework that the internal state has changed, triggers the app to rebuild part of the UI with the updated data. This is useful when something on the screen needs to change, like updating a button color or a counter. It works by changing the variables inside the widget, and once they are updated, the UI reflects those changes automatically. It is a simple way to keep the app's appearance in sync with its current state.
 
4. Explain the difference between const and final keyword.

In Dart, both final and const are used to create variables that cannot be changed after they are set, but they differ in when we set their values. Final allows us to set the value at runtime, it is decided while the program is running, like fetching data or doing calculations. While const requires the value to be set before the program even starts running, making it a compile-time constant. 

### Steps

**Create a new Flutter application**

- Generate a new Flutter project in the terminal, then enter the project directory
```
flutter create Crumbitez
cd Crumbitez
```
- Run the project with ```flutter run``` and I use chrome to run the flutter app
- Create a new file named menu.dart in the crumbitez/lib directory. On the first line of the file, add this following code
```
import 'package:flutter/material.dart';
```
- From the main.dart file, move ```classMyHomePage``` and ```class _MyHomePageState``` to menu.dart file
- In the ```main.dart``` file, add this code
```
import 'package:mental_health_tracker/menu.dart';
```
- This is my code for the ```main.dart``` file
```
import 'package:flutter/material.dart';
import 'package:crumbitez/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crumbitez',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.deepPurple[400]),
      ),
      home:  MyHomePage(),
    );
  }
}
```

**Create ```View Product List```, ```Add Product```, and ```Logout ``` buttons**

- Before creating the buttons, I declare three variables containing the NPM, name, and class in the ```class MyHomePage``` file and create new class named ```InfoCard``` in the ```menu.dart```
- Create a new class named ```ItemHomepage``` that contains the attributes for each buttons
```
class ItemHomepage {
     final String name;
     final IconData icon;
     final Color color;

     ItemHomepage(this.name, this.icon);
 }
```
- Create a list of ItemHomepage that contains the buttons to the MyHomePage class
```
class MyHomePage extends StatelessWidget {
    ...
    final List<ItemHomepage> items = [
         ItemHomepage("View Product", Icons.list),
         ItemHomepage("Add Product", Icons.add),
         ItemHomepage("Logout", Icons.logout),
     ];
    ...
}
```
- Create ```ItemCard``` class to display the button

**Implement different colors for each button**

- Update the ```ItemHomepage``` class
```
class ItemHomepage {
     final String name;
     final IconData icon;
     final Color color; // Add a color property

     ItemHomepage(this.name, this.icon, this.color); // Update the constructor
 }
```
- Adjust the ```Items``` list in ```MyHomePage``` class
```
final List<ItemHomepage> items = [
         ItemHomepage("View Product", Icons.list, Color(0xFF4E3B31)), // Color for View Product
         ItemHomepage("Add Product", Icons.add, Color(0xFFF5E8B9)), // Color for Add Product
         ItemHomepage("Logout", Icons.logout, Color(0xFFB19470)), // Color for Logout
     ];
```

**Implemet Snackbar with the messages**

- In the ```ItemCard```, add this following code
```
...
child: InkWell(
        // Action when the card is pressed.
        onTap: () {
          // Display the SnackBar message when the card is pressed.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have pressed the ${item.name} button!"))
            );
        },
    ...
)
```
