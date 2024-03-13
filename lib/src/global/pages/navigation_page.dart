import 'package:chap_mobile/src/config/assets.dart';
import 'package:chap_mobile/src/features/clients/pages/client_page.dart';
import 'package:chap_mobile/src/features/home/pages/home_page.dart';
import 'package:chap_mobile/src/features/products/pages/product_page.dart';
import 'package:chap_mobile/src/features/sales/pages/sale_page.dart';
import 'package:chap_mobile/src/global/providers/common_providers.dart';
import 'package:chap_mobile/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class NavigationPage extends ConsumerStatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends ConsumerState<NavigationPage> {
  final List<Widget> _screens = const [
    HomePage(),
    SalePage(),
    ProductPage(),
    ClientPage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(indexNavigationBarProvider);

    return Scaffold(
      body: _screens[index],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (currentIndex) => ref
              .read(indexNavigationBarProvider.notifier)
              .state = currentIndex,
          currentIndex: index,
          backgroundColor: AppColor.backgroundWhiteColor,
          unselectedItemColor: AppColor.backgroundTextColor,
          selectedItemColor: AppColor.primaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: AppText.bottomLabelActive,
          unselectedLabelStyle: AppText.bottomLabel,
          elevation: 5,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          useLegacyColorScheme: false,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Acceuil',
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_outlined),
                activeIcon: Icon(Icons.account_balance_wallet),
                label: 'Ventes'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.inventory_2_outlined),
                activeIcon: Icon(Icons.inventory_2),
                label: 'Produits'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  IconAssets.client,
                  color: AppColor.backgroundTextColor,
                  width: 25,
                  height: 25,
                ),
                activeIcon: SvgPicture.asset(
                  IconAssets.client,
                  color: AppColor.primaryColor,
                  width: 25,
                  height: 25,
                ),
                label: 'Clients'),
          ]),
    );
  }
}
