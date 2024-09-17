import 'package:first_flutter_app/screens/fingerprint/fingerprint.dart';
import 'package:first_flutter_app/screens/form/user_form.dart';
import 'package:first_flutter_app/screens/home/home_page.dart';
import 'package:first_flutter_app/screens/json/json_screen.dart';
import 'package:go_router/go_router.dart';

final route = GoRouter(
    initialLocation: "/",
    routes: [
        GoRoute(
            path: "/",
            builder: (context, state) => const Fingerprint(),
        ),
        GoRoute(
          path: "/home",
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
            path: "/form",
            builder: (context, state) => const UserForm(),
        ),
        GoRoute(
            path: "/json/:data",
            builder: (context, state) {
                final json = state.pathParameters["data"] ?? "";
                return JsonScreen(json: json);
            },
        ),
    ]
)
;