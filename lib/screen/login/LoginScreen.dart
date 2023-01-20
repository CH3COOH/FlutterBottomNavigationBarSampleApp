import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text(
          "ログイン",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    TextButton(
                      onPressed: () => _onTapLoginButton(
                        () {
                          context.goNamed("tab1");
                        },
                      ),
                      child: const Text('ログインする'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapLoginButton(void Function() onSuccess) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLogin', true);
    onSuccess();
  }
}
