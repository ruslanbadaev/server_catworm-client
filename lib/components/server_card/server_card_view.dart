import 'package:flutter/material.dart';
import 'package:server_catworm/components/server_card/server_card_view_model.dart';
import 'package:server_catworm/models/server_card.dart';

class ServerCardView extends StatefulWidget {
  final ServerCard serverCard;

  ServerCardView({@required this.serverCard});

  @override
  State createState() {
    return ServerCardViewState(serverCard);
  }
}

class ServerCardViewState extends State<ServerCardView> {
  ServerCard serverCard;
  ServerCardViewModel serverCardViewModel;

  ServerCardViewState(this.serverCard) {
    serverCardViewModel = new ServerCardViewModel();
    serverCardViewModel.setServerCard(serverCard);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {Navigator.pushNamed(context, "/terminal")},
      child: Card(
        child: Container(
          padding: EdgeInsets.all(24),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*       Icon(
                                    Icons.circle,
                                    color: Colors.green,
                                    size: 14,
                                  ), */
                  Text(
                    'Server name',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  /*  Container(), */
                ],
              ),
              Text('127.0.0.1'),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.black12,
                margin: EdgeInsets.only(
                  top: 12,
                  bottom: 12,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text('FREE DISK:'),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              // Icon(Icons.memory_rounded),
                              Text('Total: '),
                              Text(
                                ' 32mb',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.cloud_upload_rounded),
                              Text('Percent: '),
                              Text(
                                '82%',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text('FREE CPU:'),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              // Icon(Icons.memory_rounded),
                              Text('Total: '),
                              Text(
                                ' 32mb',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // Icon(Icons.cloud_upload_rounded),
                              Text('Percent: '),
                              Text(
                                '82%',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 12,
                          ),
                          Text('FREE RAM:'),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            /* mainAxisAlignment:
                                                MainAxisAlignment.end, */
                            children: [
                              Text('Total: '),
                              Text(
                                ' 123mb ',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Icon(Icons.memory_rounded),
                            ],
                          ),
                          Row(
                            /* mainAxisAlignment:
                                                MainAxisAlignment.end, */
                            children: [
                              Text('Percent: '),
                              Text(
                                ' 12% ',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Icon(Icons.cloud_upload_rounded),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
