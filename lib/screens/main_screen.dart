import 'package:e_furniture/modules.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.home_outlined,
      Icons.bookmark_outline,
      Icons.notifications_outlined,
      Icons.person_outline,
    ];
    List<IconData> selectedIcons = [
      Icons.home,
      Icons.bookmark,
      Icons.notifications,
      Icons.person,
    ];

    final pages = {
      0: const HomeScreen(),
      1: const FavoriteScreen(),
      2: const NotificationScreen(),
      3: const ProfileScreen()
    };
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages.keys.map((index) => pages[index]!).toList(),
        onPageChanged: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: 60,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: icons.map((e) {
              int index = icons.indexOf(e);
              return IconButton(
                  splashRadius: 26,
                  onPressed: () {
                    setState(() {
                      selectedPage = index;
                      pageController.jumpToPage(selectedPage);
                    });
                  },
                  icon: Icon(
                    index == selectedPage ? selectedIcons[index] : e,
                    size: 30,
                    color: index == selectedPage ? Colors.black : kGreyColor2,
                  ));
            }).toList()),
      )),
    );
  }
}
