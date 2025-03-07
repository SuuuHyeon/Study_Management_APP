import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/providers/app_state_provider.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final int bottomIndex;

  const CustomAppBar({
    super.key,
    required this.bottomIndex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final tabIndex = ref.read(bottomNavProvider);
    switch (bottomIndex) {
      case 0:
        return homeAppBar();
      case 1:
        return myPageAppBar();
      default:
        return defaultAppBar();
    }
  }

  // ✅ 홈 탭 전용 AppBar
  PreferredSizeWidget homeAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: const Text('홈'),
      centerTitle: true,
    );
  }

  // ✅ 마이페이지 전용 AppBar
  PreferredSizeWidget myPageAppBar() {
    return AppBar(
      title: const Text('마이페이지'),
      backgroundColor: Colors.green,
      centerTitle: true,
      elevation: 4,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // TODO: 설정 화면 이동
          },
        )
      ],
    );
  }

  // ✅ 기본 AppBar (예비용)
  PreferredSizeWidget defaultAppBar() {
    return AppBar(
      title: const Text('스터디 관리'),
      backgroundColor: Colors.grey,
      centerTitle: true,
      elevation: 1,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
