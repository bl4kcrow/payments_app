import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:go_router/go_router.dart';

import 'package:payments_app/config/helpers/helpers.dart';
import 'package:payments_app/data/data.dart';
import 'package:payments_app/presentation/presentation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final PaymentBloc paymentBloc = BlocProvider.of<PaymentBloc>(context);

    return BlocListener<PaymentBloc, PaymentState>(
      listenWhen: (previous, current) {
        return previous.paymentStatus != current.paymentStatus &&
            (ModalRoute.of(context)?.isCurrent ?? false);
      },
      listener: (context, state) {
        if (state.paymentStatus == PaymentStatus.failure) {
          showAlert(context, 'Payment failed', 'Please try again later');
        } else if (state.paymentStatus == PaymentStatus.success) {
          context.pushNamed('home-payment-completed-page');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Payment'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                final amount = paymentBloc.state.amountToPayString;
                final currency = paymentBloc.state.currency;

                paymentBloc.add(
                  OnPayWithNewCardEvent(amount: amount, currency: currency),
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              width: size.width,
              height: size.height,
              top: 200.0,
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.9),
                itemCount: tarjetas.length,
                itemBuilder: (_, index) {
                  final card = tarjetas[index];

                  return GestureDetector(
                    onTap: () {
                      BlocProvider.of<PaymentBloc>(
                        context,
                      ).add(OnSelectCardEvent(card));
                      context.pushNamed('card-page');
                    },
                    child: Hero(
                      tag: card.cardNumber,
                      child: CreditCardWidget(
                        cardNumber: card.cardNumber,
                        expiryDate: card.expiracyDate,
                        cardHolderName: card.cardHolderName,
                        cvvCode: card.cvv,
                        showBackView: false,
                        isSwipeGestureEnabled: false,
                        onCreditCardWidgetChange: (_) {},
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(bottom: 0.0, child: TotalPayButton()),
          ],
        ),
      ),
    );
  }
}
