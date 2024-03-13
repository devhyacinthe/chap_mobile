import 'package:chap_mobile/src/config/assets.dart';
import 'package:chap_mobile/src/features/authentication/controllers/auth_controller.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  DateFormat dateFormat = DateFormat();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMd('fr');
  }

  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.now();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundWhiteColor,
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      appBar: AppBar(
        leadingWidth: 80,
        backgroundColor: AppColor.backgroundWhiteColor,
        elevation: 0,
        leading: CircleAvatar(
          backgroundColor: AppColor.backgroundColor,
          radius: 20,
          child: GestureDetector(
            onTap: () => context.pushNamed(AppRouteName.settings),
            child: CircleAvatar(
              backgroundColor: AppColor.backgroundWhiteColor,
              radius: 25,
              child: SvgPicture.asset(
                IconAssets.user,
                color: AppColor.backgroundTextColor,
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        foregroundColor: AppColor.backgroundTextColor,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.welcomeTitle,
              style: AppText.appBarTitle,
            ),
            Text("${dateFormat.format(dateTime)} ",
                style: AppText.appBarSubTitle)
          ],
        ),
        actions: [
          Container(
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.backgroundWhiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffeeeeee),
                      blurRadius: 5,
                    )
                  ],
                  border: Border.all(color: AppColor.backgroundWhiteColor)),
              child: IconButton(
                onPressed: () => context.pushNamed(AppRouteName.notification),
                icon: SvgPicture.asset(
                  IconAssets.barChart2,
                  color: AppColor.backgroundTextColor,
                  width: 25,
                  height: 25,
                ),
              )),
          Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.backgroundWhiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffeeeeee),
                      blurRadius: 5,
                    )
                  ],
                  border: Border.all(color: AppColor.backgroundWhiteColor)),
              child: IconButton(
                onPressed: () => context.pushNamed(AppRouteName.notification),
                icon: SvgPicture.asset(
                  IconAssets.notification,
                  color: AppColor.backgroundTextColor,
                  width: 25,
                  height: 25,
                ),
              )),
        ],
      ),
      body: const Center(child: Text('Home')),
    );
  }
}
