import 'dart:convert';

class StripePaymentIntentResponse {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final AmountDetails amountDetails;
  final int amountReceived;
  final dynamic application;
  final dynamic applicationFeeAmount;
  final AutomaticPaymentMethods automaticPaymentMethods;
  final dynamic canceledAt;
  final dynamic cancellationReason;
  final String captureMethod;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final dynamic customer;
  final dynamic description;
  final dynamic excludedPaymentMethodTypes;
  final dynamic lastPaymentError;
  final dynamic latestCharge;
  final bool livemode;
  final Map<String, dynamic> metadata;
  final dynamic nextAction;
  final dynamic onBehalfOf;
  final dynamic paymentMethod;
  final PaymentMethodConfigurationDetails paymentMethodConfigurationDetails;
  final PaymentMethodOptions paymentMethodOptions;
  final List<String> paymentMethodTypes;
  final dynamic processing;
  final dynamic receiptEmail;
  final dynamic review;
  final dynamic setupFutureUsage;
  final dynamic shipping;
  final dynamic source;
  final dynamic statementDescriptor;
  final dynamic statementDescriptorSuffix;
  final String status;
  final dynamic transferData;
  final dynamic transferGroup;

  StripePaymentIntentResponse({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    required this.application,
    required this.applicationFeeAmount,
    required this.automaticPaymentMethods,
    required this.canceledAt,
    required this.cancellationReason,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    required this.customer,
    required this.description,
    required this.excludedPaymentMethodTypes,
    required this.lastPaymentError,
    required this.latestCharge,
    required this.livemode,
    required this.metadata,
    required this.nextAction,
    required this.onBehalfOf,
    required this.paymentMethod,
    required this.paymentMethodConfigurationDetails,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    required this.processing,
    required this.receiptEmail,
    required this.review,
    required this.setupFutureUsage,
    required this.shipping,
    required this.source,
    required this.statementDescriptor,
    required this.statementDescriptorSuffix,
    required this.status,
    required this.transferData,
    required this.transferGroup,
  });

  StripePaymentIntentResponse copyWith({
    String? id,
    String? object,
    int? amount,
    int? amountCapturable,
    AmountDetails? amountDetails,
    int? amountReceived,
    dynamic application,
    dynamic applicationFeeAmount,
    AutomaticPaymentMethods? automaticPaymentMethods,
    dynamic canceledAt,
    dynamic cancellationReason,
    String? captureMethod,
    String? clientSecret,
    String? confirmationMethod,
    int? created,
    String? currency,
    dynamic customer,
    dynamic description,
    dynamic excludedPaymentMethodTypes,
    dynamic lastPaymentError,
    dynamic latestCharge,
    bool? livemode,
    Map<String, dynamic>? metadata,
    dynamic nextAction,
    dynamic onBehalfOf,
    dynamic paymentMethod,
    PaymentMethodConfigurationDetails? paymentMethodConfigurationDetails,
    PaymentMethodOptions? paymentMethodOptions,
    List<String>? paymentMethodTypes,
    dynamic processing,
    dynamic receiptEmail,
    dynamic review,
    dynamic setupFutureUsage,
    dynamic shipping,
    dynamic source,
    dynamic statementDescriptor,
    dynamic statementDescriptorSuffix,
    String? status,
    dynamic transferData,
    dynamic transferGroup,
  }) => StripePaymentIntentResponse(
    id: id ?? this.id,
    object: object ?? this.object,
    amount: amount ?? this.amount,
    amountCapturable: amountCapturable ?? this.amountCapturable,
    amountDetails: amountDetails ?? this.amountDetails,
    amountReceived: amountReceived ?? this.amountReceived,
    application: application ?? this.application,
    applicationFeeAmount: applicationFeeAmount ?? this.applicationFeeAmount,
    automaticPaymentMethods:
        automaticPaymentMethods ?? this.automaticPaymentMethods,
    canceledAt: canceledAt ?? this.canceledAt,
    cancellationReason: cancellationReason ?? this.cancellationReason,
    captureMethod: captureMethod ?? this.captureMethod,
    clientSecret: clientSecret ?? this.clientSecret,
    confirmationMethod: confirmationMethod ?? this.confirmationMethod,
    created: created ?? this.created,
    currency: currency ?? this.currency,
    customer: customer ?? this.customer,
    description: description ?? this.description,
    excludedPaymentMethodTypes:
        excludedPaymentMethodTypes ?? this.excludedPaymentMethodTypes,
    lastPaymentError: lastPaymentError ?? this.lastPaymentError,
    latestCharge: latestCharge ?? this.latestCharge,
    livemode: livemode ?? this.livemode,
    metadata: metadata ?? this.metadata,
    nextAction: nextAction ?? this.nextAction,
    onBehalfOf: onBehalfOf ?? this.onBehalfOf,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    paymentMethodConfigurationDetails:
        paymentMethodConfigurationDetails ??
        this.paymentMethodConfigurationDetails,
    paymentMethodOptions: paymentMethodOptions ?? this.paymentMethodOptions,
    paymentMethodTypes: paymentMethodTypes ?? this.paymentMethodTypes,
    processing: processing ?? this.processing,
    receiptEmail: receiptEmail ?? this.receiptEmail,
    review: review ?? this.review,
    setupFutureUsage: setupFutureUsage ?? this.setupFutureUsage,
    shipping: shipping ?? this.shipping,
    source: source ?? this.source,
    statementDescriptor: statementDescriptor ?? this.statementDescriptor,
    statementDescriptorSuffix:
        statementDescriptorSuffix ?? this.statementDescriptorSuffix,
    status: status ?? this.status,
    transferData: transferData ?? this.transferData,
    transferGroup: transferGroup ?? this.transferGroup,
  );

