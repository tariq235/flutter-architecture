import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/controller/user_controller.dart';
import 'package:sampleflutter/view/widget/header_widget.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameState = ref.watch(userControllerProvider);

    // Fetch the username when the dashboard is opened
    ref.read(userControllerProvider.notifier).fetchUsername();

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: usernameState.when(
        data: (username) => HeaderWidget(username: username),
        loading: () => const CircularProgressIndicator(),
        error: (error, stack) => Text('Error: $error'),
      ),
    );
  }
}
