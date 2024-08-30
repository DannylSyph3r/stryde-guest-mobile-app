import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';

class FilterSettingsView extends ConsumerStatefulWidget {
  const FilterSettingsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FilterSettingsViewState();
}

class _FilterSettingsViewState extends ConsumerState<FilterSettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Filters",
        context: context,
        toolbarHeight: 70.h,
        color: Colors.transparent,
        isTitleCentered: true,
      ),
      body: ListView(),
    );
  }
}
