import 'package:auto_route/auto_route.dart';

import 'package:todo/presentation/home/home_page.dart';
import 'package:todo/presentation/signup/signup_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SignUpPage, initial: true),
  AutoRoute(page: HomePage, initial: false),
])

/// $ - it will be generated
class $ApppRouter {}
