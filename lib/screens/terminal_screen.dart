import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
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
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TerminalNotifier terminalNotifier = Provider.of<TerminalNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        //title: Text("Terminal"),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Container(
                  width: 33,
                  child: IconButton(
                    onPressed: () => {},
                    icon: Icon(
                      Icons.circle,
                      color: Colors.red,
                      size: 18,
                    ),
                  ),
                ),
                Container(
                  width: 33,
                  child: IconButton(
                    onPressed: () => {
                      Phoenix.rebirth(context),
                    },
                    icon: Icon(
                      Icons.circle,
                      color: Colors.orangeAccent,
                      size: 18,
                    ),
                  ),
                ),
                Container(
                  width: 33,
                  child: IconButton(
                    onPressed: () => {
                      Navigator.of(context).pop(),
                    },
                    icon: Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        /*  leading: Container(
          width: 100,
          child: Row(
            children: [
              Container(
                width: 33,
                child: IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.circle,
                    color: Colors.red,
                    size: 16,
                  ),
                ),
              ),
              Container(
                width: 25,
                child: IconButton(
                  onPressed: () => {},
                  icon: Icon(
                    Icons.circle,
                    color: Colors.orangeAccent,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ), */
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
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(4),
                        child: Text(
                          '\$ ${message.message}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: message.type == 'output'
                                ? Colors.lightGreenAccent
                                : Colors.lightBlueAccent,
                            fontSize: 18,
                            //fontWeight: FontWeight.bold,
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
              minHeight: 60,
              //backdropColor: Colors.black,
              //color: Colors.black,
              panel: Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        spreadRadius: 3,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    // color: Colors.deepPurple,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        actions: <Widget>[
                          IconSlideAction(
                            caption: 'Clear',
                            color: Colors.red,
                            icon: Icons.cleaning_services_rounded,
                            onTap: () => {
                              controller.text = '',
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
                                  _scrollController.position.maxScrollExtent +
                                      56,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.bounceOut),
                            },
                          ),
                        ],
                        child: Container(
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
                            onChanged: (onChanged) => {
                              //controller.text = '',
                            },
                          ),
                        ),
                      ),
                      /* Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.all(12),
                            child: RaisedButton(
                              padding: EdgeInsets.all(24),
                              color: Colors.red,
                              elevation: 12,
                              focusElevation: 14,
                              hoverElevation: 14,
                              highlightElevation: 18,
                              disabledElevation: 0,
                              onPressed: () {
                                controller.text = '';
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.cleaning_services_rounded),
                                  Text(
                                    '  Clear  ',
                                    style: TextStyle(fontSize: 21),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Icon(
                            Icons.drag_handle_rounded,
                            size: 32,
                          ),
                          Container(
                            margin: EdgeInsets.all(12),
                            child: RaisedButton(
                              padding: EdgeInsets.all(24),
                              color: Colors.green,
                              elevation: 12,
                              focusElevation: 14,
                              hoverElevation: 14,
                              highlightElevation: 18,
                              disabledElevation: 0,
                              onPressed: () async {
                                print(controller.text);
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
                                );
                                terminalNotifier.addMessage(
                                  Message.fromMap(
                                    {
                                      'id': 0,
                                      'message':
                                          await NetworkService.execRequest(
                                              controller.text,
                                              terminalNotifier.getCurrIp(),
                                              terminalNotifier.getCurrToken()),
                                      'type': 'output',
                                      'date': terminalNotifier.getDate(),
                                      'ip': terminalNotifier.getCurrIp()
                                    },
                                  ),
                                  terminalNotifier.getCurrIp(),
                                );
                                controller.clear();
                                _scrollController.animateTo(
                                    _scrollController.position.maxScrollExtent +
                                        56,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.bounceOut);
                              },
                              child: Row(
                                children: [
                                  Icon(Icons.play_arrow_rounded),
                                  Text(
                                    '  Send  ',
                                    style: TextStyle(fontSize: 21),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ), */
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () => {},
                  label: Text('Add command button'),
                  icon: Icon(Icons.add_box_rounded),
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
