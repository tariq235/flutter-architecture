import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/features/auth/controllers/login_controller.dart';
import 'package:sampleflutter/features/dashboard/presentation/dashboard_view.dart';

class LoginView extends ConsumerWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            loginState.when(
              data: (isLoggedIn) {
                if (isLoggedIn) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const DashboardView()));
                  });
                }
                return ElevatedButton(
                  onPressed: () {
                    ref.read(loginControllerProvider.notifier).login(
                          _usernameController.text,
                          _passwordController.text,
                        );
                  },
                  child: const Text('Login'),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stack) => Column(
                children: [
                  Text('Error: $error'),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(loginControllerProvider.notifier).login(
                            _usernameController.text,
                            _passwordController.text,
                          );
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
