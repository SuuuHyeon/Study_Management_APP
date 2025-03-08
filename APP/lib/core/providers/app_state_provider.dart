import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_management_app/core/constatnts/todo_filter.dart';
import 'package:study_management_app/data/sources/local/todo.dart';

/// 바텀 네비게이션 프로바이더 (간략하게 stateProvider로 선언)
final bottomNavProvider = StateProvider<int>((ref) => 0);

final dbProvider = Provider<AppDatabase>((ref) => AppDatabase());
