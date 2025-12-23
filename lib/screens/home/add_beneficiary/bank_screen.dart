import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/asset_manager.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/constant/font_manager.dart';
import 'package:unitey_app/constant/style_manager.dart';
import 'package:unitey_app/constant/values_manger.dart';
import 'package:unitey_app/extension/string_extension.dart';
import 'package:expandable/expandable.dart';
import 'package:unitey_app/screens/home/add_beneficiary/widgets/add_beneficiary_text_widget.dart';
import 'package:unitey_app/screens/home/widgets/custom_otp_screen.dart';
import 'package:unitey_app/widgets/circular_indicator_widget.dart';
import '../../../core/notifier/beneficiary/add_beneficiary_notifier.dart';
import '../../../core/notifier/beneficiary/upload_beneficiary_image_notifier.dart';
import '../../../core/notifier/otp_generate_notifier.dart';
import 'add_beneficiary_success.dart';

class BankScreen extends StatefulWidget {
  const BankScreen({Key? key}) : super(key: key);

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
  File? image;
  late ExpandableController step1,step2,step3;

  Future _pickImage(ImageSource source) async {
    try {
      final XFile? pickedImageFile = await ImagePicker().pickImage(
        source: source,
        imageQuality: 20,
      );
      if (pickedImageFile == null) return;
      final File imageTemporary = File(pickedImageFile.path);
      setState(() => image = imageTemporary);
      print(image!.path);
      print(image!.lengthSync() / 1024);
    } on PlatformException catch (e) {
      print("Failed to pick Image $e");
    }
  }

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nickName;
  late final TextEditingController fullName;
  late final TextEditingController bankName;
  late final TextEditingController ifscCode;
  late final TextEditingController ibanNumber;
  late final TextEditingController accountNumber;
  late final TextEditingController confirmNumber;
  late final TextEditingController bankCode;
  late final TextEditingController address;
  late final TextEditingController city;
  late final TextEditingController email;
  late final TextEditingController phoneNumber;
  late final TextEditingController beneficiaryId;
  late final TextEditingController state;
  late final TextEditingController walletId;
  late final TextEditingController walletType;
  late final TextEditingController dob;
  late final TextEditingController localLanguage;
  late final TextEditingController cardNumber;

  late final TextEditingController postCode;
  late final TextEditingController relationship;
  late final TextEditingController idType;
  late final TextEditingController identityAdditionalDetails;
  late final TextEditingController idIssuerCountry;
  late final TextEditingController idNumber;
  late final TextEditingController accountType;
  late final TextEditingController idExpiryDate;
  late final TextEditingController idIssueDate;

  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _bankNameFocusNode = FocusNode();
  final FocusNode _ifscFocusNode = FocusNode();
  final FocusNode _accountNumberFocusNode = FocusNode();
  final FocusNode _confirmNumberFocusNode = FocusNode();
  final FocusNode _countryCodeFocusNode = FocusNode();

