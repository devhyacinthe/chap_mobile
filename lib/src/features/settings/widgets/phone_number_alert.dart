import 'package:chap_mobile/src/config/assets.dart';
import 'package:chap_mobile/src/global/widgets/primary_button.dart';
import 'package:chap_mobile/src/global/widgets/secondary_button.dart';
import 'package:chap_mobile/src/models/user_response.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PhoneNumberBottomSheet extends ConsumerWidget {
  final UserResponse? user;
  const PhoneNumberBottomSheet({super.key, this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        padding: AppSize.paddingSettingPage,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Image.asset(
                    ImageAssets.flag,
                    width: 40,
                    height: 25,
                  ),
                ),
                Text("Togo", style: AppText.tileSettingFilled)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text("+228 ${user!.phoneNumber!}",
                  style: AppText.bottomPhoneNumber),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                  "Enregistré le ${DateFormat.yMMMMd('fr').format(DateTime.parse(user!.createdAt!))}",
                  style: AppText.tileSettingFilled),
            ),
            _buildDivider(),
            Text(
              AppStrings.phoneNumberInfo,
              style: AppText.tileSettingFilled2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 35,
            ),
            PrimaryButton(text: "J'ai compris", onPressed: () => context.pop()),
            const SizedBox(
              height: 20,
            ),
            SecondaryButton(text: "Contacter le support", onPressed: () {})
          ],
        ));
  }

  _buildDivider() {
    return const Divider(
      color: AppColor.backgroundTextColor,
      thickness: .1,
    );
  }
}
