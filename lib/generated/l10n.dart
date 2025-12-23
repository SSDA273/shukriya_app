// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Instant money transfer to your family and friends`
  String get onboarding1 {
    return Intl.message(
      'Instant money transfer to your family and friends',
      name: 'onboarding1',
      desc: '',
      args: [],
    );
  }

  /// `Pay bills sitting at home and never worry again`
  String get onboarding2 {
    return Intl.message(
      'Pay bills sitting at home and never worry again',
      name: 'onboarding2',
      desc: '',
      args: [],
    );
  }

  /// `Scan and receive money`
  String get onboarding3 {
    return Intl.message(
      'Scan and receive money',
      name: 'onboarding3',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Upload your Emirates ID`
  String get uploadEmiratesID {
    return Intl.message(
      'Upload your Emirates ID',
      name: 'uploadEmiratesID',
      desc: '',
      args: [],
    );
  }

  /// `Upload the front of your ID`
  String get uploadFrontID {
    return Intl.message(
      'Upload the front of your ID',
      name: 'uploadFrontID',
      desc: '',
      args: [],
    );
  }

  /// `Max File Size`
  String get maxFileSize {
    return Intl.message(
      'Max File Size',
      name: 'maxFileSize',
      desc: '',
      args: [],
    );
  }

  /// `Upload the back of your ID`
  String get uploadBackID {
    return Intl.message(
      'Upload the back of your ID',
      name: 'uploadBackID',
      desc: '',
      args: [],
    );
  }

  /// `Confirm `
  String get confirm {
    return Intl.message(
      'Confirm ',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Scan to upload your ID`
  String get scanToUploadID {
    return Intl.message(
      'Scan to upload your ID',
      name: 'scanToUploadID',
      desc: '',
      args: [],
    );
  }

  /// `Upload from gallery`
  String get uploadFromGallery {
    return Intl.message(
      'Upload from gallery',
      name: 'uploadFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Customer ID`
  String get customerID {
    return Intl.message(
      'Customer ID',
      name: 'customerID',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your Password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the value`
  String get plsEnterValue {
    return Intl.message(
      'Please enter the value',
      name: 'plsEnterValue',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Total Balance`
  String get totalBalance {
    return Intl.message(
      'Total Balance',
      name: 'totalBalance',
      desc: '',
      args: [],
    );
  }

  /// `Shukria Wallet`
  String get shukriaWallet {
    return Intl.message(
      'Shukria Wallet',
      name: 'shukriaWallet',
      desc: '',
      args: [],
    );
  }

  /// `Recent Transactions`
  String get recentTransaction {
    return Intl.message(
      'Recent Transactions',
      name: 'recentTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Points`
  String get points {
    return Intl.message(
      'Points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Bill Payment`
  String get billPayment {
    return Intl.message(
      'Bill Payment',
      name: 'billPayment',
      desc: '',
      args: [],
    );
  }

  /// `Send Money `
  String get sendMoney {
    return Intl.message(
      'Send Money ',
      name: 'sendMoney',
      desc: '',
      args: [],
    );
  }

  /// `Rewards Points`
  String get rewardsPoints {
    return Intl.message(
      'Rewards Points',
      name: 'rewardsPoints',
      desc: '',
      args: [],
    );
  }

  /// `Super Savings`
  String get superSavings {
    return Intl.message(
      'Super Savings',
      name: 'superSavings',
      desc: '',
      args: [],
    );
  }

  /// `Scan & Pay`
  String get scanPay {
    return Intl.message(
      'Scan & Pay',
      name: 'scanPay',
      desc: '',
      args: [],
    );
  }

  /// `Add Beneficiary`
  String get addBeneficiary {
    return Intl.message(
      'Add Beneficiary',
      name: 'addBeneficiary',
      desc: '',
      args: [],
    );
  }

  /// `Get the best money transfer rates today.`
  String get getMoneyTranxRateToday {
    return Intl.message(
      'Get the best money transfer rates today.',
      name: 'getMoneyTranxRateToday',
      desc: '',
      args: [],
    );
  }

  /// `Compare all money exchange houses & send`
  String get cfMoneyExHousesSend {
    return Intl.message(
      'Compare all money exchange houses & send',
      name: 'cfMoneyExHousesSend',
      desc: '',
      args: [],
    );
  }

  /// `TO`
  String get to {
    return Intl.message(
      'TO',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `YOU SEND`
  String get youSend {
    return Intl.message(
      'YOU SEND',
      name: 'youSend',
      desc: '',
      args: [],
    );
  }

  /// `THEY RECEIVE`
  String get theyReceive {
    return Intl.message(
      'THEY RECEIVE',
      name: 'theyReceive',
      desc: '',
      args: [],
    );
  }

  /// `Conversion Rate`
  String get conversionRate {
    return Intl.message(
      'Conversion Rate',
      name: 'conversionRate',
      desc: '',
      args: [],
    );
  }

  /// `Transfer Fee`
  String get transferFee {
    return Intl.message(
      'Transfer Fee',
      name: 'transferFee',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get change {
    return Intl.message(
      'Change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Add New`
  String get addnew {
    return Intl.message(
      'Add New',
      name: 'addnew',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get selected {
    return Intl.message(
      'Selected',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `Confirm and transfer the money`
  String get confirmTranxMoney {
    return Intl.message(
      'Confirm and transfer the money',
      name: 'confirmTranxMoney',
      desc: '',
      args: [],
    );
  }

  /// `You are transferring`
  String get youTransferring {
    return Intl.message(
      'You are transferring',
      name: 'youTransferring',
      desc: '',
      args: [],
    );
  }

  /// `receives`
  String get receives {
    return Intl.message(
      'receives',
      name: 'receives',
      desc: '',
      args: [],
    );
  }

  /// `with next 2 days`
  String get withNextDays {
    return Intl.message(
      'with next 2 days',
      name: 'withNextDays',
      desc: '',
      args: [],
    );
  }

  /// `From Account`
  String get fromAccount {
    return Intl.message(
      'From Account',
      name: 'fromAccount',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `WPS Salary card 1`
  String get wpsSalaryCard {
    return Intl.message(
      'WPS Salary card 1',
      name: 'wpsSalaryCard',
      desc: '',
      args: [],
    );
  }

  /// `Time Taken`
  String get timeTaken {
    return Intl.message(
      'Time Taken',
      name: 'timeTaken',
      desc: '',
      args: [],
    );
  }

  /// `see full details`
  String get seeDetails {
    return Intl.message(
      'see full details',
      name: 'seeDetails',
      desc: '',
      args: [],
    );
  }

  /// `Swipe to send money`
  String get swipeTosendMoney {
    return Intl.message(
      'Swipe to send money',
      name: 'swipeTosendMoney',
      desc: '',
      args: [],
    );
  }

  /// `Confirm with OTP`
  String get confirmWithOTP {
    return Intl.message(
      'Confirm with OTP',
      name: 'confirmWithOTP',
      desc: '',
      args: [],
    );
  }

  /// `We have sent a verification code to your number`
  String get sentVerifyCodeToNumber {
    return Intl.message(
      'We have sent a verification code to your number',
      name: 'sentVerifyCodeToNumber',
      desc: '',
      args: [],
    );
  }

  /// `This code will expire in`
  String get thisCodeExpire {
    return Intl.message(
      'This code will expire in',
      name: 'thisCodeExpire',
      desc: '',
      args: [],
    );
  }

  /// `Didn't received messsage?`
  String get didNotReceived {
    return Intl.message(
      'Didn\'t received messsage?',
      name: 'didNotReceived',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get resendOTP {
    return Intl.message(
      'Resend OTP',
      name: 'resendOTP',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP`
  String get invalidOTP {
    return Intl.message(
      'Invalid OTP',
      name: 'invalidOTP',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid OTP`
  String get plsEnterVaildOTP {
    return Intl.message(
      'Please enter valid OTP',
      name: 'plsEnterVaildOTP',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Amount successfully initiated to `
  String get amountSuccessInitiatedTo {
    return Intl.message(
      'Amount successfully initiated to ',
      name: 'amountSuccessInitiatedTo',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paid {
    return Intl.message(
      'Paid',
      name: 'paid',
      desc: '',
      args: [],
    );
  }

  /// `Today at`
  String get todayAt {
    return Intl.message(
      'Today at',
      name: 'todayAt',
      desc: '',
      args: [],
    );
  }

  /// `Transaction No`
  String get transactionNo {
    return Intl.message(
      'Transaction No',
      name: 'transactionNo',
      desc: '',
      args: [],
    );
  }

  /// `Share `
  String get share {
    return Intl.message(
      'Share ',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Download`
  String get download {
    return Intl.message(
      'Download',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `set reminder to send money every month`
  String get remSendMoneyMonth {
    return Intl.message(
      'set reminder to send money every month',
      name: 'remSendMoneyMonth',
      desc: '',
      args: [],
    );
  }

  /// `Go back to home`
  String get goBackToHome {
    return Intl.message(
      'Go back to home',
      name: 'goBackToHome',
      desc: '',
      args: [],
    );
  }

  /// `International Account`
  String get internationalAccount {
    return Intl.message(
      'International Account',
      name: 'internationalAccount',
      desc: '',
      args: [],
    );
  }

  /// `How do you wish to add money to your beneficiary`
  String get wishAddMoneyBeneficiary {
    return Intl.message(
      'How do you wish to add money to your beneficiary',
      name: 'wishAddMoneyBeneficiary',
      desc: '',
      args: [],
    );
  }

  /// `Bank Account`
  String get bankAccount {
    return Intl.message(
      'Bank Account',
      name: 'bankAccount',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Step 1`
  String get step1 {
    return Intl.message(
      'Step 1',
      name: 'step1',
      desc: '',
      args: [],
    );
  }

  /// `Upload Beneficiary Photo`
  String get uploadBeneficiaryPhoto {
    return Intl.message(
      'Upload Beneficiary Photo',
      name: 'uploadBeneficiaryPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Optional`
  String get optional {
    return Intl.message(
      'Optional',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Name`
  String get beneficiaryName {
    return Intl.message(
      'Beneficiary Name',
      name: 'beneficiaryName',
      desc: '',
      args: [],
    );
  }

  /// `Nick Name`
  String get nickName {
    return Intl.message(
      'Nick Name',
      name: 'nickName',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Beneficiary Name`
  String get plsBeneficiaryName {
    return Intl.message(
      'Please enter Beneficiary Name',
      name: 'plsBeneficiaryName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Nick Name`
  String get plsNickName {
    return Intl.message(
      'Please enter Nick Name',
      name: 'plsNickName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter address`
  String get plsAddress {
    return Intl.message(
      'Please enter address',
      name: 'plsAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Email`
  String get plsEmail {
    return Intl.message(
      'Please enter Email',
      name: 'plsEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Phone Number`
  String get PlsPhone {
    return Intl.message(
      'Please enter Phone Number',
      name: 'PlsPhone',
      desc: '',
      args: [],
    );
  }

  /// `Step 2`
  String get step2 {
    return Intl.message(
      'Step 2',
      name: 'step2',
      desc: '',
      args: [],
    );
  }

  /// `Bank Details`
  String get bankDetails {
    return Intl.message(
      'Bank Details',
      name: 'bankDetails',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary IBAN Number`
  String get beneficiaryIbanNumber {
    return Intl.message(
      'Beneficiary IBAN Number',
      name: 'beneficiaryIbanNumber',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Country`
  String get beneficiaryCountry {
    return Intl.message(
      'Beneficiary Country',
      name: 'beneficiaryCountry',
      desc: '',
      args: [],
    );
  }

  /// `Bank Name`
  String get bankName {
    return Intl.message(
      'Bank Name',
      name: 'bankName',
      desc: '',
      args: [],
    );
  }

  /// `Account Number`
  String get accountNumber {
    return Intl.message(
      'Account Number',
      name: 'accountNumber',
      desc: '',
      args: [],
    );
  }

  /// `Re-Enter Account Number`
  String get reEnterAccNumber {
    return Intl.message(
      'Re-Enter Account Number',
      name: 'reEnterAccNumber',
      desc: '',
      args: [],
    );
  }

  /// `IFSC Code`
  String get ifscCode {
    return Intl.message(
      'IFSC Code',
      name: 'ifscCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Beneficiary IBAN Name`
  String get plsIbanName {
    return Intl.message(
      'Please enter Beneficiary IBAN Name',
      name: 'plsIbanName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Bank Name`
  String get plsBankName {
    return Intl.message(
      'Please enter Bank Name',
      name: 'plsBankName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Account Number`
  String get plsAccountName {
    return Intl.message(
      'Please enter Account Number',
      name: 'plsAccountName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter some text`
  String get plsSomeText {
    return Intl.message(
      'Please enter some text',
      name: 'plsSomeText',
      desc: '',
      args: [],
    );
  }

  /// `Step 3`
  String get step3 {
    return Intl.message(
      'Step 3',
      name: 'step3',
      desc: '',
      args: [],
    );
  }

  /// `Verify Details`
  String get verifyDetails {
    return Intl.message(
      'Verify Details',
      name: 'verifyDetails',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Name Already Exists`
  String get nameAlreadyExists {
    return Intl.message(
      'Name Already Exists',
      name: 'nameAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Beneficiary Added Successfully`
  String get beneficiaryAddedSuccess {
    return Intl.message(
      'Beneficiary Added Successfully',
      name: 'beneficiaryAddedSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get counry {
    return Intl.message(
      'Country',
      name: 'counry',
      desc: '',
      args: [],
    );
  }

  /// `Branch Name`
  String get branchName {
    return Intl.message(
      'Branch Name',
      name: 'branchName',
      desc: '',
      args: [],
    );
  }

  /// `Go to home`
  String get goToHome {
    return Intl.message(
      'Go to home',
      name: 'goToHome',
      desc: '',
      args: [],
    );
  }

  /// `Please select a beneficiary`
  String get plsSelectBeneficiary {
    return Intl.message(
      'Please select a beneficiary',
      name: 'plsSelectBeneficiary',
      desc: '',
      args: [],
    );
  }

  /// `Explore latest exchange house rates today.`
  String get exploreExHouseRatesToday {
    return Intl.message(
      'Explore latest exchange house rates today.',
      name: 'exploreExHouseRatesToday',
      desc: '',
      args: [],
    );
  }

  /// `Showing today's top 3 best results.`
  String get showTopBestResults {
    return Intl.message(
      'Showing today\'s top 3 best results.',
      name: 'showTopBestResults',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `See all Exchange Houses`
  String get seeExchangeHouses {
    return Intl.message(
      'See all Exchange Houses',
      name: 'seeExchangeHouses',
      desc: '',
      args: [],
    );
  }

  /// `Choose Exchange House`
  String get chooseExchangeHouse {
    return Intl.message(
      'Choose Exchange House',
      name: 'chooseExchangeHouse',
      desc: '',
      args: [],
    );
  }

  /// `Showing  results`
  String get showingResults {
    return Intl.message(
      'Showing  results',
      name: 'showingResults',
      desc: '',
      args: [],
    );
  }

  /// `days`
  String get days {
    return Intl.message(
      'days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Exchange House`
  String get exchangeHouse {
    return Intl.message(
      'Exchange House',
      name: 'exchangeHouse',
      desc: '',
      args: [],
    );
  }

  /// `Transfer Time`
  String get transferTime {
    return Intl.message(
      'Transfer Time',
      name: 'transferTime',
      desc: '',
      args: [],
    );
  }

  /// `Custom Rating`
  String get customRating {
    return Intl.message(
      'Custom Rating',
      name: 'customRating',
      desc: '',
      args: [],
    );
  }

  /// `Cancel All`
  String get cancelAll {
    return Intl.message(
      'Cancel All',
      name: 'cancelAll',
      desc: '',
      args: [],
    );
  }

  /// `Apply Filter`
  String get applyFilter {
    return Intl.message(
      'Apply Filter',
      name: 'applyFilter',
      desc: '',
      args: [],
    );
  }

  /// `Pay bills & win points`
  String get payWinPoints {
    return Intl.message(
      'Pay bills & win points',
      name: 'payWinPoints',
      desc: '',
      args: [],
    );
  }

  /// `Use your wallet points to shop more`
  String get useWalletToShop {
    return Intl.message(
      'Use your wallet points to shop more',
      name: 'useWalletToShop',
      desc: '',
      args: [],
    );
  }

  /// `Invite friends & earn`
  String get inviteFriendsEarn {
    return Intl.message(
      'Invite friends & earn',
      name: 'inviteFriendsEarn',
      desc: '',
      args: [],
    );
  }

  /// `Invite your friends and earn 20 points use for further shopping.`
  String get earnPointsFutherShop {
    return Intl.message(
      'Invite your friends and earn 20 points use for further shopping.',
      name: 'earnPointsFutherShop',
      desc: '',
      args: [],
    );
  }

  /// `Copy your code`
  String get copyCode {
    return Intl.message(
      'Copy your code',
      name: 'copyCode',
      desc: '',
      args: [],
    );
  }

  /// `Invite `
  String get invite {
    return Intl.message(
      'Invite ',
      name: 'invite',
      desc: '',
      args: [],
    );
  }

  /// `Add `
  String get add {
    return Intl.message(
      'Add ',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Recharge or pay bill`
  String get rechargeOrPayBill {
    return Intl.message(
      'Recharge or pay bill',
      name: 'rechargeOrPayBill',
      desc: '',
      args: [],
    );
  }

  /// `View Total Balance`
  String get viewTotalBalance {
    return Intl.message(
      'View Total Balance',
      name: 'viewTotalBalance',
      desc: '',
      args: [],
    );
  }

  /// `View Shukria wallet`
  String get viewShukriaWallet {
    return Intl.message(
      'View Shukria wallet',
      name: 'viewShukriaWallet',
      desc: '',
      args: [],
    );
  }

  /// `Popular Billers`
  String get popularBillers {
    return Intl.message(
      'Popular Billers',
      name: 'popularBillers',
      desc: '',
      args: [],
    );
  }

  /// `History of Past bills`
  String get historyPastBills {
    return Intl.message(
      'History of Past bills',
      name: 'historyPastBills',
      desc: '',
      args: [],
    );
  }

  /// `Search Billers`
  String get searchBillers {
    return Intl.message(
      'Search Billers',
      name: 'searchBillers',
      desc: '',
      args: [],
    );
  }

  /// `Payment Categories`
  String get paymentCategories {
    return Intl.message(
      'Payment Categories',
      name: 'paymentCategories',
      desc: '',
      args: [],
    );
  }

  /// `Phone Recharge`
  String get phoneRecharge {
    return Intl.message(
      'Phone Recharge',
      name: 'phoneRecharge',
      desc: '',
      args: [],
    );
  }

  /// `Add biller`
  String get addBiller {
    return Intl.message(
      'Add biller',
      name: 'addBiller',
      desc: '',
      args: [],
    );
  }

  /// `Enter Nick Name`
  String get enterNikeName {
    return Intl.message(
      'Enter Nick Name',
      name: 'enterNikeName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter Phone Number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Select the operator`
  String get selectOperator {
    return Intl.message(
      'Select the operator',
      name: 'selectOperator',
      desc: '',
      args: [],
    );
  }

  /// `Please select the operator`
  String get plsSelectOperator {
    return Intl.message(
      'Please select the operator',
      name: 'plsSelectOperator',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get recent {
    return Intl.message(
      'Recent',
      name: 'recent',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Provider`
  String get provider {
    return Intl.message(
      'Provider',
      name: 'provider',
      desc: '',
      args: [],
    );
  }

  /// `Recharge Now`
  String get rechargeNow {
    return Intl.message(
      'Recharge Now',
      name: 'rechargeNow',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Back to Home`
  String get backTOHome {
    return Intl.message(
      'Back to Home',
      name: 'backTOHome',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Recharge`
  String get mobileRecharge {
    return Intl.message(
      'Mobile Recharge',
      name: 'mobileRecharge',
      desc: '',
      args: [],
    );
  }

  /// `Choose Recharge amount`
  String get chooseRechargeAmount {
    return Intl.message(
      'Choose Recharge amount',
      name: 'chooseRechargeAmount',
      desc: '',
      args: [],
    );
  }

  /// `Inclusive`
  String get inclusive {
    return Intl.message(
      'Inclusive',
      name: 'inclusive',
      desc: '',
      args: [],
    );
  }

  /// `Or enter another amount`
  String get enterAnotherAmount {
    return Intl.message(
      'Or enter another amount',
      name: 'enterAnotherAmount',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Details of the transaction`
  String get detailsTransaction {
    return Intl.message(
      'Details of the transaction',
      name: 'detailsTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Prepaid Recharge Details`
  String get prepaidRechargeDetails {
    return Intl.message(
      'Prepaid Recharge Details',
      name: 'prepaidRechargeDetails',
      desc: '',
      args: [],
    );
  }

  /// `Recharge`
  String get rechargeAmount {
    return Intl.message(
      'Recharge',
      name: 'rechargeAmount',
      desc: '',
      args: [],
    );
  }

  /// `Wallet Points`
  String get walletPoints {
    return Intl.message(
      'Wallet Points',
      name: 'walletPoints',
      desc: '',
      args: [],
    );
  }

  /// `Service fee`
  String get serviceFee {
    return Intl.message(
      'Service fee',
      name: 'serviceFee',
      desc: '',
      args: [],
    );
  }

  /// `Payable Amount`
  String get payableAmount {
    return Intl.message(
      'Payable Amount',
      name: 'payableAmount',
      desc: '',
      args: [],
    );
  }

  /// `Recharge Successful!`
  String get rechargeSuccess {
    return Intl.message(
      'Recharge Successful!',
      name: 'rechargeSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Reference No`
  String get referenceNo {
    return Intl.message(
      'Reference No',
      name: 'referenceNo',
      desc: '',
      args: [],
    );
  }

  /// `You have 130 points remaining.Use it in the next shopping`
  String get pointsRemineUseNextShop {
    return Intl.message(
      'You have 130 points remaining.Use it in the next shopping',
      name: 'pointsRemineUseNextShop',
      desc: '',
      args: [],
    );
  }

  /// `Download Receipt`
  String get downloadReceipt {
    return Intl.message(
      'Download Receipt',
      name: 'downloadReceipt',
      desc: '',
      args: [],
    );
  }

  /// `My Rewards`
  String get myRewards {
    return Intl.message(
      'My Rewards',
      name: 'myRewards',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Receive Money`
  String get receiveMoney {
    return Intl.message(
      'Receive Money',
      name: 'receiveMoney',
      desc: '',
      args: [],
    );
  }

  /// `Receive Money through Sender Scan`
  String get receiveThroughSenderScan {
    return Intl.message(
      'Receive Money through Sender Scan',
      name: 'receiveThroughSenderScan',
      desc: '',
      args: [],
    );
  }

  /// `Request sender to scan this QR code.`
  String get requestSenderQRScan {
    return Intl.message(
      'Request sender to scan this QR code.',
      name: 'requestSenderQRScan',
      desc: '',
      args: [],
    );
  }

  /// `Share your QR Code`
  String get shareCode {
    return Intl.message(
      'Share your QR Code',
      name: 'shareCode',
      desc: '',
      args: [],
    );
  }

  /// `Signout of your account?`
  String get signoutYourAccount {
    return Intl.message(
      'Signout of your account?',
      name: 'signoutYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `You will loose on your credentials once logged out.`
  String get youLooseCredentialsLogout {
    return Intl.message(
      'You will loose on your credentials once logged out.',
      name: 'youLooseCredentialsLogout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Signout`
  String get signout {
    return Intl.message(
      'Signout',
      name: 'signout',
      desc: '',
      args: [],
    );
  }

  /// `Touch here to Log In`
  String get touchHere {
    return Intl.message(
      'Touch here to Log In',
      name: 'touchHere',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fil'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'ml'),
      Locale.fromSubtags(languageCode: 'ne'),
      Locale.fromSubtags(languageCode: 'ta'),
      Locale.fromSubtags(languageCode: 'ur'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
