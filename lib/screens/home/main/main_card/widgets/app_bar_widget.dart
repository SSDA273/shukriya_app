import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:unitey_app/constant/app_routes.dart';
import 'package:unitey_app/constant/constants.dart';
import 'package:unitey_app/extension/string_extension.dart';
import '../../../../../constant/api_const/app_api.dart';
import '../../../../../constant/asset_manager.dart';
import '../../../../../constant/color_manger.dart';
import '../../../../../constant/font_manager.dart';
import '../../../../../constant/style_manager.dart';
import '../../../../../core/notifier/customer/customer_profile_notifier.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../widgets/circular_indicator_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 19.0, right: 18.0, top: 10),
      child: Row(
        children: [
          Consumer<CustomerProfileNotifier>(
              builder: (context, data, _) {
                return data.isLoading == true
                    ? const Center(
                  child:  CircularIndicatorWidget(),
                )
                    :  Row(
                      children: [
                        InkWell(
                          onTap:()=>Navigator.pushNamed(context, profileRoute),
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFFFD5BAA).withOpacity(0.4),
                            radius: 18,
                          //todo:Uncomment when API integration start
                            backgroundImage: (data.getCustomerImage ?? '').isEmpty ?null:NetworkImage(
                              "${AppAPI.baseUrl}/files?key=${data.getCustomerImage}",
                            ),
                            child: (data.getCustomerImage ?? '').isEmpty ?SvgPicture.asset(
                  ImageAssets.profile,
                  height: 15.15,
                  width: 11.65,
                ): null,
                          ),
                        ),
                // child: SvgPicture.asset(
                //   ImageAssets.profile,
                //   height: 15.15,
                //   width: 11.65,
                // ),
                        // ),
                        kSizedW10,
                        RichText(
                text: TextSpan(children: [
                  TextSpan(
                          text: "${S.of(context).hello} ",
                          style: getRegularStyle(color: ColorManager.white,fontSize: FontSize.s20)),
                  TextSpan(
                        text:"${
                                  data.getCustomerProfileModel!.result!.firstName
                                      ?.capitalize()??
                                      ""
                                }!" ,
                        style: getBoldStyle(color: ColorManager.white,fontSize: FontSize.s20),
                  )
                ]),
              ),
                      ],
                    );
            }
          ),
          Spacer(),
          IconButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const InboxScreen()));
              },
              icon: Stack(
                children:  [
                  SvgPicture.asset(
                    ImageAssets.notification,
                    height: 20.71,
                    width:  20.71,
                  ),
                  Positioned(
                      right: 0,
                      child: Icon(
                        Icons.brightness_1,
                        color: ColorManager.secondary,
                        size: 7,
                      ))
                ],
              )),
        ],
      ),
    );
  }
}