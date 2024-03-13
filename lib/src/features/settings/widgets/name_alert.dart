import 'package:chap_mobile/src/features/settings/controllers/settings_controller.dart';
import 'package:chap_mobile/src/global/providers/account_common_provider.dart';
import 'package:chap_mobile/src/global/widgets/primary_button.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class NameBottomSheet extends ConsumerStatefulWidget {
  final String? name;
  final String? label;
  final String? phoneNumber;

  const NameBottomSheet({super.key, this.name, this.label, this.phoneNumber});

  @override
  ConsumerState<NameBottomSheet> createState() => _NameBottomSheetState();
}

class _NameBottomSheetState extends ConsumerState<NameBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  _updateUserCredentialsLogic() {
    switch (widget.label!) {
      case 'Prénom*':
        Map<String, dynamic> updatedUserMap = {
          'firstName': _controller.text.trim()
        };

        _updateUser(context, updatedUserMap, widget.phoneNumber!);

        ref.read(accountFirstNameProvider.notifier).state =
            _controller.text.trim();

        break;
      case 'Nom de famille':
        Map<String, dynamic> updatedUserMap = {
          'lastName': _controller.text.trim()
        };
        _updateUser(context, updatedUserMap, widget.phoneNumber!);

        ref.read(accountLastNameProvider.notifier).state =
            _controller.text.trim();

        break;
      case 'Email':
        Map<String, dynamic> updatedUserMap = {
          'email': _controller.text.trim()
        };
        _updateUser(context, updatedUserMap, widget.phoneNumber!);

        ref.read(accountEmailProvider.notifier).state = _controller.text.trim();

        break;
      default:
        debugPrint("Une erreur s'est passé");
    }
  }

  _updateUser(
      BuildContext context, Map<String, dynamic> map, String phoneNumber) {
    ref.read(settingsControllerProvider).updatedUserProfile(
        context: context, phoneNumber: phoneNumber, updatedUserMap: map);
  }

  @override
  void initState() {
    super.initState();
    _controller.setText(widget.name!);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: _formKey,
          child: Padding(
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
                    children: [Text(widget.label!, style: AppText.appBarTitle)],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Veuillez saisir votre ${widget.label}";
                      }
                      if (value.length >= 40) {
                        return "Veuillez saisir un ${widget.label} d'au plus 40 caractères";
                      }
                      return null;
                    },
                    controller: _controller,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                        fontFamily: 'Roboto',
                        color: AppColor.backgroundTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(bottom: 10, left: 15),
                      filled: true,
                      enabled: true,
                      fillColor: AppColor.backgroundColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColor.primaryColor, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColor.primaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryButton(
                      text: "Valider",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _updateUserCredentialsLogic();
                        }
                      })
                ]),
          ),
        ),
      ),
    );
  }
}
