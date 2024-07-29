import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/presentations/home/view_model/home_view_model.dart';
import 'package:beam_challange_ps/presentations/home/widgets/account.dart';
import 'package:beam_challange_ps/presentations/keypad/keypad_screen.dart';
import 'package:beam_challange_ps/presentations/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final HomeViewModel viewModel;
  late final TabController _tabController;

  @override
  void initState() {
    viewModel = HomeViewModel(currentTab: 0);
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  void _onItemTapped(int index) {
    viewModel.currentTab = index;
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Account(),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          BottomNavigationBar(
            selectedLabelStyle: AppTextStyles.body.b4.bold,
            unselectedLabelStyle: AppTextStyles.body.b4.regular,
            currentIndex: viewModel.currentTab,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Checkout',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [KeypadScreen(), SettingsScreen()],
      ),
    );
  }
}
