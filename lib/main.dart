import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CopyTextExample(),
    );
  }
}

class CopyTextExample extends StatefulWidget {
  const CopyTextExample({super.key});

  @override
  CopyTextExampleState createState() => CopyTextExampleState();
}

class CopyTextExampleState extends State<CopyTextExample> {
  String copiedText = "";

  void copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Text copied to clipboard!')),
    );
  }

  void pasteText() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    setState(() {
      copiedText = data?.text ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Copy Paste Example')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(hintText: "Enter text to copy"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => copyText("777"),
              child: const Text("Copy Text"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: pasteText,
              child: const Text("Paste Text"),
            ),
            const SizedBox(height: 20),
            Text("Pasted Text: $copiedText"),
          ],
        ),
      ),
    );
  }
}
