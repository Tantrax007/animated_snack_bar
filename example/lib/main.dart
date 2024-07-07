import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:example/action_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Snack Bar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animated Snack Bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  AnimatedSnackBar.removeAll();
                },
                child: const Text("Remove all"),
              ),
              const SizedBox(height: 40),
              const Text('Material UI'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  AnimatedSnackBar.material(
                    'This a snackbar with info type',
                    type: AnimatedSnackBarType.info,
                    duration: const Duration(seconds: 1),
                    mobilePositionSettings: const MobilePositionSettings(
                      topOnAppearance: 100,
                      // topOnDissapear: 50,
                      // bottomOnAppearance: 100,
                      // bottomOnDissapear: 50,
                      // left: 20,
                      // right: 70,
                    ),
                    mobileSnackBarPosition: MobileSnackBarPosition.top,
                    desktopSnackBarPosition: DesktopSnackBarPosition.bottomLeft,
                  ).show(context);
                },
                child: const Text("Info"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final snackBar = AnimatedSnackBar.material(
                    'This a snackbar with info type and a very very very long text',
                    type: AnimatedSnackBarType.info,
                    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                    desktopSnackBarPosition: DesktopSnackBarPosition.bottomLeft,
                    snackBarStrategy: RemoveSnackBarStrategy(),
                  );
                  snackBar.show(context);

                  Future.delayed(const Duration(seconds: 2), () {
                    snackBar.remove();
                  });
                },
                child: const Text("Long Info"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  AnimatedSnackBar.material(
                    'This a snackbar with error type',
                    type: AnimatedSnackBarType.error,
                    desktopSnackBarPosition: DesktopSnackBarPosition.topCenter,
                  ).show(context);
                },
                child: const Text("Error"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  AnimatedSnackBar.material(
                    'This a snackbar with success type',
                    type: AnimatedSnackBarType.success,
                    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                    desktopSnackBarPosition: DesktopSnackBarPosition.topRight,
                  ).show(context);
                },
                child: const Text("Success"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  AnimatedSnackBar.material(
                    'This a snackbar with warning type',
                    type: AnimatedSnackBarType.warning,
                  ).show(context);
                },
                child: const Text("Warning"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  AnimatedSnackBar(
                    builder: ((context) {
                      return const MaterialAnimatedSnackBar(
                        titleText: 'Custom material snackbar ',
                        messageText:
                            'This a custom material snackbar with info type',
                        type: AnimatedSnackBarType.info,
                        foregroundColor: Colors.amber,
                        titleTextStyle: TextStyle(
                          color: Colors.brown,
                        ),
                      );
                    }),
                  ).show(context);
                },
                child: const Text("Custom Material"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  AnimatedSnackBar(
                    builder: ((context) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.amber,
                        height: 50,
                        child: const Text('A custom snackbar'),
                      );
                    }),
                  ).show(context);
                },
                child: const Text("Custom"),
              ),
              const SizedBox(height: 10),
              const Text('Colorized Rectangle'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (() {
                  AnimatedSnackBar.rectangle(
                    'Info',
                    'This is an info snack bar',
                    type: AnimatedSnackBarType.info,
                    brightness: Brightness.light,
                  ).show(
                    context,
                  );
                }),
                child: const Text("Info"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (() {
                  AnimatedSnackBar.rectangle(
                    'Error',
                    'This is an error snack bar',
                    type: AnimatedSnackBarType.error,
                    brightness: Brightness.light,
                  ).show(
                    context,
                  );
                }),
                child: const Text("Error"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (() {
                  AnimatedSnackBar.rectangle(
                    'Success',
                    'This is a success snack bar',
                    type: AnimatedSnackBarType.success,
                    brightness: Brightness.light,
                  ).show(
                    context,
                  );
                }),
                child: const Text("Success"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (() {
                  AnimatedSnackBar.rectangle('Info', 'Document downloaded',
                          type: AnimatedSnackBarType.info,
                          brightness: Brightness.light,
                          actionButton: AcctionButon(
                              text: 'Open',
                              borderWidth: 2.0,
                              icon: Icons.open_in_new,
                              size: const Size(100, 10),
                              onClick: () => print('Performing an action'),
                              color: Colors.green[700]!,
                              backgroundColor: Colors.white,
                              overlayColor: Colors.grey[350]!))
                      .show(
                    context,
                  );
                }),
                child: const Text("ActionButton"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (() {
                  AnimatedSnackBar.rectangle(
                    'Warning',
                    'This is a warning snack bar',
                    type: AnimatedSnackBarType.warning,
                    brightness: Brightness.light,
                  ).show(
                    context,
                  );
                }),
                child: const Text("Warning"),
              ),
              const SizedBox(height: 10),
              const Text('Dark Rectangle'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (() {
                  AnimatedSnackBar.rectangle(
                    'Info',
                    'This is an info snack bar',
                    type: AnimatedSnackBarType.info,
                    brightness: Brightness.dark,
                  ).show(
                    context,
                  );
                }),
                child: const Text("Info"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (() {
                  AnimatedSnackBar.rectangle(
                    'Error',
                    'This is an error snack bar',
                    type: AnimatedSnackBarType.error,
                    brightness: Brightness.dark,
                  ).show(
                    context,
                  );
                }),
                child: const Text("Error"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (() {
                  AnimatedSnackBar.rectangle(
                    'Success',
                    'This is a success snack bar',
                    type: AnimatedSnackBarType.success,
                    brightness: Brightness.dark,
                  ).show(
                    context,
                  );
                }),
                child: const Text("Success"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (() {
                  AnimatedSnackBar.rectangle(
                    'Warning',
                    'This is a warning snack bar',
                    type: AnimatedSnackBarType.warning,
                    brightness: Brightness.dark,
                  ).show(
                    context,
                  );
                }),
                child: const Text("Warning"),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
