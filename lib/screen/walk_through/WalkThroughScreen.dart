import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WalkThroughScreen extends ConsumerWidget {
  const WalkThroughScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: null,
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
                    const Text('ウォークスルー画面です\nアプリの説明を書いてます'),
                    const SizedBox(height: 80),
                    TextButton(
                      onPressed: () {
                        context.pushReplacementNamed("login");
                      },
                      child: const Text('ログインへ遷移する'),
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
}
