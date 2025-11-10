part of 'app_bloc.dart';

enum AppStatus { initial, loading, success, failure }

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {

  final AppStatus appStatus;
  final Failure failure;
  final String locale;

  // final String updateAppAsset;
  // final String updateAppStoreUrl;
  // final bool isAppUpdate;

  final bool isFirstUse;
  final MyUser myUser;
  //final UserBasketEntity? userBasketEntity;
  final AuthenticationStatus authenticationStatus;

  final int basketItemCounterLimit;
  final double basketShippingFee;
  final double basketShippingNoFeeLimit;

  const AppState({
    this.appStatus = AppStatus.initial,
    this.failure = const Failure(),
    this.locale = AppConfig.defaultLocale,

    // this.updateAppAsset = '',
    // this.updateAppStoreUrl = '',
    // this.isAppUpdate = true,

    this.isFirstUse = true,
    this.myUser = MyUser.empty,
    // this.userBasketEntity,
    required this.authenticationStatus,


    this.basketItemCounterLimit = 0,
    this.basketShippingFee = 0,
    this.basketShippingNoFeeLimit = 0,
  });

  const AppState.authenticated(MyUser myUser)
      : this(authenticationStatus: AuthenticationStatus.authenticated, myUser: myUser);

  const AppState.unauthenticated() : this(authenticationStatus: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [appStatus, failure, locale, isFirstUse,
    // updateAppAsset,
    // updateAppStoreUrl,
    // isAppUpdate,
    myUser,
    //userBasketEntity,
    authenticationStatus,

    basketItemCounterLimit,
    basketShippingFee,
    basketShippingNoFeeLimit,
  ];

//<editor-fold desc="Data Methods">

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is AppState &&
              runtimeType == other.runtimeType &&
              appStatus == other.appStatus &&
              failure == other.failure &&
              locale == other.locale &&
              isFirstUse == other.isFirstUse &&
              // updateAppAsset == other.updateAppAsset &&
              // updateAppStoreUrl == other.updateAppStoreUrl &&
              // isAppUpdate == other.isAppUpdate &&
              myUser == other.myUser &&

              basketItemCounterLimit == other.basketItemCounterLimit &&
              basketShippingFee == other.basketShippingFee &&
              basketShippingNoFeeLimit == other.basketShippingNoFeeLimit &&

              //   userBasketEntity == other.userBasketEntity &&
              authenticationStatus == other.authenticationStatus);

  @override
  int get hashCode =>
      appStatus.hashCode ^
      failure.hashCode ^
      locale.hashCode ^
      isFirstUse.hashCode ^
      // updateAppAsset.hashCode ^
      // updateAppStoreUrl.hashCode ^
      // isAppUpdate.hashCode ^
      myUser.hashCode ^

      basketItemCounterLimit.hashCode ^
      basketShippingFee.hashCode ^
      basketShippingNoFeeLimit.hashCode ^
      //  userBasketEntity.hashCode ^
      authenticationStatus.hashCode;

  @override
  String toString() {
    return 'AppState{' +
        ' appStatus: $appStatus,' +
        ' failure: $failure,' +
        ' locale: $locale,' +
        ' isFirstUse: $isFirstUse,' +

        // ' updateAppAsset: $updateAppAsset,' +
        // ' updateAppStoreUrl: $updateAppStoreUrl,' +
        // ' isAppUpdate: $isAppUpdate,' +

        ' myUser: $myUser,' +

        ' basketItemCounterLimit: $basketItemCounterLimit,' +
        ' basketShippingFee: $basketShippingFee,' +
        ' basketShippingNoFeeLimit: $basketShippingNoFeeLimit,' +

        //    ' userBasketEntity: $userBasketEntity,' +
        ' authenticationStatus: $authenticationStatus,' +
        '}';
  }

  AppState copyWith({
    AppStatus? appStatus,
    Failure? failure,
    String? locale,
    bool? isFirstUse,

    // String? updateAppAsset,
    // String? updateAppStoreUrl,
    // bool? isAppUpdate,
    MyUser? myUser,


    int? basketItemCounterLimit,
    double? basketShippingFee,
    double? basketShippingNoFeeLimit,

    AuthenticationStatus? authenticationStatus,
  }) {
    return AppState(
      appStatus: appStatus ?? this.appStatus,
      failure: failure ?? this.failure,
      locale: locale ?? this.locale,
      isFirstUse: isFirstUse ?? this.isFirstUse,

      // updateAppAsset: updateAppAsset ?? this.updateAppAsset,
      // updateAppStoreUrl: updateAppStoreUrl ?? this.updateAppStoreUrl,
      // isAppUpdate: isAppUpdate ?? this.isAppUpdate,

      myUser: myUser ?? this.myUser,

      basketItemCounterLimit: basketItemCounterLimit ?? this.basketItemCounterLimit,
      basketShippingFee: basketShippingFee ?? this.basketShippingFee,
      basketShippingNoFeeLimit: basketShippingNoFeeLimit ?? this.basketShippingNoFeeLimit,
      //    userBasketEntity: userBasketEntity ?? this.userBasketEntity,
      authenticationStatus: authenticationStatus ?? this.authenticationStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'AppStatus': this.appStatus,
      'failure': this.failure,
      'locale': this.locale,
      'isFirstUse': this.isFirstUse,

      // 'updateAppAsset': this.updateAppAsset,
      // 'updateAppStoreUrl': this.updateAppStoreUrl,
      // 'isAppUpdate': this.isAppUpdate,

      'myUser': this.myUser,

      'basketItemCounterLimit': this.basketItemCounterLimit,
      'basketShippingFee': this.basketShippingFee,
      'basketShippingNoFeeLimit': this.basketShippingNoFeeLimit,
      //  'userBasketEntity': this.userBasketEntity,
      'authenticationStatus': this.authenticationStatus,
    };
  }

  factory AppState.fromMap(Map<String, dynamic> map) {
    return AppState(
      appStatus: map['AppStatus'] as AppStatus,
      failure: map['failure'] as Failure,
      locale: map['locale'] as String,
      isFirstUse: map['isFirstUse'] as bool,

      // updateAppAsset: map['updateAppAsset'] as String,
      // updateAppStoreUrl: map['updateAppStoreUrl'] as String,
      // isAppUpdate: map['isAppUpdate'] as bool,

      myUser: map['myUser'] as MyUser,

      basketItemCounterLimit: map['basketItemCounterLimit'] as int,
      basketShippingFee: map['basketShippingFee'] as double,
      basketShippingNoFeeLimit: map['basketShippingNoFeeLimit'] as double,
      // userBasketEntity: map['userBasketEntity'] as UserBasketEntity,
      authenticationStatus: map['authenticationStatus'] as AuthenticationStatus,
    );
  }

//</editor-fold>
}

