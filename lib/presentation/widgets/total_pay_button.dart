import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:payments_app/presentation/presentation.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final paymentState = BlocProvider.of<PaymentBloc>(context).state;

    return Container(
      width: width,
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              Text(
                '${paymentState.amountToPay} ${paymentState.currency}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          _PayButton(),
        ],
      ),
    );
  }
}

class _PayButton extends StatelessWidget {
  Widget buildCardButton(BuildContext context) {
    final PaymentBloc paymentBloc = BlocProvider.of<PaymentBloc>(context);

    return MaterialButton(
      height: 45.0,
      minWidth: 170.0,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
          Icon(FontAwesomeIcons.solidCreditCard, color: Colors.white),
          Text(' Pay', style: TextStyle(color: Colors.white, fontSize: 22.0)),
        ],
      ),
      onPressed: () {
        paymentBloc.state.card != null
            ? paymentBloc.add(
                OnPayWithExistingCardEvent(
                  amount: paymentBloc.state.amountToPayString,
                  currency: paymentBloc.state.currency,
                  card: paymentBloc.state.card!,
                ),
              )
            : null;
      },
    );
  }

  Widget buildAppleAndGoogleButton(BuildContext context) {
    final PaymentBloc paymentBloc = BlocProvider.of<PaymentBloc>(context);

    return MaterialButton(
      height: 45.0,
      minWidth: 150.0,
      shape: StadiumBorder(),
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
          Icon(
            Platform.isAndroid
                ? FontAwesomeIcons.google
                : FontAwesomeIcons.apple,
            color: Colors.white,
          ),
          Text(' Pay', style: TextStyle(color: Colors.white, fontSize: 22.0)),
        ],
      ),
      onPressed: () {
        paymentBloc.add(
          OnPayWithApplePayGooglePayEvent(
            amount: paymentBloc.state.amountToPayString,
            currency: paymentBloc.state.currency,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<PaymentBloc>(context).state.activeCard
        ? buildCardButton(context)
        : buildAppleAndGoogleButton(context);
  }
}
