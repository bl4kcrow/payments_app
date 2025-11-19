import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  Environment._();

  static final String stripePublishableKey = dotenv.get(
    'STRIPE_PUBLISHABLE_KEY',
  );

  static final String stripeSecretKey = dotenv.get(
    'STRIPE_SECRET_KEY',
  );
}
