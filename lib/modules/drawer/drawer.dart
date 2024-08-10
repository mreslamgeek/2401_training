import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff6342E8),
          Color(0xff7F77FE),
          Color(0xffA573FF),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () {
                    navKey.currentState?.pop();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 33,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/56995306-DFE8-4636-BF6E-5345126F58B4 1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      'Osama Awaad',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Text(
                      'OsamaAwaad@gmail.com',
                      style: TextStyle(color: Colors.white),
                    ),
                    // constraints: BoxConstraints(),
                    // padding: EdgeInsets.zero,
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            // UserAccountsDrawerHeader(
            //     currentAccountPicture: CircleAvatar(
            //       child: ClipRRect(
            //         borderRadius: BorderRadius.circular(50),
            //         child: Image.asset(
            //           'assets/images/56995306-DFE8-4636-BF6E-5345126F58B4 1.png',
            //           fit: BoxFit.contain,
            //         ),
            //       ),
            //     ),
            //     accountName: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         const Text(
            //           '\nOsama Awaad',
            //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //         ),
            //         IconButton(
            //           onPressed: () {
            //           },
            //           icon: Icon(
            //             Icons.edit_rounded,
            //             color: Colors.white,
            //           ),
            //           constraints: BoxConstraints(),
            //           padding: EdgeInsets.zero,
            //         )
            //       ],
            //     ),
            //     accountEmail: const Text('OsamaAwaad@gmail.com')),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              title: const Text('Orders',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              leading: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              onTap: () {
                navKey.currentState?.pushNamed(AppRoutes.ORDER);
              },
            ),
            ListTile(
              title: const Text('Wishlist',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              leading: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Delivery Address',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              leading: const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Payment Methods',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              leading: const Icon(
                Icons.subtitles_outlined,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Promo Cord',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              leading: const Icon(
                Icons.more_horiz_rounded,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Notifecations ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              leading: const Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Help',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              leading: const Icon(
                Icons.help_outline,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            ListTile(
              title: const Text('About ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              leading: const Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              onTap: () {},
            ),
            const SizedBox(
              height: 100,
            ),
            ListTile(
              title: const Text('Log Out ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              leading: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              onTap: () async {
                final SharedPreferences prefs = await SharedPreferences.getInstance();

                prefs.remove('tokken');

                navKey.currentState?.pushNamed(AppRoutes.INTIAL);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
