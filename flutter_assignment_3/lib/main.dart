import 'package:flutter/material.dart';

void main() {
  runApp(const _MyApp());
}

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MyHomePage(title: 'Flutter Layout Builder Demo'),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  _MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: _key,
          appBar: AppBar(
            title: Text(title),
            leading: constraints.maxWidth < 600
                ? IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => _key.currentState!.openDrawer())
                : const SizedBox(),
          ),
          drawer: constraints.maxWidth < 600
              ? const Drawer(child: _ListItems())
              : const SizedBox(),
          body: constraints.maxWidth < 600
              ? const _CircleAvatar()
              : Row(children: const [
                  Expanded(child: _ListItems()),
                  Expanded(flex: 2, child: _CircleAvatar())
                ]),
        );
      },
    );
  }
}

class _ListItems extends StatelessWidget {
  const _ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(child: ListTile(title: Text("List Item No.$index")));
      },
    );
  }
}

class _CircleAvatar extends StatelessWidget {
  const _CircleAvatar({Key? key}) : super(key: key);

  static const _blueColor = Color(0xFF0D47A1);
  static const _lightBlueColor = Color(0xAA0D47AF);
  static const _whiteColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              maxRadius: 100,
              child: Icon(Icons.person, size: 100),
              backgroundColor: _blueColor,
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child:
                    Text("VentureDive", style: TextStyle(color: _whiteColor)),
              ),
              color: _lightBlueColor,
            )
          ],
        ),
      ),
    );
  }
}
