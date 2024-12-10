import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      /*
      Kalau misalnya kalian mau cek Widget lain yang udah dibuat, kalian bisa ganti nih MyDialog() nya jadi widget yang udah ada dibawah
      MyHomePage() itu default ketika kita create new project
      MyRow() itu implementasi widget Row
      MyColumn() itu implementasi widget Column
      MyCenter() itu implementasi widget Center
      MyStack() itu implementasi widget Stack
      MyListView() itu implementasi widget ListView
      MyDialog() itu implementasi widget Alert Dialog
      */
      home: const MyStack(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyColumn extends StatelessWidget {
  const MyColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Column Implementation"),
      ),
      // Di sini terdapat implementasi SafeArea, untuk sekarang kemungkinan besar itu ga kelihatan untuk implementasinya
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.red,
                  height: 100,
                  width: 100
                ),
                Container(
                  color: Colors.blue,
                  height: 100,
                  width: 100
                ),
                Container(
                  color: Colors.yellow,
                  height: 100,
                  width: 100
                ),
              ]
            ),
        ),
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  const MyRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Row Implementation"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0)
                ),
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: Colors.red,
                  height: 100,
                  width: 100
                ),
              ),
              Container(
                color: Colors.blue,
                height: 100,
                width: 100
              ),
              Container(
                color: Colors.yellow,
                height: 100,
                width: 100
              ),
            ]
          ),
      ),
    );
  }
}

class MyStack extends StatelessWidget {
  const MyStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Stack Implementation"),
      ),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                color: Colors.red,
                height: 200,
                width: 200
              ),
            ),
            Center(
              child: Container(
                color: Colors.blue,
                height: 150,
                width: 150
              ),
            ),
            Center(
              child: Container(
                color: Colors.yellow,
                height: 100,
                width: 100
              ),
            ),
          ]
        ),
      )
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("List View Implementation"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("This is List View implementation"),
            subtitle: const Text("Test 123"),
            trailing: IconButton(icon: const Icon(Icons.phone, color: Colors.teal), onPressed: () {},)
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("This is List View implementation", style: TextStyle(color: Colors.teal)),
            subtitle: const Text("Test 123"),
            trailing: IconButton(icon: const Icon(Icons.phone, color: Colors.teal), onPressed: () {},)
          ),
        ]
      )
    );
  }
}
class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Grid View Implementation"),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: [
          Container(
            color: Colors.red,
            height: 200,
            width: 200
          ),
          Container(
            color: Colors.blue,
            height: 150,
            width: 150
          ),
          Container(
            color: Colors.yellow,
            height: 100,
            width: 100
          ),
          Container(
            color: Colors.green,
            height: 100,
            width: 100
          ),
        ]
      )
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Alert Dialog Implementation"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Press me!"),
          onPressed: () async {
            return showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text("This is an alert dialog"),
                content: Text("Hello")
              )
            );
          },
        ),
      )
    );
  }
}