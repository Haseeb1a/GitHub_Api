import 'package:flutter/material.dart';

import '../../../helpers/colors.dart';

// ignore: must_be_immutable
class Profilesub extends StatelessWidget {
  String bio;
  String company;
  String location;
  String type;
  String publicRepos;
  String publicGists;
  Profilesub(
      {super.key,
      required this.bio,
      required this.company,
      required this.location,
      required this.type,
      required this.publicRepos,
      required this.publicGists});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 200,
      child: Card(
        color: Colorss.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 2,
              ),
              SizedBox(
                height: 60,
                child: Card(
                  color: const Color.fromRGBO(74, 143, 85, 1),
                  child: Row(
                    children: [
                      const Icon(Icons.format_quote_sharp),
                      Text(
                        bio,
                        style: const TextStyle(color: Colorss.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                child: Card(
                  color: const Color.fromARGB(255, 35, 34, 34),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.location_city_rounded,
                            color: Color.fromARGB(255, 255, 219, 164)),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${company}  ',
                          style: TextStyle(
                              color: Colorss.white,
                              fontWeight: FontWeight.bold,
                              fontSize: s * 0.014),
                        ),
                        const Icon(Icons.location_on_outlined,
                            color: Colors.yellow),
                        Text(
                          ' ${location}',
                          style: TextStyle(
                            color: Colorss.white,
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
                          style: const TextStyle(
                            color: Colorss.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                        TextSpan(
                          text: type.toString(),
                          style: const TextStyle(
                            color: Colorss.green,
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
                          text: '${publicRepos} ',
                          style: const TextStyle(
                            color: Colorss.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                        TextSpan(
                          text: 'PublicRepos  ',
                          style: TextStyle(
                            color: Colorss.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])),
                  RichText(
                      text: TextSpan(
                          text: '${publicGists} ',
                          style: const TextStyle(
                            color: Colorss.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children: const <TextSpan>[
                        TextSpan(
                          text: 'PublicGists',
                          style: TextStyle(
                            color: Colorss.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ])),
                ],
              ),
              const SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