  factory StripePaymentIntentResponse.fromJson(String str) =>
      StripePaymentIntentResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StripePaymentIntentResponse.fromMap(Map<String, dynamic> json) {
    return StripePaymentIntentResponse(
      id: json["id"],
      object: json["object"],
      amount: json["amount"],
      amountCapturable: json["amount_capturable"],
      amountDetails: AmountDetails.fromMap(json["amount_details"]),
      amountReceived: json["amount_received"],
      application: json["application"],
      applicationFeeAmount: json["application_fee_amount"],
      automaticPaymentMethods: AutomaticPaymentMethods.fromMap(
        json["automatic_payment_methods"],
      ),
      canceledAt: json["canceled_at"],
      cancellationReason: json["cancellation_reason"],
      captureMethod: json["capture_method"],
      clientSecret: json["client_secret"],
      confirmationMethod: json["confirmation_method"],
      created: json["created"],
      currency: json["currency"],
      customer: json["customer"],
      description: json["description"],
      excludedPaymentMethodTypes: json["excluded_payment_method_types"],
      lastPaymentError: json["last_payment_error"],
      latestCharge: json["latest_charge"],
      livemode: json["livemode"],
      metadata: json["metadata"],
      nextAction: json["next_action"],
      onBehalfOf: json["on_behalf_of"],
      paymentMethod: json["payment_method"],
      paymentMethodConfigurationDetails:
          PaymentMethodConfigurationDetails.fromMap(
            json["payment_method_configuration_details"],
          ),
      paymentMethodOptions: PaymentMethodOptions.fromMap(
        json["payment_method_options"],
      ),
      paymentMethodTypes: List<String>.from(
        json["payment_method_types"].map((x) => x),
      ),
      processing: json["processing"],
      receiptEmail: json["receipt_email"],
      review: json["review"],
      setupFutureUsage: json["setup_future_usage"],
      shipping: json["shipping"],
      source: json["source"],
      statementDescriptor: json["statement_descriptor"],
      statementDescriptorSuffix: json["statement_descriptor_suffix"],
      status: json["status"],
      transferData: json["transfer_data"],
      transferGroup: json["transfer_group"],
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "object": object,
    "amount": amount,
    "amount_capturable": amountCapturable,
    "amount_details": amountDetails.toMap(),
    "amount_received": amountReceived,
    "application": application,
    "application_fee_amount": applicationFeeAmount,
    "automatic_payment_methods": automaticPaymentMethods.toMap(),
    "canceled_at": canceledAt,
    "cancellation_reason": cancellationReason,
    "capture_method": captureMethod,
    "client_secret": clientSecret,
    "confirmation_method": confirmationMethod,
    "created": created,
    "currency": currency,
    "customer": customer,
    "description": description,
    "excluded_payment_method_types": excludedPaymentMethodTypes,
    "last_payment_error": lastPaymentError,
    "latest_charge": latestCharge,
    "livemode": livemode,
    "metadata": metadata,
    "next_action": nextAction,
    "on_behalf_of": onBehalfOf,
    "payment_method": paymentMethod,
    "payment_method_configuration_details": paymentMethodConfigurationDetails
        .toMap(),
    "payment_method_options": paymentMethodOptions.toMap(),
    "payment_method_types": List<dynamic>.from(
      paymentMethodTypes.map((x) => x),
    ),
    "processing": processing,
    "receipt_email": receiptEmail,
    "review": review,
    "setup_future_usage": setupFutureUsage,
    "shipping": shipping,
    "source": source,
    "statement_descriptor": statementDescriptor,
    "statement_descriptor_suffix": statementDescriptorSuffix,
    "status": status,
    "transfer_data": transferData,
    "transfer_group": transferGroup,
  };
}

class AmountDetails {
  final Map<String, dynamic> tip;

  AmountDetails({required this.tip});

  AmountDetails copyWith({Map<String, dynamic>? tip}) =>
      AmountDetails(tip: tip ?? this.tip);

  factory AmountDetails.fromJson(String str) =>
      AmountDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AmountDetails.fromMap(Map<String, dynamic> json) =>
      AmountDetails(tip: json["tip"]);