  @override
  void initState() {
    step1 = ExpandableController(initialExpanded: true);
    step2 = ExpandableController(initialExpanded: true);
    step3 = ExpandableController(initialExpanded: true);
    nickName = TextEditingController();
    fullName = TextEditingController();
    bankName = TextEditingController();
    ifscCode = TextEditingController();
    ibanNumber = TextEditingController();
    accountNumber = TextEditingController();
    accountType = TextEditingController();
    confirmNumber = TextEditingController();
    bankCode = TextEditingController();
    address = TextEditingController();
    city = TextEditingController();
    state = TextEditingController();
    walletId = TextEditingController();
    walletType = TextEditingController();
    localLanguage = TextEditingController();
    cardNumber = TextEditingController();

    email = TextEditingController();
    phoneNumber = TextEditingController();
    dob = TextEditingController();
    beneficiaryId = TextEditingController();
    postCode = TextEditingController();
    relationship = TextEditingController();
    idType = TextEditingController();
    identityAdditionalDetails = TextEditingController();
    idIssuerCountry = TextEditingController();
    idNumber = TextEditingController();
    idExpiryDate = TextEditingController();
    idIssueDate = TextEditingController();
    stepsList = [
      CustomStep(
        title: 'Personal Info',
      ),
      CustomStep(
        title: 'Bank Details',
      ),
      CustomStep(
        title: 'Confirmation',
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    step1.dispose();
    step2.dispose();
    step3.dispose();
    nickName.dispose();
    fullName.dispose();
    bankName.dispose();
    ifscCode.dispose();
    ibanNumber.dispose();
    accountNumber.dispose();
    accountType.dispose();
    confirmNumber.dispose();
    bankCode.dispose();
    cardNumber.dispose();
    _fullNameFocusNode.dispose();
    _bankNameFocusNode.dispose();
    _accountNumberFocusNode.dispose();
    _ifscFocusNode.dispose();
    _confirmNumberFocusNode.dispose();
    _countryCodeFocusNode.dispose();
    address.dispose();
    city.dispose();
    email.dispose();
    phoneNumber.dispose();
    dob.dispose();
    postCode.dispose();
    relationship.dispose();
    idType.dispose();
    identityAdditionalDetails.dispose();
    idIssuerCountry.dispose();
    idNumber.dispose();
    idExpiryDate.dispose();
    idIssueDate.dispose();
    super.dispose();
  }


  String visible2 = "ss";
  String visible3 = "ss";
  ScrollController _scrollController = new ScrollController();
  static const double STEP_WIDTH = 87;
  PageController pageController = PageController();
  late List<CustomStep> stepsList;
  int currentPage = 0;
  bool _isVisible =false;
  bool _isLoading =false;

  SizedBox buildStepDivider(int index) {
    return SizedBox(
      height: 87.h,
      child: Container(
        alignment: Alignment.topCenter,
        child: Transform.translate(
          offset: Offset(0, 16),
          child: Container(
            color: index < currentPage
                ? Theme.of(context).primaryColor
                : Colors.grey,
            width: 70,
            height: 3,
          ),
        ),
      ),
    );
  }

  buildStep(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 87.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index <= currentPage
                    ? Theme.of(context).primaryColor
                    : ColorManager.grey1,
              ),
              padding: EdgeInsets.all(10),
              child: Text(
                (index + 1).toString(),
                style: getSemiBoldStyle(color: ColorManager.white),
              ),
            ),
            Expanded(
                child: Text(
              stepsList[index].title,
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(
                  color: index <= currentPage
                      ? ColorManager.primary
                      : ColorManager.grey1),
            ))
          ],
        ),
      ),
    );
  }

  _buildStepper(int currentStep) {
    Future.delayed(
        Duration(milliseconds: 100),
        () => _scrollController.animateTo((STEP_WIDTH * currentStep).toDouble(),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut));
    return Center(
      child: SizedBox(
        height: 87.h,
        child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: stepsList.length,
            itemBuilder: (ctx, index) => index < stepsList.length - 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      buildStep(index),
                      buildStepDivider(index)
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[buildStep(index)])),
      ),
    );
  }

  final List<String> _countries = [
    "Afghanistan",
    "Egypt",
    "India",
    "Indonesia",
    "Nepal",
    "Sri Lanka",
    "United Arab Emirates",
  ];
  String? _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    final otpGenerateNotifier =
        Provider.of<OTPGenerateNotifier>(context, listen: false);
    final addBeneficiary =
        Provider.of<AddBeneficiaryNotifier>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              bottom: 0, right: 0, child: Image.asset(ImageAssets.bg)
          ),
          Column(
            children: [
              //App Bar
              Container(
                height: MediaQuery.of(context).padding.top + 65.h,
                width: double.infinity,
                padding: EdgeInsets.only(bottom: AppPadding.p13.h),
                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close_rounded,
                          color: ColorManager.white,
                        )),
                    RichText(
                      text: TextSpan(
                          text: "Add Beneficiary\n",
                          style: getSemiBoldStyle(
                              color: ColorManager.white, fontSize: FontSize.s16),
                          children: [
                            TextSpan(
                                text: "International Account",
                                style: getRegularStyle(color: ColorManager.white))
                          ]),
                    )
                  ],
                ),
              ),
              // MyWidget(),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        //Todo: Customize the widget whenever get the time
                        // _buildStepper(currentPage),
                        //Step 1
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                          child: ExpandableTheme(
                            data: ExpandableThemeData(
                                iconColor: ColorManager.primary,
                                // collapseIcon: IconData(0),
                                // hasIcon: false,
                                expandIcon:Icons.arrow_drop_down_circle,
                                animationDuration: const Duration(milliseconds: 500)
                            ),
                            child: ExpandablePanel(
                              controller: step1,
                              header:  Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(
                                  "Step 1",
                                  style: getSemiBoldStyle(
                                    color: ColorManager.primary,
                                  ),
                                ),
                              ),
                              // builder: (_,collapsed,expanded)=>Expandable(
                              //     collapsed: collapsed, expanded: expanded),
                              collapsed: Column(
                                children: [
                                  Container(
                                    height: 77.h,
                                    width: 77.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFFEF6FF),
                                        shape: BoxShape.circle,
                                        image: image != null
                                            ? DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            image!,
                                          ),
                                        )
                                            : null),
                                    child: image != null
                                        ? null
                                        : Icon(
                                      Icons.person_outline_rounded,
                                      color: ColorManager.primary,
                                    ),
                                  ),
                                  kSizedBox8,
                                  CustomTileWidget(
                                    hint: "Beneficiary Name",
                                    value: fullName.text,
                                  ),
                                  kSizedBox25,
                                  CustomTileWidget(
                                    hint: "Nick Name",
                                    value: nickName.text,
                                  ),
                                ],
                              ),
                              expanded: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _pickImage(ImageSource.gallery);
                                    },
                                    child: SizedBox(
                                      height: 77.h,
                                      width: 77.w,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 77.h,
                                            width: 77.w,
                                            decoration: BoxDecoration(
                                                color: Color(0xFFFEF6FF),
                                                shape: BoxShape.circle,
                                                image: image != null
                                                    ? DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: FileImage(
                                                    image!,
                                                  ),
                                                )
                                                    : null),
                                            child: image != null
                                                ? null
                                                : Icon(
                                              Icons.person_outline_rounded,
                                              color: ColorManager.primary,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 3.h,
                                            right: 3.w,
                                            child: Container(
                                              height: 22.h,
                                              width: 22.w,
                                              decoration: BoxDecoration(
                                                  color: ColorManager.secondary,
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                Icons.add,
                                                color: ColorManager.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  kSizedBox10,
                                  RichText(
                                      text: TextSpan(
                                          text: "Upload Beneficiary Photo ",
                                          style: getSemiBoldStyle(
                                              color: ColorManager.black,
                                              fontSize: FontSize.s14),
                                          children: [
                                            TextSpan(
                                                text: "(Optional)",
                                                style: getRegularStyle(
                                                    color: ColorManager.black))
                                          ])),
                                  kSizedBox24,
                                  AddBeneficiaryTextWidget(
                                      controller: fullName,
                                    labelText: "Beneficiary Name",
                                  ),
                                  AddBeneficiaryTextWidget(
                                    controller: nickName,
                                    labelText: "Nick Name",
                                  ),
                                  AddBeneficiaryTextWidget(
                                    controller: address,
                                    labelText: "Address",
                                    minLine: 3,
                                    maxLine: 8,
                                    inputType: TextInputType.multiline,
                                  ),
                                  AddBeneficiaryTextWidget(
                                    controller: email,
                                    labelText: "Email",
                                    inputType: TextInputType.emailAddress,
                                  ),
                                  AddBeneficiaryTextWidget(
                                    controller: phoneNumber,
                                    labelText: "Phone Number",
                                    inputType: TextInputType.number,
                                  ),

                                 ],
                              ),

                            ),
                          ),
                        ),
                        //Step 2
                        Visibility(
                          visible: visible2 == "step2",
                          child: Container(
                            margin: EdgeInsets.only(top: AppMargin.m14),
                            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16,vertical: AppPadding.p20),
                            decoration: BoxDecoration(
                              color: ColorManager.white,
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),                          border: Border.all(color: ColorManager.grey5),
                              boxShadow:const  [
                                BoxShadow(
                                  color: Color.fromRGBO(173, 173, 173, 0.25),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: Offset(0,-6)
                                )
                              ]
                            ),
                            child: ExpandableTheme(
                              data: ExpandableThemeData(
                                  iconColor: ColorManager.primary,
                                  // collapseIcon: IconData(0),
                                  // hasIcon: false,
                                  expandIcon:Icons.arrow_drop_down_circle,
                                  animationDuration: const Duration(milliseconds: 500)
                              ),
                              child: ExpandablePanel(
                                controller: step2,
                                header:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Step 2",
                                      style: getSemiBoldStyle(
                                        color: ColorManager.primary,
                                      ),
                                    ),
                                    Text(
                                      "Bank Details",
                                      style: getSemiBoldStyle(
                                        color: ColorManager.black3,
                                        fontSize: FontSize.s16
                                      ),
                                    ),
                                  ],
                                ),
                                collapsed: Column(
                                  children: [
                                    kSizedBox18,
                                    CustomTileWidget(
                                      hint: "Beneficiary IBAN Number",
                                      value: ibanNumber.text.replaceAll(RegExp(r'.(?=.{4})'), '*'),
                                    ),
                                    kSizedBox25,
                                    CustomTileWidget(
                                      hint: "Beneficiary country",
                                      value: _currentSelectedValue??'',
                                    ),
                                  ],
                                ),
                                expanded: Column(
                                  children: [
                                    kSizedBox10,
                                    AddBeneficiaryTextWidget(
                                      controller: ibanNumber,
                                      labelText: "Beneficiary IBAN Number",
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: AppPadding.p16),
                                      child: FormField<String>(
                                        builder: (FormFieldState<String> state) {
                                          return InputDecorator(

                                            decoration: InputDecoration(
                                              labelText: "Beneficiary Country",
                                                labelStyle: getRegularStyle(color: ColorManager.black3),
                                                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                                hintText: _currentSelectedValue??'Beneficiary Country',
                                                hintStyle: getRegularStyle(color: ColorManager.black3),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                                  borderSide: BorderSide(color: ColorManager.grey5),
                                                ),
                                              floatingLabelStyle: getSemiBoldStyle(color: ColorManager.primary),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                                                  borderSide: BorderSide(color: ColorManager.grey5),
                                                ),),
                                                // border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
                                            isEmpty: _currentSelectedValue ==  null,

                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(

style: getSemiBoldStyle(color: ColorManager.black),
                                                value: _currentSelectedValue,
                                                isDense: true,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    _currentSelectedValue = newValue??'';
                                                    state.didChange(newValue);
                                                  });
                                                },
                                                items: _countries.map((String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value,
                                                    style: getSemiBoldStyle(color: ColorManager.black),),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    AddBeneficiaryTextWidget(
                                      controller: bankName,
                                      labelText: "Bank Name",
                                    ),
                                    AddBeneficiaryTextWidget(
                                      controller: accountNumber,
                                      labelText: "Account Number",
                                      inputType: TextInputType.number,
                                    ),
                                    AddBeneficiaryTextWidget(
                                      controller: confirmNumber,
                                      labelText: "Re- Enter Account Number",
                                      inputType: TextInputType.number,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        } else if (value != accountNumber.text) {
                                          return 'Account Number must be same as above';
                                        }
                                      },
                                    ),
                                    //Todo: only show when we select country india
                                    _currentSelectedValue=="India"?AddBeneficiaryTextWidget(
                                      controller: ifscCode,
                                      labelText: "IFSC Code",
                                    ):SizedBox(),
                                  ],
                                ),

                              ),
                            ),
                          ),
                        ),
                        //Step 3
                        Visibility(
                          visible: visible3 == "step3",
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: AppPadding.p20),
                            decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),                          border: Border.all(color: ColorManager.grey5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(173, 173, 173, 0.25),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0,-6)
                                  )
                                ]
                            ),
                            child: ExpandableTheme(
                              data: ExpandableThemeData(

                                  iconColor: ColorManager.primary,
                                  // collapseIcon: IconData(0),
                                  iconPadding: EdgeInsets.only(right: AppPadding.p22.w),
                                  // hasIcon: false,
                                  expandIcon:Icons.arrow_drop_down_circle,
                                  animationDuration: const Duration(milliseconds: 500)
                              ),
                              child: ExpandablePanel(
                                controller: step3,
                                header:  Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Step 3",
                                        style: getSemiBoldStyle(
                                          color: ColorManager.primary,
                                        ),
                                      ),
                                      Text(
                                        "Verify Details",
                                        style: getSemiBoldStyle(
                                            color: ColorManager.black3,
                                            fontSize: FontSize.s16
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                collapsed:SizedBox(),
                                expanded: Container(
                                  margin: EdgeInsets.symmetric(vertical: AppMargin.m20,horizontal: AppMargin.m16),
                                  padding: EdgeInsets.symmetric(vertical: AppPadding.p20,horizontal: AppPadding.p12),
                                  decoration: BoxDecoration(
                                      color: ColorManager.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromRGBO(173, 173, 173, 0.25),
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            offset: Offset(5,-5)
                                        ),
                                        BoxShadow(
                                            color: Color.fromRGBO(173, 173, 173, 0.25),
                                            spreadRadius: 2,
                                            blurRadius: 10,
                                            offset: Offset(-5,5)
                                        ),
                                      ]
                                  ),
                                  child: Column(
                                    children: [
                                      VerifyTileWidget(
                                        hint: "Name",
                                        value: fullName.text,
                                      ),
                                      VerifyTileWidget(
                                        hint: "Nick Name",
                                        value: nickName.text,
                                      ),
                                      VerifyTileWidget(
                                        hint: "Phone Number",
                                        value: phoneNumber.text
                                            .maskNumber(phoneNumber.text.length),
                                      ),
                                      VerifyTileWidget(
                                        hint: "Email",
                                        value: email.text,
                                      ),
                                      VerifyTileWidget(
                                        hint: "Address",
                                        value: address.text,
                                      ),
                                      VerifyTileWidget(
                                        hint: "Bank Name",
                                        value: bankName.text,
                                      ),
                                      _currentSelectedValue=="India"?VerifyTileWidget(
                                        hint:"IFSC Code" ,
                                        value:ifscCode.text.toUpperCase(),
                                      ):SizedBox(),
                                      Container(
                                        // height:46.h,
                                        margin:
                                        EdgeInsets.only(bottom: AppMargin.m16,),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: AppPadding.p10, vertical: AppPadding.p15),
                                        decoration: BoxDecoration(
                                            border: Border.all(color: ColorManager.grey5),
                                            borderRadius: BorderRadius.circular(4)),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Account Number",
                                                  style: getRegularStyle(color: ColorManager.black3),
                                                ),
                                                kSizedW5,
                                                InkWell(
                                                    onTap:(){
                                                      setState(() {
                                                        _isVisible=!_isVisible;
                                                      });
                                                    }, child: Icon(_isVisible?Icons.visibility_outlined:Icons.visibility_off_outlined,
                                                size: 18,))
                                              ],
                                            ),
                                            SizedBox(
                                              width: 100.w,
                                              child: Text(
                                                _isVisible?accountNumber.text:accountNumber.text
                                                    .replaceAll(RegExp(r'.(?=.{4})'), 'X'),
                                                textAlign: TextAlign.end,
                                                style: getSemiBoldStyle(color: ColorManager.black),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                              ),
                            ),
                          ),
                        ),

                        kSizedBox50,
                        // confirm Button

                      _isLoading?const CircularIndicatorWidget():GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              if(visible2!="step2"){
                                setState(() {
                                  currentPage = 1;
                                  visible2 = "step2";
                                });
                                step1.toggle();
                              }else if(visible2 == "step2" && visible3!="step3"){
                                setState(() {
                                  currentPage = 2;
                                  visible3 = "step3";
                                });
                                step2.toggle();
                              }else{
                                if (image == null) {
                                  setState(() {
                                    _isLoading=true;
                                  });
                                  await _submitBeneficiary(addBeneficiary,
                                      "Not uploaded", otpGenerateNotifier);
                                  setState(() {
                                    _isLoading=false;
                                  });
                                } else {
                                  setState(() {
                                    _isLoading=true;
                                  });
                                  await Provider.of<UploadImageNotifier>(
                                      context,
                                      listen: false)
                                      .uploadImage(
                                      context: context,
                                      image: image!,
                                      type: "beneficiaries")
                                      .then((value) async {
                                    await _submitBeneficiary(addBeneficiary,
                                        value!.result!.key!, otpGenerateNotifier);
                                  });
                                  setState(() {
                                    _isLoading=false;
                                  });
                                }
                                setState(() {
                                  _isLoading=false;
                                });
                              }
                            }

                          },
                          child: Container(
                            height: 46.h,
                            width: 161.w,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF7B3884),
                                  Color(0xffC34BD4),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: Center(
                              child: Text("Confirm",
                                  style: getSemiBoldStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s16)),
                            ),
                          ),
                        ),
                        kSizedBox10,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _submitBeneficiary(AddBeneficiaryNotifier addBeneficiary,
      String logoKey, OTPGenerateNotifier otpGenerateNotifier) async {
    final response = await addBeneficiary.addBeneficiary(
      logo: logoKey,
      nickName: nickName.text,
      fullName: fullName.text,
      bankName: bankName.text,
      accountNumber: accountNumber.text,
      bankCode: bankCode.text,
      countryCode: "AE", //Todo: Do it later
      beneficiaryTypeId: beneficiaryId.text,
      accountType: accountType.text,
      depositMethod: "BANK",
      address: address.text,
      city: city.text,
      state: state.text,
      currencyType: "AED", //Todo : chagne it using dropdown
      postcode: postCode.text,
      dob: dob.text,
      walletId: walletId.text,
      walletType: walletType.text,
      email: email.text,
      contact: phoneNumber.text,
      identityType: idType.text,
      identityIssueCountry: idIssuerCountry.text,
      identityId: idNumber.text,
      identityAdditionalDetails: identityAdditionalDetails.text,
      identityIssue: idIssueDate.text,
      identityExpiry: idExpiryDate.text,
      cardNumber: cardNumber.text,
      relationship: relationship.text,
      localLanguage: localLanguage.text,
    );
    if (response == "Error") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          content: Text("Something went wrong")));
    } else if (response == "Name") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          content: Text("Name Already Exists")));
    } else {
      await otpGenerateNotifier.generateOTP(
          context: context, transactionId: response!);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomOTPScreen(
        transactionId: response,
        bgImage: ImageAssets.bg,
        nextScreen:AddBeneficiarySuccessScreen(
          accountNo:accountNumber.text,
          name: fullName.text,
          bankName: bankName.text,
          country: _currentSelectedValue??"UAE",
          ibanNo:ibanNumber.text,
          ifscCode:  ifscCode.text,
        ),
      )));
    }
  }
}



