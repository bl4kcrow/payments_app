import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import 'package:payments_app/presentation/presentation.dart';

class PaymentCompletePage extends StatelessWidget {
  const PaymentCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('PaymentCompletedPage build');
    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          BlocProvider.of<PaymentBloc>(context).add(OnResetPaymentEvent());
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Payment completed')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.star, color: Colors.white54, size: 100.0),
              Gap(20.0),
              Text(
                'Payment made successfully',
                style: TextStyle(color: Colors.white, fontSize: 22.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
