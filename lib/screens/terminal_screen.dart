import 'package:flutter/material.dart';
import 'package:xterm/flutter.dart';
import 'package:xterm/xterm.dart';
import 'package:server_catworm/models/scanner.dart';
import 'package:server_catworm/notifiers/scanner_notifier.dart';
import 'package:provider/provider.dart';

class TerminalScreen extends StatefulWidget {
  @override
  State createState() {
    return TerminalScreenSate();
  }
}

class TerminalScreenSate extends State<TerminalScreen> {
  /*  Terminal terminal;

  @override
  void initState() {
    super.initState();
    terminal = Terminal(onInput: onInput);
    terminal.write('xterm.dart demo');
    terminal.write('\r\n');
    terminal.write('\$ ');
  }

  void onInput(String input) {
    if (input == '\r') {
      terminal.write('\r\n');
      terminal.write('\$ ');
    } else {
      terminal.write(input);
    }  TerminalView(terminal: terminal)
  } */

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      controller: controller,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      cursorColor: Colors.green,
                      //cursorRadius: Radius.circular(16.0),
                      autocorrect: false,
                      cursorWidth: 8.0,
                      onChanged: (onChanged) => {
                        //print(onChanged),
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () => {
                      print(controller.text),
                      controller.clear(),
                    },
                    icon: Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
/*
       floatingActionButton: FloatingActionButton(
        onPressed: () => {print(controller.text), controller.clear()},
        child: Icon(Icons.play_arrow_rounded),
      ), 
*/
    );
  }
}
