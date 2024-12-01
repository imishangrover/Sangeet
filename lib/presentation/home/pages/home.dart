import 'package:flutter/material.dart';
import 'package:sangeet/common/helper/is_dark_mode.dart';
import 'package:sangeet/common/widgets/appbar/app_bar.dart';
import 'package:sangeet/core/configs/assets/app_vectors.dart';
import 'package:sangeet/core/configs/theme/app_colors.dart';
import 'package:sangeet/presentation/intro/pages/get_started.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState(); 
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        hideBack: true,
        title: Image.asset(
          AppVectors.logo,
          height: 70,
          width: 70,
        ),
        action: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search)
          ),
          IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async{
            await logout(context);
          },
        )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _tabs()
          ],
        ),
      ),
    );
  }

  Widget _tabs()
  {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: TabBar(
        controller: _tabController,
        //isScrollable: true,
        labelColor: context.isDarkMode  ? Colors.white : Colors.black,
        indicatorColor: AppColors.primary,
        tabs: const [
          Text(
            'News',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Videos',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Artist',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Podcast',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ]
      ),
    );
  }

  Future<void> logout(BuildContext content) async{
    final prefs = await SharedPreferences.getInstance();

    // Clear savved signed In State
    await prefs.remove('isSignedIn');

    //Navigate to Get Started Page 
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (BuildContext context) => const GetStartedPage()),
      (Route <dynamic> route) => false
    );
  }

}