# Crumbitez Mobile Application

<details>
<summary>Assignment 7</summary>

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
</details>

<details>
<summary>Assignment 8</summary>

### Questions and Answers

1. What is the purpose of const in Flutter? Explain the advantages of using const in Flutter code. When should we use const, and when should it not be used?

**Advantages of Using const in Flutter**

- Performance Optimization: When we mark widgets as const, Flutter can reuse them instead of rebuilding from scratch, which saves memory and makes the app run faster. This reuse helps keep performance smooth, especially for large or complex UIs.
- Predictable UI: const widgets are immutable, meaning they cannot be changed after being created. This immutability reduces the risk of unexpected changes, making it easier to track and predict the app’s behavior.
- Clear and Readable Code: Using const in the code, it signals that a widget or value is stable and unchanging. This clarity helps other developers  understand the structure of the app quickly.

**When to Use const**

- Unchanging Content: Use const for elements that will not change, like static text labels, icons, or layout containers that do not rely on user interaction or app data.
- Consistent Styles and Layouts: If a widget configuration (e.g., colors, padding) is fixed, mark it as const.

**When Not to Use const**
- Dynamic Content: Avoid using const for widgets that need to respond to user actions or app state changes. Since const makes widgets unchangeable, it will not work for anything that needs to update at runtime.

2. Explain and compare the usage of Column and Row in Flutter. Provide example implementations of each layout widget!

In Flutter, Column and Row are simple layout widgets that help us organize items either vertically (Column) or horizontally (Row). Column stacks items on top of each other, making it great for arranging things like text, buttons, and images in a vertical list. Row, on the other hand, lines up items side by side, so it’s perfect for showing items like icons and text together in a row. They support alignment properties such as ```MainAxisAlignment``` and ```CrossAxisAlignment```, let us control how the items are spaced and aligned, like centering them or spreading them out evenly. However, if adding too many items in either a Column or Row, they might run out of space on the screen, causing overflow issues. Here's example of each:

**Column Example**
```
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Item 1'),
    Text('Item 2'),
    ElevatedButton(onPressed: () {}, child: Text('Button'))
  ],
);
```
**Row Example**
```
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Icon(Icons.star),
    Text('Favorite'),
    ElevatedButton(onPressed: () {}, child: Text('Click'))
  ],
);
```

3. List the input elements you used on the form page in this assignment. Are there other Flutter input elements you didn’t use in this assignment? Explain!

**Elements I used on the form page**

- TextFormField: Used for entering text or numbers with specific instructions and validation checks. Each TextFormField has a label, hint text, and validation to guide and restrict user input. I use TextFormField for Cookie Name, Description, Price, and Quantity.
- ElevatedButton: Used as a "Save" button to trigger the form submission. It checks if the inputs are valid, and if so, saves the information and, displays a confirmation message through an AlertDialog.
- AlertDialog: Displays a confirmation dialog box after the form is validated and saved. The dialog displaying the entered product details to confirm everything was saved successfully.

**Other input elements available in flutter (not used here)**
- Checkbox: A small box that users can check or uncheck, often used for things like agreeing to terms or selecting options.
- Switch: A toggle switch that lets users enable or disable a setting, similar to an on/off button.
- Radio: A circular button used when users need to select only one option from a list of choices.
- Slider: A bar with a movable thumb, allowing users to select a value within a range, useful for settings like volume or brightness.
- DropdownButton: A dropdown menu that lets users pick one item from a list, helpful for predefined options like categories.
- DatePicker: Opens a calendar to select a specific date, often used for scheduling or setting deadlines.

4. How do you set the theme within a Flutter application to ensure consistency? Did you implement a theme in your application?

In Flutter, I can set a consistent theme for the entire application using the ```ThemeData``` class in the ```MaterialApp``` widget, as seen in my code. By defining a ```ThemeData``` instance in the theme property of ```MaterialApp```, I set primary and secondary colors, text styles, and other design elements that apply app-wide. In my application, I implemented a theme with ```primarySwatch``` set to deep purple and specified a secondary color (```deepPurple[400]```). This approach ensures that all components, like buttons, AppBar, and other widgets, follow a unified style, creating a cohesive and visually consistent experience across the app.

5. How do you manage navigation in a multi-page Flutter application?

In my multi-page Flutter application, I manage navigation using ```Navigator``` and ```MaterialPageRoute```. This is evident in my ```LeftDrawer``` widget and the ```ItemCard``` in ```product_card.dart```. When a user taps an item (like "Home Page" or "Add Product"), the ```Navigator.pushReplacement``` or ```Navigator.push``` methods are used to navigate to a new page. ```Navigator.pushReplacement``` replaces the current page with the new one, which is helpful for navigating between main pages without stacking them. ```MaterialPageRoute``` creates a transition to the specified page, such as ```MyHomePage``` or ```ProductEntryFormPage```, making navigation between screens smooth. This approach keeps my app organized and ensures that navigation flows intuitively from one page to another.

