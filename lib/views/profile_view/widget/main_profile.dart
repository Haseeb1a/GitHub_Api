import 'package:flutter/material.dart';
import 'package:github/helpers/colors.dart';

// ignore: must_be_immutable
class Profileviewmain extends StatelessWidget {
  String avatarUrl;
  String name;
  String login;
  String id;
  String followers;
  String following;

  Profileviewmain(
      {required this.login,
      required this.avatarUrl,
      required this.name,
      required this.id,
      required this.followers,
      required this.following});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
              radius: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ' ${name}',
                  style: TextStyle(
                      fontSize: s * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colorss.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  ' ${login}',
                  style: TextStyle(
                      fontSize: s * 0.03,
                      fontWeight: FontWeight.bold,
                      color: Colorss.white),
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
                    style: const TextStyle(
                      color: Colorss.white,
                      fontSize: 22,
                    ),
                    children: <TextSpan>[
                  TextSpan(
                    text: id,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ])),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 60,
              child: Card(
                color: Colorss.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_pin,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 38,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text: '${followers}  ',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                              children: const <TextSpan>[
                            TextSpan(
                              text: 'Followers  ',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ])),
                      const SizedBox(
                        width: 10,
                      ),
                      RichText(
                          text: TextSpan(
                              text: '${following}  ',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                              ),
                              children: const <TextSpan>[
                            TextSpan(
                              text: 'Following  ',
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
      ],
    );
  }
}
