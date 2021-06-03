import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:server_catworm/models/scanner.dart';
import 'package:server_catworm/notifiers/scanner_notifier.dart';
import 'package:server_catworm/notifiers/terminal_notifier.dart';
import 'package:server_catworm/models/message.dart';
import 'package:server_catworm/services/network_service.dart';
import 'package:provider/provider.dart';

class TerminalScreen extends StatefulWidget {
  @override
  State createState() {
    return TerminalScreenSate();
  }
}

class TerminalScreenSate extends State<TerminalScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TerminalNotifier terminalNotifier = Provider.of<TerminalNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Terminal"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (Message message in terminalNotifier.getMessages(
                      terminalNotifier.getCurrIp(),
                    ))
                      Container(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          '\$ ${message.message}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: message.type == 'output'
                                ? Colors.green
                                : Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            /* Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              actions: <Widget>[
                IconSlideAction(
                  caption: 'Clear',
                  color: Colors.red,
                  icon: Icons.cleaning_services_rounded,
                  onTap: () => {
                    //controller.text = '',
                  },
                ),
              ],
              secondaryActions: [
                IconSlideAction(
                  caption: 'Send',
                  color: Colors.green,
                  icon: Icons.play_arrow_rounded,
                  onTap: () async => {
                    print(controller.text),
                    terminalNotifier.addMessage(
                      Message.fromMap(
                        {
                          'id': 0,
                          'message': controller.text,
                          'type': 'input',
                          'date': terminalNotifier.getDate(),
                          'ip': terminalNotifier.getCurrIp()
                        },
                      ),
                      terminalNotifier.getCurrIp(),
                    ),
                    terminalNotifier.addMessage(
                      Message.fromMap(
                        {
                          'id': 0,
                          'message': await NetworkService.execRequest(
                              controller.text,
                              terminalNotifier.getCurrIp(),
                              terminalNotifier.getCurrToken()),
                          'type': 'output',
                          'date': terminalNotifier.getDate(),
                          'ip': terminalNotifier.getCurrIp()
                        },
                      ),
                      terminalNotifier.getCurrIp(),
                    ),
                    //controller.clear(),
                    _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent + 56,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.bounceOut),
                  },
                ),
              ],
              child:  */

            SlidingUpPanel(
              backdropColor: Colors.black,
              color: Colors.black,
              panel: Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        controller: controller,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        cursorColor: Colors.green,
                        autocorrect: false,
                        cursorWidth: 8.0,
                        onChanged: (onChanged) => {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //body:
            /*  Container(
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        controller: controller,
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        cursorColor: Colors.green,
                        autocorrect: false,
                        cursorWidth: 8.0,
                        onChanged: (onChanged) => {},
                      ),
                    ),
                  ],
                ),
              ), */
          ],
        ),
      ),
    );
  }
}
