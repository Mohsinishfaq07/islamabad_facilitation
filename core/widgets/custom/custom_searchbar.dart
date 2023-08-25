import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/widgets/custom/close_icon_button.dart';

class CustomSearchBar extends StatefulWidget {
  CustomSearchBar({
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.onClear,
    Key? key,
  }) : super(key: key);
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  Function? onClear;

  final Function()? onTap;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController searchController = TextEditingController();
  bool showClearIconButton = false;

  @override
  void initState() {
    super.initState();

    listenToKeyboardChange();
  }

  void listenToKeyboardChange() {
    searchController.addListener(() {
      if (searchController.text.isEmpty) {
        setState(() {
          showClearIconButton = false;
          print(showClearIconButton);
        });
      } else if (searchController.text.isNotEmpty &&
              searchController.text.length == 1 ||
          searchController.text.length == 2) {
        setState(() {
          showClearIconButton = true;
          print(showClearIconButton);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: MediaQuery.of(context).size.width * 0.877,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              offset: const Offset(
                3,
                4.5,
              ),
              color: Theme.of(context).hintColor.withOpacity(.4),
              blurRadius: 5.5,
              spreadRadius: -1.5,
            )
          ],
          color: Theme.of(context).scaffoldBackgroundColor),
      alignment: Alignment.center,
      child: Row(
        children: [
          const Icon(Icons.search),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextFormField(
              onFieldSubmitted: widget.onSubmitted,
              onTap: widget.onTap,
              onChanged: widget.onChanged,
              controller: searchController,
              decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  hintText: "Search here",
                  enabledBorder: InputBorder.none),
            ),
          ),
          const Spacer(),
          showClearIconButton
              ? CloseIconButton(
                  iconSize: 15,
                  bgColor: Theme.of(context).hintColor.withOpacity(.65),
                  ontap: () {
                    searchController.clear();
                    widget.onClear!();
                  },
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
