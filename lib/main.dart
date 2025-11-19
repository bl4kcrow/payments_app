import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:payments_app/config/constants/environment.dart';
import 'package:payments_app/config/routes/app_router.dart';
import 'package:payments_app/data/data.dart';
import 'package:payments_app/presentation/presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  Stripe.publishableKey = Environment.stripePublishableKey;
  // Stripe.merchantIdentifier = 'merchant.flutter.stripe.test';
  // Stripe.urlScheme = 'flutterstripe';
  // await Stripe.instance.applySettings();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          PaymentRepositoryImpl(paymentService: StripeService()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PaymentBloc(context.read<PaymentRepositoryImpl>()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Payments App',
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(
              actionsIconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Color(0xff284879),
              centerTitle: true,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            primaryColor: Color(0xff284879),
            scaffoldBackgroundColor: Color(0xff21232A),
          ),
        ),
      ),
    );
  }
}
