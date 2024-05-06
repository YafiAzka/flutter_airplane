import 'package:flutter/material.dart';
import 'package:flutter_airplane/cubit/page_cubit.dart';
import 'package:flutter_airplane/shared/theme.dart';
import 'package:flutter_airplane/ui/pages/home_page.dart';
import 'package:flutter_airplane/ui/pages/setting_page.dart';
import 'package:flutter_airplane/ui/pages/transaction_page.dart';
import 'package:flutter_airplane/ui/pages/wallet_page.dart';
import 'package:flutter_airplane/ui/widgets/custom_botnav_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingPage();
        default:
          return HomePage();
      }
    }

    Widget customButtonNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 30,
          ),
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBotnavItem(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              CustomBotnavItem(
                index: 1,
                imageUrl: 'assets/icon_transaction.png',
              ),
              CustomBotnavItem(
                index: 2,
                imageUrl: 'assets/icon_card.png',
              ),
              CustomBotnavItem(
                index: 3,
                imageUrl: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: bgColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtonNav(),
            ],
          ),
        );
      },
    );
  }
}
