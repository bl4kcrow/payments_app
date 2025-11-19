import 'package:flutter/material.dart';
import 'package:payments_app/data/data.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  PaymentRepositoryImpl({required this.paymentService});

  final PaymentService paymentService;

  @override
  Future<bool> payWithApplePayGooglePay({
    required String amount,
    required String currency,
  }) async {
    try {
      final paymentResult = await paymentService.payWithApplePayGooglePay(
        amount: amount,
        currency: currency,
      );
      return paymentResult.ok;
    } catch (error) {
      debugPrint('PAYMENT error: $error');
      return false;
    }
  }

  @override
  Future<bool> payWithExistingCard({
    required String amount,
    required String currency,
    required CustomCreditCard card,
  }) async {
    try {
      final paymentResult = await paymentService.payWithExistingCard(
        amount: amount,
        currency: currency,
        card: card,
      );
      return paymentResult.ok;
    } catch (error) {
      debugPrint('PAYMENT error: $error');
      return false;
    }
  }

  @override
  Future<bool> payWithNewCard({
    required String amount,
    required String currency,
  }) async {
    try {
      final paymentResult = await paymentService.payWithNewCard(
        amount: amount,
        currency: currency,
      );
      return paymentResult.ok;
    } catch (error) {
      debugPrint('PAYMENT error: $error');
      return false;
    }
  }
}
