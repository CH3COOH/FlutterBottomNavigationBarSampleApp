import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
                    const CircularProgressIndicator(),
                    const Text('スプラッシュ画面です'),
                    const SizedBox(height: 80),
                    TextButton(
                      onPressed: () {
                        context.pushReplacementNamed("walkThrough");
                      },
                      child: const Text('ウォークスルーへ遷移する'),
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
