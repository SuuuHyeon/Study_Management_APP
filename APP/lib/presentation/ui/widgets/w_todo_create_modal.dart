import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoBottomSheet extends StatelessWidget {
  const AddTodoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const Text(
            '새로운 할일',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: '할일 제목을 입력하세요',
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // TextField(
          //   decoration: InputDecoration(
          //     hintText: '메모를 추가하세요 (선택)',
          //     filled: true,
          //     fillColor: Colors.grey[100],
          //     contentPadding:
          //         const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12),
          //       borderSide: BorderSide.none,
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 16),
          /// 카테고리
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(CupertinoIcons.calendar,
                      color: Colors.black54),
                  label: const Text(
                    '날짜 설정',
                    style: TextStyle(color: Colors.black87),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey[300]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // 날짜 선택 기능 추가 예정
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(CupertinoIcons.bell, color: Colors.black54),
                  label: const Text(
                    '알림 설정',
                    style: TextStyle(color: Colors.black87),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey[300]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // 알림 설정 기능 추가 예정
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // 할일 저장 로직 추가 예정
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text(
                '저장',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
