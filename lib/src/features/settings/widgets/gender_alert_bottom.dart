import 'package:chap_mobile/src/features/settings/controllers/settings_controller.dart';
import 'package:chap_mobile/src/global/providers/account_common_provider.dart';
import 'package:chap_mobile/src/global/widgets/primary_button.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GenderBottomSheet extends ConsumerStatefulWidget {
  final String? phoneNumber;
  final String? gender;

  const GenderBottomSheet({super.key, this.phoneNumber, this.gender});

  @override
  ConsumerState<GenderBottomSheet> createState() => _GenderBottomSheetState();
}

class _GenderBottomSheetState extends ConsumerState<GenderBottomSheet> {
  String _value = "Masculin";
  bool isMaleTaped = true;
  bool isFemeleTaped = false;

  _selectGenderLogic() {
    if (widget.gender! == "Masculin") {
      setState(() {
        isMaleTaped = true;
        isFemeleTaped = false;
      });
    } else {
      setState(() {
        isMaleTaped = false;
        isFemeleTaped = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectGenderLogic();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      padding: AppSize.paddingSettingPage,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                    backgroundColor: AppColor.backgroundColor,
                    radius: 22,
                    child: IconButton(
                      icon: const Icon(CupertinoIcons.clear),
                      onPressed: () => context.pop(),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Sélectionner le sexe", style: AppText.appBarTitle)
              ],
            ),
            _buildDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.male, size: 30),
                const Text("Homme", style: TextStyle(fontSize: 16)),
                const SizedBox(
                  width: 200,
                ),
                IconButton(
                    icon: isMaleTaped
                        ? const Icon(Icons.check,
                            color: AppColor.primaryColor, size: 30)
                        : const Icon(Icons.check, size: 30),
                    onPressed: () {
                      setState(() {
                        _value = "Masculin";
                        isMaleTaped = true;
                        isFemeleTaped = false;
                      });
                    })
              ],
            ),
            _buildDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.female, size: 30),
                const Text("Femme", style: TextStyle(fontSize: 16)),
                const SizedBox(
                  width: 200,
                ),
                IconButton(
                    icon: isFemeleTaped
                        ? const Icon(Icons.check,
                            color: AppColor.primaryColor, size: 30)
                        : const Icon(Icons.check, size: 30),
                    onPressed: () {
                      setState(() {
                        _value = "Féminin";
                        isFemeleTaped = true;
                        isMaleTaped = false;
                      });
                    })
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(
                text: "Valider",
                onPressed: () {
                  Map<String, dynamic> updatedUserMap = {'sex': _value};

                  ref.read(settingsControllerProvider).updatedUserProfile(
                      context: context,
                      phoneNumber: widget.phoneNumber!,
                      updatedUserMap: updatedUserMap);

                  ref.read(accountGenderProvider.notifier).state = _value;
                })
          ]),
    );
  }

  _buildDivider() {
    return const Divider(
      color: AppColor.backgroundTextColor,
      thickness: .1,
    );
  }
}
