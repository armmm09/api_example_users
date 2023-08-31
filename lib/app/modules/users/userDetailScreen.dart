
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import '../../data/models/users.dart';

class UserDetailScreen extends StatelessWidget {
  final Users user;
  const UserDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    String? image = user.image;
    String firstName = user.firstName.orIf();
     String lastName = user.lastName.orIf();


    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: LzListView(
        children: [
          LzImage(image, width: context.width).margin(b: 20),

          Textr('Name : $firstName $lastName', style: Gfont.fs20.bold,margin: Ei.only(r: 5,v:20)),
          
          Col(
            children: ['Age','Gender','Email'].generate((item, i) {
              List<String> values = [user.age.toString().orIf(),user.gender.orIf(), user.email.orIf()];

              return Container(
                padding: Ei.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Br.only(['t'], except: i == 0)
                ),
                child: Row(
                  mainAxisAlignment: Maa.spaceBetween,
                  children: [
                    Col(
                      children: [
                        Text(item, style: Gfont.muted),
                        Text(values[i]),
                      ],
                    ),
                    Icon([Ti.calendar,Ti.user, Ti.at][i], color: Colors.black45)
                  ],
                ),
              );
            }),
          ).clip(all: 5).border(Br.all(), radius: Br.radius(5))
        ],
      ),
    );
  }
}
