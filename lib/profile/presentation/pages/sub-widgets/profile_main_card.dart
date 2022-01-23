import 'package:flutter/material.dart';

class ProfileMainCard extends StatelessWidget {
  final String name;
  final String image;
  final String age;
  final String country;
  const ProfileMainCard({
    Key? key,
    this.name = "",
    this.image = "",
    this.age = "",
    this.country = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double innerHeight = constraints.maxHeight;
        double innerWidth = constraints.maxWidth;
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: innerHeight * 0.72,
                width: innerWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: Color.fromRGBO(39, 105, 171, 1),
                          fontFamily: 'Nunito',
                          fontSize: 37,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Age',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontFamily: 'Nunito',
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              age,
                              style: const TextStyle(
                                color: Color.fromRGBO(39, 105, 171, 1),
                                fontFamily: 'Nunito',
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 8,
                          ),
                          child: Container(
                            height: 50,
                            width: 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Country',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontFamily: 'Nunito',
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              country,
                              style: const TextStyle(
                                color: Color.fromRGBO(39, 105, 171, 1),
                                fontFamily: 'Nunito',
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                    width: innerWidth * 0.45,
                    height: innerHeight * 0.45,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: const Color.fromRGBO(39, 105, 171, 0.5),
                        ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill, image: NetworkImage(image)))),
              ),
            ),
          ],
        );
      },
    );
  }
}
