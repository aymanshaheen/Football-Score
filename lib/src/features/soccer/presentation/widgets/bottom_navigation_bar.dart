import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Goal/src/core/utils/app_colors.dart';
import 'package:Goal/src/core/utils/app_strings.dart';
import 'package:Goal/src/features/soccer/presentation/cubit/soccer_cubit.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({
    super.key,
    required this.cubit,
  });

  final SoccerCubit cubit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * .190,
      padding: EdgeInsets.only(left: size.width * .015),
      decoration: BoxDecoration(
        color: const Color.fromARGB(179, 29, 28, 28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
            bottom: size.width * .021,
            left: size.width * .04,
            right: size.width * .04),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            if (index == 1) {
              cubit.currentFixtures = cubit.dayFixtures;
            }
            cubit.changeBottomNav(index);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                  bottom: index == cubit.currentIndex ? 0 : size.width * .029,
                  right: size.width * .04,
                  left: size.width * .04,
                ),
                width: size.width * .135,
                height: index == cubit.currentIndex ? size.width * .014 : 0,
                decoration: const BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),
              if (index == 1)
                ImageIcon(
                  const AssetImage('assets/images/cup.png'),
                  color: index == cubit.currentIndex
                      ? AppColors.green
                      : AppColors.white70,
                )
              else
                Icon(
                  listOfIcons[index],
                  size: size.width * .060,
                  color: index == cubit.currentIndex
                      ? AppColors.green
                      : AppColors.white70,
                ),
              SizedBox(height: size.width * .018),
              Text(titles[index],
                  style: TextStyle(
                    color: index == cubit.currentIndex
                        ? AppColors.green
                        : AppColors.white70,
                    fontSize: size.width * .036,
                  )),
              SizedBox(height: size.width * .0),
            ],
          ),
        ),
      ),
    );
  }

  List listOfIcons = [
    CupertinoIcons.home,
    Icons.sports_soccer_rounded,
    CupertinoIcons.star_fill,
    Icons.settings_rounded,
  ];
  List<String> titles = [
    AppStrings.home,
    AppStrings.league,
    AppStrings.favourite,
    AppStrings.settings,
  ];
}
