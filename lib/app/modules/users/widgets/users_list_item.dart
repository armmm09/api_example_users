import 'package:api_example_users/app/providers/users/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazyui/lazyui.dart' hide ContextExtension;
import '../../../data/models/users.dart';
import '../../../routes/paths.dart';

class UserListItem extends StatelessWidget {
  final Users user;
  final int index;
  final user2 = UserNotifier();
   UserListItem({Key? key, required this.user, this.index = 0});
  

 

  @override
  Widget build(BuildContext context) {
    String? image = user.image;
    String? firstName = user.firstName;
    String? gender = user.gender;

    return InkTouch(
      onTap: () {
        context.push(Paths.userDetails, extra: user);
      },
      border: Br.only(['t'], except: index == 0),
      padding: Ei.all(20),
      child: Row(
        children: [
          LzImage(image, size: 70).margin(r: 15),
          Col(
            children: [
              Text(firstName ?? '', overflow: Tof.ellipsis),
              Text(gender ?? ''),
            ],
          ).flexible(),
          Spacer(),
          Spacer(),
          IconButton(
            padding: Ei.only(h: 1),
            icon: Icon(Icons.delete),
           onPressed: () async {
            await user2.deleteLocalData();
            print('Data berhasil dihapus');
          },
          ),
        ],
      ),
    );
  }
}
