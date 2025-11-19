import 'package:go_router/go_router.dart';

import 'package:payments_app/presentation/presentation.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home-page',
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: '/payment-completed-page',
          name: 'home-payment-completed-page',
          builder: (context, state) => const PaymentCompletePage(),
        ),
        GoRoute(
          path: '/card-page',
          name: 'card-page',
          builder: (context, state) => const CardPage(),
          routes: <RouteBase>[
            GoRoute(
              path: '/payment-completed-page',
              name: 'card-payment-completed-page',
              builder: (context, state) => const PaymentCompletePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
