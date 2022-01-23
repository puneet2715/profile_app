import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_profile/profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter_profile/profile/presentation/bloc/profile_state.dart';
import 'sub-widgets/profilescreen_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProfileLoaded) {
          // Profile
          final profile = state.profile;

          // Name
          final name = profile.results[0].name;
          //Image
          final image = profile.results[0].picture.large;
          // Fullname
          final fullName = '${name.title} ${name.first} ${name.last}';
          //Age
          final age = profile.results[0].dob.age;
          //location
          final location = profile.results[0].location;
          //email
          final email = profile.results[0].email;
          //phone
          final phone = profile.results[0].phone;

          return ProfileScreenPage(
            context: context,
            name: fullName,
            image: image,
            age: age,
            location: location,
            email: email,
            phone: phone,
          );
        }
        return Container();
      },
    );
  }
}
