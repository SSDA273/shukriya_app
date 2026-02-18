import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/core/notifier/account_details_notifier.dart';
import 'package:unitey_app/core/notifier/beneficiary/beneficiary_list_notifier.dart';
import 'package:unitey_app/core/notifier/bill/bill_list_notifier.dart';
import 'package:unitey_app/core/notifier/bill/popular_bills_notifier.dart';
import 'package:unitey_app/core/notifier/billers/billers_list_notifier.dart';
import 'package:unitey_app/core/notifier/customer/customer_profile_notifier.dart';
import 'package:unitey_app/core/notifier/entity_info_notifier.dart';
import 'package:unitey_app/core/notifier/remittance/currency_list_notifier.dart';
import 'package:unitey_app/core/notifier/remittance/exchange_house_list_provider.dart';
import 'package:unitey_app/core/services/cache_services.dart';
import 'package:unitey_app/models/push_notification_model/push_notification_model.dart';
import 'package:unitey_app/screens/home/home_screen.dart';
import 'package:unitey_app/screens/send_money/send_money_screen.dart';
import 'package:unitey_app/screens/widgets/push_notification_widget.dart';
import 'package:unitey_app/screens/widgets/tab_bar_widget.dart';
import 'receive_money/receive_money_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
//Firebase messaging
  late final FirebaseMessaging _messaging;
  late int _totalNotificationCounter;
  PushNotificationModel? _pushNotificationModel;

  // Loading state for initial data
  bool _isInitialLoading = true;

  //Here we have three state in notification
  //not determine(null), granted(true) and decline(false)

  //    Firebase message on Foreground
  void registerNotification() async {
    // await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    NotificationSettings _settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (_settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted the permission");

      FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
        PushNotificationModel notificationModel = PushNotificationModel(
            title: remoteMessage.notification?.title ?? '',
            body: remoteMessage.notification?.body ?? '',
            dataTitle: remoteMessage.data['title'],
            dataBody: remoteMessage.data['body']);

        setState(() {
          _totalNotificationCounter++;
          _pushNotificationModel = notificationModel;
        });

        if (notificationModel != null) {
          showOverlayNotification((context) {
            return PushNotificationCustomWidget(
              title: _pushNotificationModel?.title ?? '',
              body: _pushNotificationModel?.body ?? '',
              leading: Image.asset("assets/images/al_razouki_logo.png"),
              onReplay: () {
                OverlaySupportEntry.of(context)
                    ?.dismiss(); //use OverlaySupportEntry to dismiss overlay
                toast('you checked this message');
              },
            );
          },
          duration: Duration(seconds: 5));

          // //Second Approach
          // showSimpleNotification(
          //   Text(_pushNotificationModel!.title!),
          //   leading: Image.asset("assets/images/shukria.png"),
          //   subtitle: Text(_pushNotificationModel!.body!),
          //   background: ColorManager.secondaryDark,
          //   duration: Duration(seconds: 10),
          //   contentPadding: EdgeInsets.symmetric(
          //       vertical: AppPadding.p24, horizontal: AppPadding.p24),
          // );
        }
      });
    } else {
      print("permission declined user");
    }
  }

