import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:study_management_app/core/providers/app_state_provider.dart';
import 'package:study_management_app/presentation/viewModel/cagegory_view_model.dart';

class CategorySelector extends ConsumerWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return Container(
      height: 70,
      color: Colors.blueGrey[50],
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        children: [
          ChoiceChip(
            label: const Text('전체'),
            selected: selectedCategory == '전체',
            onSelected: (isSelected) =>
                ref.read(selectedCategoryProvider.notifier).state = '전체',
            backgroundColor: Colors.grey[200],
            selectedColor: Colors.blueGrey[200],
          ),
          const VerticalDivider(
              thickness: 1, endIndent: 10, indent: 10, width: 20),
          ...categories.map((category) => Row(
                children: [
                  ChoiceChip(
                    label: Text(category.name),
                    selected: selectedCategory == category.name,
                    onSelected: (isSelected) {
                      final newCategory = isSelected ? category.name : '전체';
                      ref.read(selectedCategoryProvider.notifier).state =
                          newCategory;

                      print('category ID: ${category.id}');
                      print(
                          'selectedCategory: ${ref.read(selectedCategoryProvider)}');
                    },
                    backgroundColor: Colors.grey[200],
                    selectedColor: Colors.blueGrey[200],
                  ),
                  // 리스트 구분
                  const VerticalDivider(
                      thickness: 1, endIndent: 10, indent: 10, width: 20),
                ],
              )),
          ActionChip(
            label: const Text('＋ 추가', style: TextStyle(color: Colors.black87)),
            backgroundColor: Colors.grey[300],
            onPressed: () {
              _showAddCategoryDialog(context, ref);
            },
          ),
        ],
      ),
    );
  }

  // 🟢 카테고리 추가 다이얼로그
  void _showAddCategoryDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('새 카테고리 추가'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: '카테고리 이름'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('취소'),
            ),
            TextButton(
              onPressed: () {
                final name = controller.text.trim();
                if (name.isNotEmpty) {
                  // ref.read(categoryProvider.notifier).addCategory(name);
                }
                Navigator.pop(context);
              },
              child: const Text('추가'),
            ),
          ],
        );
      },
    );
  }
}
