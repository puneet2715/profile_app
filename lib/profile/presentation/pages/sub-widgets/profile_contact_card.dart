import 'package:flutter/material.dart';

class ProfileContactCard extends StatelessWidget {
  final String email;
  final String phone;
  final double height;
  const ProfileContactCard(
      {Key? key, this.height = 1, this.email = "", this.phone = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: height,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(234, 244, 252, 1),
            Color.fromRGBO(245, 245, 245, 1),
          ],
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.topRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Email : ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito',
                  ),
                ),
                Text(
                  email,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Color.fromRGBO(80, 150, 255, 1),
                    fontSize: 20,
                    fontFamily: 'Nunito',
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const Text(
                "Phone : ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Nunito',
                ),
              ),
              Text(
                phone,
                style: const TextStyle(
                  color: Color.fromRGBO(80, 150, 255, 1),
                  fontSize: 20,
                  fontFamily: 'Nunito',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
