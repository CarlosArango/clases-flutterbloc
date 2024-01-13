import 'package:flutter/material.dart';

class TabsWidget extends StatelessWidget {
  const TabsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TabBarLetters();
  }
}

class _TabBarLetters extends StatefulWidget {
  const _TabBarLetters({super.key});

  @override
  State<_TabBarLetters> createState() => _TabBarLettersState();
}

class _TabBarLettersState extends State<_TabBarLetters>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: letters().length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      unselectedLabelColor: const Color(0xFF99999D),
      unselectedLabelStyle: const TextStyle(
        fontSize: 17,
      ),
      isScrollable: true,
      indicatorSize: TabBarIndicatorSize.tab,
      labelPadding: const EdgeInsets.only(
        bottom: 10,
      ),
      indicatorPadding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      labelStyle: const TextStyle(
        fontSize: 17,
        color: Color(0xFFFF4B3A),
        fontWeight: FontWeight.w700,
      ),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3.0,
          color: Color(0xFFFF4B3A),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      dividerColor: Colors.transparent,
      tabs: [
        ...letters()
            .map((letter) => Padding(
                padding: const EdgeInsets.only(right: 70), child: Text(letter)))
            .toList(),
      ],
    );
  }

  List<String> letters() {
    return List.generate(26, (index) => String.fromCharCode(index + 65));
  }
}
