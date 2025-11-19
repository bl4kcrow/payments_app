import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:payments_app/data/data.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepository paymentRepository;

  PaymentBloc(this.paymentRepository) : super(PaymentState()) {
    on<OnResetPaymentEvent>((event, emit) {
      emit(state.copyWith(paymentStatus: PaymentStatus.initial));
    });
    on<OnSelectCardEvent>((event, emit) {
      emit(
        state.copyWith(
          activeCard: true,
          card: event.card,
          paymentStatus: PaymentStatus.initial,
        ),
      );
    });
    on<OnDeselectCardEvent>((event, emit) {
      emit(
        state.copyWith(activeCard: false, paymentStatus: PaymentStatus.initial),
      );
    });
    on<OnPayWithNewCardEvent>((event, emit) async {
      emit(state.copyWith(paymentStatus: PaymentStatus.initial));

      final paymentResult = await paymentRepository.payWithNewCard(
        amount: event.amount,
        currency: event.currency,
      );

      emit(
        state.copyWith(
          paymentStatus: paymentResult
              ? PaymentStatus.success
              : PaymentStatus.failure,
        ),
      );
    });
    on<OnPayWithExistingCardEvent>((event, emit) async {
      emit(state.copyWith(paymentStatus: PaymentStatus.initial));

      final paymentResult = await paymentRepository.payWithExistingCard(
        amount: event.amount,
        currency: event.currency,
        card: event.card,
      );

      emit(
        state.copyWith(
          paymentStatus: paymentResult
              ? PaymentStatus.success
              : PaymentStatus.failure,
        ),
      );
    });
    on<OnPayWithApplePayGooglePayEvent>((event, emit) async {
      emit(state.copyWith(paymentStatus: PaymentStatus.initial));

      final paymentResult = await paymentRepository.payWithApplePayGooglePay(
        amount: event.amount,
        currency: event.currency,
      );

      emit(
        state.copyWith(
          paymentStatus: paymentResult
              ? PaymentStatus.success
              : PaymentStatus.failure,
        ),
      );
    });
  }
}
