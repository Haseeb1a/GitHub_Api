import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:github/controller/view_controller.dart';
import 'package:github/model/local_github.dart';
import 'package:github/services/git_services.dart';
import 'package:github/widgets/alert_box.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../helpers/colors.dart';

class Hivepage extends StatelessWidget {
  const Hivepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider.of<GithubDataNotifier>(context, listen: false)
    //     .fetchGitHubData('Haseeb1a');
    // final datauser =
    Provider.of<GithubDataNotifier>(
      context,
    ).getfromhive();
    return Scaffold(
      backgroundColor: Colorss.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colorss.black,
        title: Text(
          "HISTORY",
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                resetDB(context);
              },
              icon: Icon(Icons.manage_history_outlined))
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: githubData,
          builder: (context, List<LocalGithub> githubDataSet, Widget? child) {
            print(
                'lllllllllllllllllllllllllllllllllllllllllllllllllllll${githubDataSet.length}');
            List<LocalGithub> githubData = githubDataSet.reversed.toList();
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 10),
                // reverse: true,
                itemCount: githubData.length,
                itemBuilder: (context, index) {
                  final data = githubData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 10),
                                color: Colors.grey.withOpacity(0.3),

                                //  .withOpacity(0.09),
                                blurRadius: 10.0,
                                spreadRadius: 4.0)
                          ]),
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white24,
                            //  borderRadius: BorderRadius.circular(12),
                            // radius:30 ,
                            child: FancyShimmerImage(
                                boxFit: BoxFit.cover,
                                //  height: 30,
                                width: double.infinity,
                                errorWidget: const Icon(
                                  IconlyBold.danger,
                                  color: Colors.red,
                                  size: 28,
                                ),
                                imageUrl: data.avatarUrl.toString()),

                            // backgroundImage:
                            //     NetworkImage(data.avatarUrl.toString()),
                          ),
                          title: Row(
                            children: [
                              Text(
                                data.login.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Expanded(
                                child: Text(
                                  DateFormat(
                                    'MM-dd- yyyy  HH:mm',
                                  ).format(data.dateTime!),
                                  style: TextStyle(color: Colors.black),
                                ),
                              )
                            ],
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                GithubConnections().deleteFromTheHive(index);
                              },
                              icon: Icon(
                                Icons.close_rounded,
                                color: Colors.red,
                              ))
                          // Text(DateFormat('MM-dd- yyyy      HH:mm')
                          //     .format(data.dateTime!)),
                          ),
                    ),
                  );
                });
          }),
    );
  }
}