//Firebase message on terminated app
//   checkForInitialMessage() async {
//     await Firebase.initializeApp();
//     RemoteMessage? initialMessage =
//         await FirebaseMessaging.instance.getInitialMessage();
//     if (initialMessage != null) {
//       PushNotificationModel notificationModel = PushNotificationModel(
//           title: initialMessage.notification!.title,
//           body: initialMessage.notification!.body,
//           dataTitle: initialMessage.data['title'],
//           dataBody: initialMessage.data['body']);
//
//       setState(() {
//         _totalNotificationCounter++;
//         _pushNotificationModel = notificationModel;
//       });
//     }
//   }

  int index = 0;

  @override
  void initState() {
    _totalNotificationCounter = 0; // Initialize the counter
    
    //to get firebase token
    FirebaseMessaging.instance.getToken().then((value) {
      print("Firebase token is : $value");
    });

    //    Firebase message on background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotificationModel notificationModel = PushNotificationModel(
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
          dataTitle: message.data['title'],
          dataBody: message.data['body']);

      setState(() {
        _totalNotificationCounter++;
        _pushNotificationModel = notificationModel;
      });
    });
    //Firebase message on app use
    registerNotification();
    //Firebase message on terminated stage
    // checkForInitialMessage();
    _totalNotificationCounter = 0;
    // scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    super.initState();
  }

  _asyncMethod() async {
    // Use try-catch for each API call to prevent one failure from crashing the entire app
    try {
      await Provider.of<CustomerProfileNotifier>(context, listen: false)
          .getCustomerDetails(context: context);
    } catch (e) {
      print("Error loading customer profile: $e");
    }

    try {
      await Provider.of<AccountDetailsNotifier>(context, listen: false)
          .getAccountDetails(context: context);
    } catch (e) {
      print("Error loading account details: $e");
    }

    try {
      await Provider.of<CurrencyListNotifier>(context, listen: false)
          .getCurrencyList(context: context);
    } catch (e) {
      print("Error loading currency list: $e");
    }

    try {
      await Provider.of<BeneficiaryListNotifier>(context, listen: false)
          .getBeneficiaryList();
    } catch (e) {
      print("Error loading beneficiary list: $e");
    }

    try {
      await Provider.of<EntityInfoNotifier>(context, listen: false)
          .getEntityInfo(context: context);
    } catch (e) {
      print("Error loading entity info: $e");
    }

    // await Provider.of<ColorsNotifier>(context, listen: false)
    //     .getColors(context: context);

    try {
      await Provider.of<ExchangeHouseListNotifier>(context, listen: false)
          .getExchangeHouseList(
              context: context, fromCurrency: 'AED', toCurrency: 'INR');
    } catch (e) {
      print("Error loading exchange house list: $e");
    }

    try {
      await Provider.of<BillerListNotifier>(context, listen: false)
          .getBillerList(context: context);
    } catch (e) {
      print("Error loading biller list: $e");
    }

    try {
      await Provider.of<BillListNotifier>(context, listen: false)
          .getBillList(context: context);
    } catch (e) {
      print("Error loading bill list: $e");
    }

    try {
      await Provider.of<PopularBillsNotifier>(context, listen: false)
          .getPopularBills(context: context);
    } catch (e) {
      print("Error loading popular bills: $e");
    }
    
    // Set loading to false after all API calls complete (whether successful or failed)
    setState(() {
      _isInitialLoading = false;
    });
  }

  final pages = <Widget>[
    HomeScreen(),
    const ReceiveMoneyScreen(),
    const SendMoneyScreen(),
  ];

  Future<bool> showExitPopup() async {
    final CacheService cache = CacheService();
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              'Signout of your account ?',
              style: getSemiBoldStyle(
                  color: ColorManager.black3, fontSize: FontSize.s16),
            ),
            content: Text(
              'You will loose on your credentials once logged out.',
              style: getRegularStyle(
                  color: ColorManager.grey3, fontSize: FontSize.s14),
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    "Cancel",
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s16),
                  )),
              TextButton(
                  onPressed: () async {
                    await cache.deleteCache();
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "Signout",
                    style: getSemiBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s16),
                  )),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }


  @override
  Widget build(BuildContext context) {
    print(ColorManager.primary);
    return Scaffold(
      extendBody: true,
      body: _isInitialLoading 
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: ColorManager.primary),
                SizedBox(height: 16),
                Text(
                  'Loading...',
                  style: TextStyle(
                    color: ColorManager.primary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        : pages[index],
      bottomNavigationBar: _isInitialLoading 
        ? null 
        : TabBarMaterialWidget(
            index: index,
            onChangedTab: onChangedTab,
          ),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
    //It's used to scroll to top when we click the home button again
    // if(index==0 && scrollController.hasClients){
    //   scrollController.animateTo(0.0, duration:const  Duration(milliseconds: 1000), curve: Curves.easeInOutCubicEmphasized );
    // }
  }
}
