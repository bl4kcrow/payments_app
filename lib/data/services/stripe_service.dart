import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:payments_app/config/constants/environment.dart';
import 'package:payments_app/data/data.dart';

class StripeService implements PaymentService {
  final String _stripeApiUrl = 'https://api.stripe.com/v1/payment_intents';
  final Dio _dio = Dio(
    BaseOptions(
      headers: {'Authorization': 'Bearer ${Environment.stripeSecretKey}'},
      contentType: Headers.formUrlEncodedContentType,
    ),
  );

  Future<StripePaymentIntentResponse> _createPaymentIntent({
    required String amount,
    required String currency,
  }) async {
    try {
      final response = await _dio.post(
        _stripeApiUrl,
        queryParameters: {'amount': amount, 'currency': currency},
      );

      return StripePaymentIntentResponse.fromMap(response.data);
    } catch (error) {
      throw Exception('Error creating payment intent: $error');
    }
  }

  @override
  Future<StripeResponse> payWithApplePayGooglePay({
    required String amount,
    required String currency,
  }) async {
    try {
      final googlePaySupported = await Stripe.instance.isPlatformPaySupported(
        googlePay: IsGooglePaySupportedParams(),
      );

      if (googlePaySupported) {
        final paymentIntent = await _createPaymentIntent(
          amount: amount,
          currency: currency,
        );

        await Stripe.instance.confirmPlatformPayPaymentIntent(
          clientSecret: paymentIntent.clientSecret,
          confirmParams: PlatformPayConfirmParams.googlePay(
            googlePay: GooglePayParams(
              testEnv: true,
              merchantCountryCode: 'US',
              currencyCode: currency,
            ),
          ),
        );

        return StripeResponse(
          ok: true,
          message: 'Payment created successfully',
        );
      } else {
        return StripeResponse(
          ok: false,
          message: 'Google Pay is not supported on this device',
        );
      }
    } catch (error) {
      return StripeResponse(ok: false, message: error.toString());
    }
  }

  @override
  Future<StripeResponse> payWithExistingCard({
    required String amount,
    required String currency,
    required CustomCreditCard card,
  }) async {
    try {
      final mesAnio = card.expiracyDate.split('/');

      final stripeCard = CardDetails(
        number: card.cardNumber,
        expirationMonth: int.parse(mesAnio[0]),
        expirationYear: int.parse(mesAnio[1]),
        cvc: card.cvv,
      );

      await Stripe.instance.dangerouslyUpdateCardDetails(stripeCard);

      final paymentIntent = await _createPaymentIntent(
        amount: amount,
        currency: currency,
      );

      await Stripe.instance.confirmPayment(
        paymentIntentClientSecret: paymentIntent.clientSecret,
        data: PaymentMethodParams.card(paymentMethodData: PaymentMethodData()),
      );

      return StripeResponse(
        ok: true,
        message: 'Payment intent created successfully',
      );
    } catch (error) {
      return StripeResponse(ok: false, message: error.toString());
    }
  }

  @override
  Future<StripeResponse> payWithNewCard({
    required String amount,
    required String currency,
  }) async {
    try {
      final paymentIntent = await _createPaymentIntent(
        amount: amount,
        currency: currency,
      );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          customFlow: false,
          paymentIntentClientSecret: paymentIntent.clientSecret,
          merchantDisplayName: 'Payments App',
          style: ThemeMode.light,
        ),
      );

      await Stripe.instance.presentPaymentSheet();

      return StripeResponse(
        ok: true,
        message: 'Payment intent created successfully',
      );
    } catch (error) {
      return StripeResponse(ok: false, message: error.toString());
    }
  }
}
