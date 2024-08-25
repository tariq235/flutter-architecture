import 'package:sampleflutter/features/auth/presentation/login_view.dart';
import 'package:sampleflutter/features/dashboard/presentation/dashboard_view.dart';

class Routes {
  static const String login = '/login';
  static const String dashboard = '/dashboard';

  static final routes = {
    login: (context) => LoginView(),
    dashboard: (context) => const DashboardView(),
  };
}
