import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tab1RootScreen extends ConsumerWidget {
  const Tab1RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text(
          "タブ1のルート",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            // onPressed: () {
            //   // TODO: サインアウト
            //   context.pushReplacementNamed("splash");
            // },
            onPressed: () => _onTapLogoutButton(
                  () {
                context.goNamed("splash");
              },
            ),
          ),
        ],
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
                      onPressed: () {
                        context.pushNamed("tab1Detail");
                      },
                      child: const Text('タブ1の詳細へ遷移する'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapLogoutButton(void Function() onSuccess) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLogin');
    onSuccess();
  }
}
