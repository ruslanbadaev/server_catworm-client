import 'package:flutter/material.dart';
import 'package:server_catworm/components/server_card/server_card_view_model.dart';
import 'package:server_catworm/models/server_card.dart';

class ServerCardView extends StatefulWidget {
  final ServerCard serverCard;

  ServerCardView({@required this.serverCard});

  @override
  State createState() {
    print(serverCard.currCPU);

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
    return Card(
      child: Container(
        padding: EdgeInsets.all(24),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  serverCard.name,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(serverCard.ip),
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
                    width: MediaQuery.of(context).size.width * 0.28,
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
                            Text('Value: '),
                            Text(
                              ' ${serverCard.currDisk.toStringAsFixed(0)}mb',
                              style: TextStyle(
                                color: serverCardViewModel.getColor(
                                  serverCardViewModel.getPercent(
                                      serverCard.currDisk,
                                      serverCard.totalDisk),
                                ),
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
                              '${serverCardViewModel.getPercent(serverCard.currDisk, serverCard.totalDisk).toString()}%',
                              style: TextStyle(
                                color: serverCardViewModel.getColor(
                                  serverCardViewModel.getPercent(
                                      serverCard.currDisk,
                                      serverCard.totalDisk),
                                ),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.28,
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
                            Text('Value: '),
                            Text(
                              ' ${serverCard.currCPU.toStringAsFixed(0)}mb',
                              style: TextStyle(
                                color: serverCardViewModel.getColor(
                                  serverCardViewModel.getPercent(
                                      serverCard.currCPU, serverCard.totalCPU),
                                ),
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
                              '${serverCardViewModel.getPercent(serverCard.currCPU, serverCard.totalCPU).toString()}%',
                              style: TextStyle(
                                color: serverCardViewModel.getColor(
                                  serverCardViewModel.getPercent(
                                      serverCard.currCPU, serverCard.totalCPU),
                                ),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.28,
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
                            Text('Value: '),
                            Text(
                              ' ${serverCard.totalRAM.toStringAsFixed(0)}mb ',
                              style: TextStyle(
                                color: serverCardViewModel.getColor(
                                  serverCardViewModel.getPercent(
                                      serverCard.currRAM, serverCard.totalRAM),
                                ),
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
                              '${serverCardViewModel.getPercent(serverCard.currRAM, serverCard.totalRAM).toString()}%',
                              style: TextStyle(
                                color: serverCardViewModel.getColor(
                                  serverCardViewModel.getPercent(
                                      serverCard.currRAM, serverCard.totalRAM),
                                ),
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
    );
  }
}
