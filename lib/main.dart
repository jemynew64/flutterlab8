import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final TextEditingController _controller = TextEditingController();  // Controlador para el texto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Cuadro de texto
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _controller,  // Asociamos el controlador al TextField
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ingrese texto",
                ),
              ),
            ),
            ElevatedButton(
              child: Text("Ir a pag2"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2(
                      title: 'Page 2',
                      controller: _controller,  // Pasamos el controlador a Page2
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String title;
  final TextEditingController controller;  // Recibimos el controlador

  Page2({required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mostramos el valor actual del texto
            Text("Texto ingresado: ${controller.text}"),
            ElevatedButton(
              child: Text("Ir a pag 3"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page3(
                      title: 'Page 3',
                      controller: controller,  // Pasamos el controlador a Page3
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final String title;
  final TextEditingController controller;  // Recibimos el controlador

  Page3({required this.title, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mostramos el valor actual del texto
            Text("Texto ingresado: ${controller.text}"),
            ElevatedButton(
              child: Text("Finalizar"),
              onPressed: () {
                // Navega hacia la primera página
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        ),
      ),
    );
  }
}
