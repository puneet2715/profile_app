import 'package:flutter/material.dart';
import 'package:flutter_profile/profile/domain/entities/location.dart';

class ProfileLocationCard extends StatelessWidget {
  final double height;
  final Location location;
  const ProfileLocationCard({Key? key, this.height = 1, required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(234, 244, 252, 1),
            Color.fromRGBO(245, 245, 245, 1),
          ],
          begin: FractionalOffset.topRight,
          end: FractionalOffset.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                location.street.number +
                    ' , ' +
                    location.street.name +
                    ' , ' +
                    location.city,
                style: const TextStyle(
                  color: Color.fromRGBO(100, 100, 200, 0.9),
                  fontSize: 18,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                location.state + ' , ' + location.country,
                style: const TextStyle(
                  color: Color.fromRGBO(100, 100, 200, 0.9),
                  fontSize: 18,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
