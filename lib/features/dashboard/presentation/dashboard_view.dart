import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleflutter/core/utils/date_utils.dart';
import 'package:sampleflutter/features/dashboard/controllers/user_controller.dart';
import 'package:sampleflutter/features/dashboard/presentation/header_widget.dart';

class DashboardView extends ConsumerWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameState = ref.watch(userControllerProvider);
    final DateTime lastLogin = DateTime.now();
    final formattedDate = DateUtilities.formatDate(lastLogin);
    print(formattedDate);

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
