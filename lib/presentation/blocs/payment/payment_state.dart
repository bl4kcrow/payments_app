part of 'payment_bloc.dart';

enum PaymentStatus { initial, loading, success, failure }

@immutable
class PaymentState {
  const PaymentState({
    this.amountToPay = 10.0,
    this.currency = 'USD',
    this.activeCard = false,
    this.card,
    this.paymentStatus = PaymentStatus.initial,
  });

  final double amountToPay;
  final String currency;
  final bool activeCard;
  final CustomCreditCard? card;
  final PaymentStatus paymentStatus;

  String get amountToPayString => (amountToPay * 100).floor().toString();

  PaymentState copyWith({
    double? amountToPay,
    String? currency,
    bool? activeCard,
    CustomCreditCard? card,
    PaymentStatus? paymentStatus,
  }) {
    return PaymentState(
      amountToPay: amountToPay ?? this.amountToPay,
      currency: currency ?? this.currency,
      activeCard: activeCard ?? this.activeCard,
      card: card ?? this.card,
      paymentStatus: paymentStatus ?? this.paymentStatus,
    );
  }
}