  Map<String, dynamic> toMap() => {"tip": tip};
}

class AutomaticPaymentMethods {
  final String allowRedirects;
  final bool enabled;

  AutomaticPaymentMethods({
    required this.allowRedirects,
    required this.enabled,
  });

  AutomaticPaymentMethods copyWith({String? allowRedirects, bool? enabled}) =>
      AutomaticPaymentMethods(
        allowRedirects: allowRedirects ?? this.allowRedirects,
        enabled: enabled ?? this.enabled,
      );

  factory AutomaticPaymentMethods.fromJson(String str) =>
      AutomaticPaymentMethods.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AutomaticPaymentMethods.fromMap(Map<String, dynamic> json) =>
      AutomaticPaymentMethods(
        allowRedirects: json["allow_redirects"],
        enabled: json["enabled"],
      );

  Map<String, dynamic> toMap() => {
    "allow_redirects": allowRedirects,
    "enabled": enabled,
  };
}

class PaymentMethodConfigurationDetails {
  final String id;
  final dynamic parent;

  PaymentMethodConfigurationDetails({required this.id, required this.parent});

  PaymentMethodConfigurationDetails copyWith({String? id, dynamic parent}) =>
      PaymentMethodConfigurationDetails(
        id: id ?? this.id,
        parent: parent ?? this.parent,
      );

  factory PaymentMethodConfigurationDetails.fromJson(String str) =>
      PaymentMethodConfigurationDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentMethodConfigurationDetails.fromMap(
    Map<String, dynamic> json,
  ) =>
      PaymentMethodConfigurationDetails(id: json["id"], parent: json["parent"]);

  Map<String, dynamic> toMap() => {"id": id, "parent": parent};
}

class PaymentMethodOptions {
  final Card card;
  final Link link;

  PaymentMethodOptions({required this.card, required this.link});

  PaymentMethodOptions copyWith({Card? card, Link? link}) =>
      PaymentMethodOptions(card: card ?? this.card, link: link ?? this.link);

  factory PaymentMethodOptions.fromJson(String str) =>
      PaymentMethodOptions.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentMethodOptions.fromMap(Map<String, dynamic> json) =>
      PaymentMethodOptions(
        card: Card.fromMap(json["card"]),
        link: Link.fromMap(json["link"]),
      );

  Map<String, dynamic> toMap() => {"card": card.toMap(), "link": link.toMap()};
}

class Card {
  final Installments installments;
  final dynamic mandateOptions;
  final dynamic network;
  final String requestThreeDSecure;

  Card({
    required this.installments,
    required this.mandateOptions,
    required this.network,
    required this.requestThreeDSecure,
  });

  Card copyWith({
    Installments? installments,
    dynamic mandateOptions,
    dynamic network,
    String? requestThreeDSecure,
  }) => Card(
    installments: installments ?? this.installments,
    mandateOptions: mandateOptions ?? this.mandateOptions,
    network: network ?? this.network,
    requestThreeDSecure: requestThreeDSecure ?? this.requestThreeDSecure,
  );

  factory Card.fromJson(String str) => Card.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Card.fromMap(Map<String, dynamic> json) => Card(
    installments: Installments.fromMap(json["installments"]),
    mandateOptions: json["mandate_options"],
    network: json["network"],
    requestThreeDSecure: json["request_three_d_secure"],
  );

  Map<String, dynamic> toMap() => {
    "installments": installments.toMap(),
    "mandate_options": mandateOptions,
    "network": network,
    "request_three_d_secure": requestThreeDSecure,
  };
}

class Installments {
  final List<dynamic> availablePlans;
  final bool enabled;
  final dynamic plan;

  Installments({
    required this.availablePlans,
    required this.enabled,
    required this.plan,
  });

  Installments copyWith({
    List<dynamic>? availablePlans,
    bool? enabled,
    dynamic plan,
  }) => Installments(
    availablePlans: availablePlans ?? this.availablePlans,
    enabled: enabled ?? this.enabled,
    plan: plan ?? this.plan,
  );

  factory Installments.fromJson(String str) =>
      Installments.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Installments.fromMap(Map<String, dynamic> json) => Installments(
    availablePlans: List<dynamic>.from(json["available_plans"].map((x) => x)),
    enabled: json["enabled"],
    plan: json["plan"],
  );

  Map<String, dynamic> toMap() => {
    "available_plans": List<dynamic>.from(availablePlans.map((x) => x)),
    "enabled": enabled,
    "plan": plan,
  };
}

class Link {
  final dynamic persistentToken;

  Link({required this.persistentToken});

  Link copyWith({dynamic persistentToken}) =>
      Link(persistentToken: persistentToken ?? this.persistentToken);

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) =>
      Link(persistentToken: json["persistent_token"]);

  Map<String, dynamic> toMap() => {"persistent_token": persistentToken};
}