class CustomTileWidget extends StatelessWidget {
  const CustomTileWidget({
    Key? key,
    required this.hint,
    required this.value,
  }) : super(key: key);
final String hint,value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppPadding.p14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hint,
            style: getSemiBoldStyle(
              color: ColorManager.primary,
            ),),
          Text(value,
            style: getSemiBoldStyle(
              color: ColorManager.black,
            ),),
        ],
      ),
    );
  }
}

class VerifyTileWidget extends StatelessWidget {
  const VerifyTileWidget({
    required this.hint,
    this.value,
    Key? key,
  }) : super(key: key);
  final String hint;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height:46.h,
      margin:
          EdgeInsets.only(bottom: AppMargin.m16,),
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p10, vertical: AppPadding.p15),
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.grey5),
          borderRadius: BorderRadius.circular(4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: getRegularStyle(color: ColorManager.black3),
          ),
          SizedBox(
            width: 100.w,
            child: Text(
              value ?? "not given",
              textAlign: TextAlign.end,
              style: getSemiBoldStyle(color: ColorManager.black),
            ),
          )
        ],
      ),
    );
  }
}

class CustomStep {
  final String title;
  CustomStep({required this.title});
}





// ExpansionTile(
//   initiallyExpanded: step1,
//   backgroundColor: Colors.transparent,
//   collapsedBackgroundColor: Colors.transparent,
//   collapsedIconColor: Colors.transparent,
//   trailing: SvgPicture.asset(ImageAssets.downArrowIc),
//   title: Text(
//     "Step 1",
//     style: getSemiBoldStyle(
//       color: ColorManager.primary,
//     ),
//   ),
//   children: [
//     InkWell(
//       onTap: () {
//         _pickImage(ImageSource.gallery);
//       },
//       child: SizedBox(
//         height: 77.h,
//         width: 77.w,
//         child: Stack(
//           children: [
//             Container(
//               height: 77.h,
//               width: 77.w,
//               decoration: BoxDecoration(
//                   color: Color(0xFFFEF6FF),
//                   shape: BoxShape.circle,
//                   image: image != null
//                       ? DecorationImage(
//                           fit: BoxFit.cover,
//                           image: FileImage(
//                             image!,
//                           ),
//                         )
//                       : null),
//               child: image != null
//                   ? null
//                   : Icon(
//                       Icons.person_outline_rounded,
//                       color: ColorManager.primary,
//                     ),
//             ),
//             Positioned(
//               bottom: 3.h,
//               right: 3.w,
//               child: Container(
//                 height: 22.h,
//                 width: 22.w,
//                 decoration: BoxDecoration(
//                     color: ColorManager.secondary,
//                     shape: BoxShape.circle),
//                 child: Icon(
//                   Icons.add,
//                   color: ColorManager.white,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//     kSizedBox10,
//     RichText(
//         text: TextSpan(
//             text: "Upload Beneficiary Photo ",
//             style: getSemiBoldStyle(
//                 color: ColorManager.black,
//                 fontSize: FontSize.s14),
//             children: [
//           TextSpan(
//               text: "(Optional)",
//               style: getRegularStyle(
//                   color: ColorManager.black))
//         ])),
//     kSizedBox24,
//     Padding(
//       padding: const EdgeInsets.fromLTRB(AppPadding.p16, 0,
//           AppPadding.p16, AppPadding.p16),
//       child: TextFormField(
//         style: getSemiBoldStyle(color: ColorManager.black),
//         controller: fullName,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter the  value';
//           }
//         },
//         decoration: InputDecoration(
//             labelText: "Beneficiary name",
//             labelStyle: getRegularStyle(
//                 color: ColorManager.black3)),
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.fromLTRB(AppPadding.p16, 0,
//           AppPadding.p16, AppPadding.p16),
//       child: TextFormField(
//         controller: nickName,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter the  value';
//           }
//         },
//         style: getSemiBoldStyle(color: ColorManager.black),
//         decoration: InputDecoration(
//             labelText: "Nick name",
//             labelStyle: getRegularStyle(
//                 color: ColorManager.black3)),
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.fromLTRB(AppPadding.p16, 0,
//           AppPadding.p16, AppPadding.p16),
//       child: TextFormField(
//         controller: address,
//         minLines: 3,
//         maxLines: 8,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter the  value';
//           }
//         },
//         style: getSemiBoldStyle(color: ColorManager.black),
//         decoration: InputDecoration(
//           alignLabelWithHint: true,
//           labelText: "Address",
//           labelStyle:
//               getRegularStyle(color: ColorManager.black3),
//         ),
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.fromLTRB(AppPadding.p16, 0,
//           AppPadding.p16, AppPadding.p16),
//       child: TextFormField(
//         controller: email,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter the  value';
//           }
//         },
//         style: getSemiBoldStyle(color: ColorManager.black),
//         decoration: InputDecoration(
//             labelText: "Email",
//             labelStyle: getRegularStyle(
//                 color: ColorManager.black3)),
//       ),
//     ),
//     Padding(
//       padding: const EdgeInsets.fromLTRB(AppPadding.p16, 0,
//           AppPadding.p16, AppPadding.p16),
//       child: TextFormField(
//         controller: contactNumber,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter the  value';
//           }
//         },
//         style: getSemiBoldStyle(color: ColorManager.black),
//         decoration: InputDecoration(
//             labelText: "Phone number",
//             labelStyle: getRegularStyle(
//                 color: ColorManager.black3)),
//       ),
//     ),
//   ],
// ),
// Step 2

// Visibility(
// visible: visible2 == "step2",
// child: ExpansionTile(
// initiallyExpanded: step2,
// backgroundColor: Colors.transparent,
// collapsedBackgroundColor: Colors.transparent,
// trailing: SvgPicture.asset(ImageAssets.downArrowIc),
// title: Text(
// "Step 2",
// style: getSemiBoldStyle(
// color: ColorManager.primary,
// ),
// ),
// subtitle: Text(
// "Bank Details",
// style: getSemiBoldStyle(
// color: ColorManager.black3,
// fontSize: FontSize.s16),
// ),
// children: [
// Padding(
// padding: const EdgeInsets.fromLTRB(AppPadding.p16,
// 0, AppPadding.p16, AppPadding.p16),
// child: TextFormField(
// controller: ibanNumber,
// style:
// getSemiBoldStyle(color: ColorManager.black),
// decoration: InputDecoration(
// labelText: "Beneficiary IBAN Number",
// labelStyle: getRegularStyle(
// color: ColorManager.black3)),
// ),
// ),
// // Padding(
// //   padding: const EdgeInsets.fromLTRB(AppPadding.p16, 0,AppPadding.p16, AppPadding.p16),
// //   child: TextFormField(
// //     decoration: InputDecoration(
// //         labelText: "Beneficiary Country",
// //         labelStyle: getRegularStyle(color: ColorManager.black3)
// //     ),
// //   ),
// // ),
// Padding(
// padding: const EdgeInsets.fromLTRB(AppPadding.p16,
// 0, AppPadding.p16, AppPadding.p16),
// child: TextFormField(
// controller: bankName,
// style:
// getSemiBoldStyle(color: ColorManager.black),
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter the  value';
// }
// },
// decoration: InputDecoration(
// labelText: "Bank Name",
// labelStyle: getRegularStyle(
// color: ColorManager.black3)),
// ),
// ),
// Padding(
// padding: const EdgeInsets.fromLTRB(AppPadding.p16,
// 0, AppPadding.p16, AppPadding.p16),
// child: TextFormField(
// controller: accountNumber,
// style:
// getSemiBoldStyle(color: ColorManager.black),
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter the  value';
// }
// },
// decoration: InputDecoration(
// labelText: "Account Number",
// labelStyle: getRegularStyle(
// color: ColorManager.black3)),
// ),
// ),
// Padding(
// padding: const EdgeInsets.fromLTRB(AppPadding.p16,
// 0, AppPadding.p16, AppPadding.p16),
// child: TextFormField(
// controller: confirmNumber,
// style:
// getSemiBoldStyle(color: ColorManager.black),
// validator: (value) {
// if (value == null || value.isEmpty) {
// return 'Please enter some text';
// } else if (value != accountNumber.text) {
// return 'Account Number must be same as above';
// }
// },
// decoration: InputDecoration(
// labelText: "Re- Enter  Account Number",
// labelStyle: getRegularStyle(
// color: ColorManager.black3)),
// ),
// ),
// //Todo: only show when we select country india
// // Padding(
// //   padding: const EdgeInsets.fromLTRB(AppPadding.p16, 0,AppPadding.p16, AppPadding.p16),
// //   child: TextFormField(
// //     decoration: InputDecoration(
// //         labelText: "IFSC Code",
// //         labelStyle: getRegularStyle(color: ColorManager.black3)
// //     ),
// //   ),
// // ),
// ],
// ),
// ),



// Step 3
// Visibility(
//   visible: visible3 == "step3",
//   child: ExpansionTile(
//     initiallyExpanded: step3,
//     backgroundColor: Colors.transparent,
//     collapsedBackgroundColor: Colors.transparent,
//     trailing: SvgPicture.asset(ImageAssets.downArrowIc),
//     title: Text(
//       "Step 3",
//       style: getSemiBoldStyle(
//         color: ColorManager.primary,
//       ),
//     ),
//     subtitle: Text(
//       "Verify Details",
//       style: getSemiBoldStyle(
//           color: ColorManager.black3,
//           fontSize: FontSize.s16),
//     ),
//     children: [
//       VerifyTileWidget(
//         hint: "Name",
//         value: fullName.text,
//       ),
//       VerifyTileWidget(
//         hint: "Nick Name",
//         value: nickName.text,
//       ),
//       VerifyTileWidget(
//         hint: "Phone Number",
//         value: contactNumber.text
//             .maskNumber(contactNumber.text.length),
//       ),
//       VerifyTileWidget(
//         hint: "Email",
//         value: email.text,
//       ),
//       VerifyTileWidget(
//         hint: "Address",
//         value: address.text,
//       ),
//       VerifyTileWidget(
//         hint: "Bank Name",
//         value: bankName.text,
//       ),
//       VerifyTileWidget(
//         hint: "Account Number",
//         value: accountNumber.text
//             .replaceAll(RegExp(r'.(?=.{4})'), 'X'),
//       ),
//     ],
//   ),
// ),