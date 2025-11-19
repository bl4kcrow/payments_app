part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent {}

class OnSelectCardEvent extends PaymentEvent {
  OnSelectCardEvent(this.card);

  final CustomCreditCard card;
}

class OnDeselectCardEvent extends PaymentEvent {}

class OnPayWithNewCardEvent extends PaymentEvent {
  OnPayWithNewCardEvent({
    required this.amount,
    required this.currency,
  });

  final String amount;
  final String currency;
}

class OnPayWithExistingCardEvent extends PaymentEvent {
  OnPayWithExistingCardEvent({
    required this.amount,
    required this.currency,
    required this.card,
  });

  final String amount;
  final String currency;
  final CustomCreditCard card;
}

class OnPayWithApplePayGooglePayEvent extends PaymentEvent {
  OnPayWithApplePayGooglePayEvent({
    required this.amount,
    required this.currency,
  });

  final String amount;
  final String currency;
}
class OnResetPaymentEvent extends PaymentEvent {}