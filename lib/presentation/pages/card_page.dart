import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:go_router/go_router.dart';

import 'package:payments_app/config/helpers/helpers.dart';
import 'package:payments_app/presentation/presentation.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final card = BlocProvider.of<PaymentBloc>(context).state.card!;

    return BlocListener<PaymentBloc, PaymentState>(
      listenWhen: (previous, current) {
        return previous.paymentStatus != current.paymentStatus &&
            (ModalRoute.of(context)?.isCurrent ?? false);
      },
      listener: (context, state) {
        if (state.paymentStatus == PaymentStatus.failure) {
          showAlert(context, 'Payment failed', 'Please try again later');
        } else if (state.paymentStatus == PaymentStatus.success) {
          context.pushNamed('card-payment-completed-page');
        }
      },
      child: PopScope(
        onPopInvokedWithResult: (didPop, _) {
          if (didPop) {
            BlocProvider.of<PaymentBloc>(context).add(OnDeselectCardEvent());
          }
        },
        child: Scaffold(
          appBar: AppBar(title: Text('Pay')),
          body: Stack(
            children: [
              Container(),
              Hero(
                tag: card.cardNumber,
                child: CreditCardWidget(
                  cardNumber: card.cardNumber,
                  expiryDate: card.expiracyDate,
                  cardHolderName: card.cardHolderName,
                  cvvCode: card.cvv,
                  showBackView: false,
                  onCreditCardWidgetChange: (_) {},
                ),
              ),
              Positioned(bottom: 0.0, child: TotalPayButton()),
            ],
          ),
        ),
      ),
    );
  }
}
