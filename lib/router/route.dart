import 'package:first_flutter_app/pages/form/user_form.dart';
import 'package:first_flutter_app/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

final route = GoRouter(
    initialLocation: "/",
    routes: [
        GoRoute(
            path: "/",
            builder: (context, state) => const HomePage(),
        ),
        GoRoute(
            path: "/form",
            builder: (context, state) => const UserForm(),
        ),
    ]
)
;