### Steps

**Create form page to add new item and include the save button**
- Create a file named ```productentry_form.dart``` and add this code
```
import 'package:flutter/material.dart';
import 'package:crumbitez/widgets/left_drawer.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPage();
} 

class _ProductEntryFormPage extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
	String _description = "";
	int _price = 0;
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Cookies',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(),
      ),
    );
  }
}
```
- Create a new variable ```_formKey``` with a value of ```GlobalKey<FormState>();``` and assign ```_formKey``` to the key attribute of the ```Form``` widget. This key handles form state, validation, and storage.
- Create a ```TextFormField``` with this code 
```
...
child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Cookie Name",
                    labelText: "Cookie Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Cookie Name cannot be empty!";
                    }
                    if (value.length < 3 || value.length > 50) {
                      return "Cookie Name must be between 3 and 50 characters.";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description cannot be empty!";
                    }
                    if (value.length < 5 || value.length > 200) {
                      return "Description must be between 5 and 200 characters.";
                    }
                    return null;
                  }
                ),
              ),
...
```
I also created another ```TextFormField``` for description, price, and quantity.
- Create a save button and display the data from the form in a pop-up after pressing the save button on the new item 
```
...
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Cookie successfully saved'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Product Name: $_name'),
                                    Text('Description: $_description'),
                                    Text('Price: $_price'),
                                    Text('Quantity: $_quantity'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
...
```

**Redirect the Add Item button on the main page to the New Item form page**
- In the ```ItemCard``` in ```widgets/product_card.dart```, add this following code
```
onTap: () {
          // Display the SnackBar message when the card is pressed.
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You have pressed the ${item.name} button!"))
            );
          if (item.name == "Add Product") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductEntryFormPage(),
              ),
            );
          }
        },
```

**Create a Drawer**
- Create a file named ```left_drawer.dart``` in the ```Widgets``` directory and add this code
```
import 'package:flutter/material.dart';
import 'package:crumbitez/screens/menu.dart';
import 'package:crumbitez/screens/productentry_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'Crumbitez',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Pick your cookies!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,                
                  ),
                )
              ],
            ),
          ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home Page'),
              // Redirection part to MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.cookie),
              title: const Text('Add Cookies'),
              // Redirection part to ProductEntryFormPage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductEntryFormPage(),
                    ));
              },
            ),
          ],
        ),
      );
    }
  }
```
</details>


<details>
<summary>Assignment 9</summary>

### Questions and Answers

1. Explain why we need to create a model to retrieve or send JSON data. Will an error occur if we don't create a model first?

A model for retrieving or sending JSON data helps define, validate, and maintain a consistent data structure, minimizing issues like missing or improperly formatted fields. Without it, directly managing raw JSON increases the risk of runtime errors, data inconsistencies, or unexpected behavior due to the lack of a structured schema for processing the data.

2. Explain the function of the http library that you implemented for this task.

The HTTP library helps the app communicate with a server by sending requests (such as GET, POST, PUT, or DELETE) and receiving responses. It makes it easier to work with APIs, handle headers, and process JSON data, ensuring smooth interaction between the app and external services.

3. Explain the function of CookieRequest and why it’s necessary to share the CookieRequest instance with all components in the Flutter app.

The `CookieRequest` class handles cookies to store session data and keep users authenticated across multiple requests in a Flutter app. Using a single shared `CookieRequest` instance ensures that session data, such as login details, remains consistent and available throughout the app. Without this shared instance, different parts of the app could lose access to the session data, causing problems like repeated login prompts or disrupted user sessions.

4. Explain the mechanism of data transmission, from input to display in Flutter.

In Flutter, data transmission begins with user input collected through widgets like forms or text fields. This input is then sent to a server using HTTP requests or similar methods. The server processes the request and sends back a response, usually in JSON format. The app reads this response, updates its data using tools like `setState`, `Provider`, or `Bloc`, and then rebuilds the UI to show the updated information or results to the user.

5. Explain the authentication mechanism from login, register, to logout. Start from inputting account data in Flutter to Django’s completion of the authentication process and display of the menu in Flutter.

In Flutter, users enter account details for login or registration through forms, which are sent to the Django backend via HTTP requests. During registration, Django validates the information, creates a new user account, and responds with a success message. For login, Django verifies the credentials, generates a session or token, and sends it back to Flutter. The app saves this session or token to keep the user authenticated. When logging out, Flutter sends a request to Django to clear the session or token. After any of these actions, the app updates its interface to show the appropriate screen or menu.

### Steps

