import 'dart:async';
import 'package:flutter/material.dart';
import 'package:github/controller/homecontroller.dart';
import 'package:github/controller/profilepage.dart';
import 'package:github/views/webview.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import '../model/githubmodel.dart';
import '../services/gitservices.dart';

class WeatherView extends StatefulWidget {
  String? user;
  WeatherView({required this.user}) {}
  @override
  _WeatherViewState createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final Githubconnections apiClient = Githubconnections();
  // Github? githubData;

  @override
  void initState() {
    final userdata = Provider.of<Homecontroller>(context, listen: false);
    super.initState();
    fetchGithubData(userdata.searched);
  }

  Future<void> fetchGithubData(String user) async {
    final userdata = Provider.of<Homecontroller>(context, listen: false);
    final userdatas = Provider.of<Profilecontroller>(context, listen: false);
    final response = await apiClient.getgithub(userdata.searched);

    setState(() {
      userdatas.githubData = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userdatas = Provider.of<Profilecontroller>(context, listen: false);

    final s = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 34, 34),
      appBar: AppBar(
        actions: [
          CircleAvatar(
            radius: 50,
            child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlVvaUaLaNpixP_VC6ZkFfa44mDqvDK7-qH7SGhiLIalxqeJTjFz2isCd1lH8_kPmKqNI&usqp=CAU'),
          )
        ],
        backgroundColor: Colors.black,
        title: Text(
          'GITHUB USER ',
        ),
        centerTitle: true,
      ),
      body: userdatas.githubData == null
          ? Center(child: CircularProgressIndicator())
          : Consumer<Profilecontroller>(builder: (context, value, child) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(value.githubData!.avatarUrl),
                            radius: 60,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ' ${value.githubData!.name}',
                                style: TextStyle(
                                    fontSize: s * 0.03,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                ' ${value.githubData!.login}',
                                style: TextStyle(
                                    fontSize: s * 0.03,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'ID: ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                  children: <TextSpan>[
                                TextSpan(
                                  text: value.githubData!.id.toString(),
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ])),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            height: 60,
                            child: Card(
                              color: Color.fromARGB(255, 255, 255, 255),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person_pin,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      size: 38,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text:
                                                '${value.githubData!.followers}  ',
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: <TextSpan>[
                                          TextSpan(
                                            text: 'followers  ',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ])),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text:
                                                '${value.githubData!.following}  ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: <TextSpan>[
                                          TextSpan(
                                            text: 'following  ',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ])),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //  SizedBox(height: 2,),
                                SizedBox(
                                  height: 60,
                                  child: Card(
                                    color: Color.fromRGBO(74, 143, 85, 1),
                                    child: Row(
                                      children: [
                                        Icon(Icons.format_quote_sharp),
                                        Text(
                                          value.githubData!.bio,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 45,
                                  child: Card(
                                    color: Color.fromARGB(255, 35, 34, 34),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.location_city_rounded,
                                              color: Color.fromARGB(
                                                  255, 255, 219, 164)),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${value.githubData!.company}  ',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontWeight: FontWeight.bold,
                                                fontSize: s * 0.014),
                                          ),
                                          Icon(Icons.location_on_outlined,
                                              color: Colors.yellow),
                                          Text(
                                            ' ${value.githubData!.location}',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontSize: s * 0.014,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            text: 'Type   ',
                                            style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: <TextSpan>[
                                          TextSpan(
                                            text: value.githubData!.type
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ])),
                                  ],
                                ),
                                Row(
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            text:
                                                '${value.githubData!.publicRepos} ',
                                            style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: <TextSpan>[
                                          TextSpan(
                                            text: 'publicRepos  ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ])),
                                    RichText(
                                        text: TextSpan(
                                            text:
                                                '${value.githubData!.publicGists} ',
                                            style: TextStyle(
                                              color: Colors.yellow,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: <TextSpan>[
                                          TextSpan(
                                            text: 'publicGists',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ])),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'createdAt  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                  children: <TextSpan>[
                                TextSpan(
                                  text: '${value.githubData!.createdAt}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: s * 0.01,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: '  updatedAt  ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                  children: <TextSpan>[
                                TextSpan(
                                  text: ' ${value.githubData!.updatedAt}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: s * 0.01,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ])),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArticleScreen(
                                  blogUrl: value.githubData!.htmlUrl),
                            )),
                        child: Text(
                          'URl: ${value.githubData!.htmlUrl}',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlVvaUaLaNpixP_VC6ZkFfa44mDqvDK7-qH7SGhiLIalxqeJTjFz2isCd1lH8_kPmKqNI&usqp=CAU'),
                            radius: 9,
                          ),
                          Text(
                            '  ${value.githubData!.login}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              );
            }),
    );
  }
}
