// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_hackaton/pages/mapPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
     return GetBuilder<MyHomePageController>(
        init: MyHomePageController(),
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
              body: IndexedStack(
                index: controller.tabIndex.value,
                children: pages,
              ),
              bottomNavigationBar: Obx(() => BottomNavigationBar(
                    onTap: controller.changeTabIndex,
                    // unselectedItemColor: context.theme.bottomNavigationBarTheme.unselectedItemColor,
                    // selectedItemColor: Colors.redAccent,
                    currentIndex: controller.tabIndex.value,
                    iconSize: 30,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    unselectedFontSize: 9,
                    selectedFontSize: 9,
                    enableFeedback: true,
                    landscapeLayout:
                        BottomNavigationBarLandscapeLayout.centered,
                    type: BottomNavigationBarType.fixed,
                    items: [
                      const BottomNavigationBarItem(
                          icon: Icon(Icons.calendar_month), label: "Календарь"),
                      const BottomNavigationBarItem(
                          icon: Icon(Icons.schedule), label: "Расписание пар"),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.notes), label: "Заметки"),
                      const BottomNavigationBarItem(
                          icon: Icon(Icons.notes), label: "Заметки"),
                      const BottomNavigationBarItem(
                          icon: Icon(Icons.settings), label: "Настройки"),
                    ],
                  )));
        });
  }
  
}
List<Widget> pages = [
  MapPage(),
  Scaffold(body: Center(child: Text(""),),)
];
List<String> pagesString = [
  "Календарь",
  "Расписание пар",
  "Moodle",
  "Заметки",
  "Настройки",
];

class MyHomePageController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    print(index);
    tabIndex.value = index;
    update();
  }
}