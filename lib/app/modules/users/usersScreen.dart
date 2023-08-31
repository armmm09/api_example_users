import 'package:api_example_users/app/providers/users/users_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazyui/lazyui.dart';

import '../../providers/auth/auth_provider.dart';
import 'widgets/users_list_item.dart';



class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(userProvider.notifier);
    final key = GlobalKey();

    return Scaffold(
        appBar: AppBar(
          title: const Text('User'),
          actions: [
            Icon(Ti.settings, key: key).onPressed(() {
              DropX.show(key,
                  options: [
                    'Refresh',
                    'Logout'
                  ].options(icons: [Ti.reload, Ti.logout], dangers: [1]), onSelect: (state) {
                if (state.option == 'Logout') {
                  LzConfirm(
                      title: 'Logout',
                      message: 'Are you sure want to logout?',
                      onConfirm: () {
                        final authNotifier = ref.read(authProvider.notifier);
                        authNotifier.logout(context);
                      }).show(context);
                } else {
                  notifier.getUsers();
                }
              });
            })
          ],
        ),
        body: Consumer(builder: (context, ref, _) {
          final asyncData = ref.watch(userProvider);

          return asyncData.when(
            data: (user) {
              if (user.isEmpty) {
                return LzNoData(
                    message: 'Opps! No data found',
                    onTap: () => notifier.getUsers());
              }

              return Refreshtor(
                onRefresh: () async => notifier.getUsers(),
                child: LzListView(
                  padding: Ei.zero,
                  children: user.generate(
                      (item, i) => UserListItem(user: item, index: i)),
                ),
              );
            },
            loading: () => LzLoader.bar(message: 'Loading...'),
            error: (error, _) => LzNoData(message: 'Opps! $error'),
          );
        }
        ),
        );
  }
}
