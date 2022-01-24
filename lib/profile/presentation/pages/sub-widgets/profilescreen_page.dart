import 'package:flutter/material.dart';
import 'package:flutter_profile/profile/domain/entities/location.dart';
import 'package:flutter_profile/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_profile/profile/presentation/bloc/profile_event.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import 'profile_contact_card.dart';
import 'profile_location_card.dart';
import 'profile_main_card.dart';

class ProfileScreenPage extends StatelessWidget {
  final BuildContext context;
  final String name;
  final String image;
  final String age;
  final Location location;
  final String email;
  final String phone;
  const ProfileScreenPage({
    Key? key,
    required this.context,
    this.name = "",
    this.image = "",
    this.age = "",
    this.email = "",
    this.phone = "",
    required this.location,
  }) : super(key: key);

  @override
  Widget build(context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(4, 9, 35, 1),
                Color.fromRGBO(39, 105, 171, 1),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              child: const Icon(Icons.refresh),
              backgroundColor: const Color.fromRGBO(39, 105, 171, 1),
              onPressed: () {
                context.read<ProfileBloc>().add(GetProfile());
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'My\nProfile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    height: height * 0.40,
                    child: ProfileMainCard(
                      name: name,
                      image: image,
                      age: age,
                      country: location.country,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.35,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Other Details',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 27,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          const Divider(
                            thickness: 2.5,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ProfileContactCard(
                            height: height * 0.11,
                            phone: phone,
                            email: email,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ProfileLocationCard(
                            height: height * 0.11,
                            location: location,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
