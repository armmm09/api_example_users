import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lazyui/lazyui.dart';
import '../../providers/auth/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider.notifier);
    final forms = auth.forms;

    forms.fill({'username': 'kminchelle', 'password': '0lelplR'});

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 360,
          child: LzListView(
            shrinkWrap: true,
            scrollLimit: const [20],
            children: [
              Column(
                  crossAxisAlignment: Caa.center,
                  children: [
                    Textr('Welcome Back!', style: Gfont.bold.bold.fsize(24)),
                    SizedBox(height: 15),
                    Textr(
                      'Login to continue',
                      style: Gfont.grey.bold.fsize(16),
                    ),
                  ],
                ),
              LzFormGroup(
                children: [
                  LzForm.input(
                      label: 'Username',
                      hint: 'Type your username',
                      model: forms['username']),
                  LzForm.input(
                      label: 'Password',
                      hint: 'Type your password',
                      obsecureToggle: true,
                      model: forms['password']),
                ],
              ),
              Textr(
                  'Forgot Password',
                  icon: Ti.lockBolt,
                  style: Gfont.red,
                  margin: Ei.only(b: 25),
                ),
              LzButton(
                  text: 'Login',
                  onTap: (state) {
                    auth.login(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