**Implement the Django authentication**
- Create a django-app named ```authentication``` in the django project
- Create a view method for login, register, and logout in ```authentication/views.py```
```
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
import json
from django.contrib.auth import logout as auth_logout

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Successful login status.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login successful!"
                # Add other data if you want to send data to Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login failed, account disabled."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login failed, check email or password again."
        }, status=401)
    
@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)

        # Check if the username is already taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)

        # Create the new user
        user = User.objects.create_user(username=username, password=password1)
        user.save()

        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)

    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)
    
@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logged out successfully!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout failed."
        }, status=401)
```
- Create a ```urls.py``` file in the ```authentication``` and add the URL routing
```
from django.urls import path
from authentication.views import login, register, logout

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('register/', register, name='register'),
    path('logout/', logout, name='logout'),
]
```
- Add path ```('auth/', include('authentication.urls'))```, to the crumbitez/urls.py file

**Integrate authentication system with the Flutter project**
- Install the packages ```flutter pub provider```and ```flutter pub add pbp_django_auth```
- Modify the root widget to provide the CookieRequest library to all child widgets using Provider.
- Create a new file in the ```screens``` folder named ```login.dart``` and fill with the following code
```
import 'package:crumbitez/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:crumbitez/screens/register.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.deepPurple[400]),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password = _passwordController.text;

                  // Check credentials
                  // TODO: Change the URL and don't forget to add a trailing slash (/) at the end of the URL!
                  // To connect the Android emulator to Django on localhost,
                  // use the URL http://10.0.2.2/
                      final response = await request
                          .login("http://localhost:8000/auth/login/", {
                        'username': username,
                        'password': password,
                      });

                      if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                  content:
                                      Text("$message Welcome, $uname.")),
                            );
                        }
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Login Failed'),
                              content: Text(response['message']),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 36.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: Text(
                      'Don\'t have an account? Register',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
- In the ```main.dart``` file, in the ```MaterialApp(...)``` widget, change ```home: MyHomePage()``` to ```home: LoginPage()```
- Create a new filw in the ```screens``` folder named ```register.dart``` and fill with the following code
```
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crumbitez/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password1 = _passwordController.text;
                      String password2 = _confirmPasswordController.text;

                      // Check credentials
                      // TODO: Change the url, don't forget to add a slash (/) inthe end of the URL!
                      // To connect Android emulator with Django on localhost,
                      // use the URL http://10.0.2.2/
                      final response = await request.postJson(
                          "http://localhost:8000/auth/register/",
                          jsonEncode({
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                          }));
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully registered!'),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to register!'),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

**Create a custom model according to your Django application project**
- Create a new file under the ```lib/models```named ```product_entry.dart``` and add the following code
```
import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String model;
    String pk;
    Fields fields;

    ProductEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    int quantity;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.quantity,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "quantity": quantity,
    };
}
```
**Create a page containing a list of all items available at the JSON endpoint in Django**
- Create a new file in the ```lib/screens``` with name ```list_productentry.dart``` and fill with the following code 
```
import 'package:flutter/material.dart';
import 'package:crumbitez/models/product_entry.dart';
import 'package:crumbitez/widgets/left_drawer.dart';
import 'package:crumbitez/widgets/product_details.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // TODO: Don't forget to add the trailing slash (/) at the end of the URL!
    final response = await request.get('http://localhost:8000/json/');
    
    // Decoding the response into JSON
    var data = response;
    
    // Convert json data to a MoodEntry object
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }
  
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cookie Entry List'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There is no cookie data in crumbitez.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final product = snapshot.data![index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(product: product),
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Color of the border
                            width: 1, // Width of the border
                          ),
                          borderRadius: BorderRadius.circular(12), // Border radius of the container
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.description}"),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.price}"),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.quantity}")
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
```
- Add the page ```list_productentry.dart``` to ```widgets/left_drawer.dart``` with this code
```
// ListTile Menu code
...
ListTile(
    leading: const Icon(Icons.add_reaction_rounded),
    title: const Text('Cookies List'),
    onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductEntryPage()),
        );
    },
),
...
```
- Change the function of the ```View Product``` button in the main page to redirect the page to ```ProductPage```
```
...
else if (item.name == "View Mood") {
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context) => const ProductEntryPage()
        ),
    );
}
...
```
**Create a detail page for each item listed on the Product list page and Filter the item list page to display only items associated with the currently logged-in user**
- Create a new file inside the ```widgets``` named ```product_details``` and fill with the following code
```
import 'package:flutter/material.dart'; 
import 'package:crumbitez/models/product_entry.dart'; 

class ProductDetailsPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name), 
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context), 
          ),
        ], // Widget[]
      ), // AppBar
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ), // Text
            const SizedBox(height: 10),
            Text("Description: ${product.fields.description}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Price: ${product.fields.price}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text("Quantity: ${product.fields.quantity}", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
```
- To navigate to the product details page after a user clicks on a product, add the code to the ```list_thriftentry.dart``` file
```
 onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailsPage(product: product),
    ),
  );
},
```
</details>