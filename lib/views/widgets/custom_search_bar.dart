import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onMicrophoneTap;

  const CustomSearchBar({
    super.key,
    this.hintText = 'Search "Punjabi Lyrics"',
    this.controller,
    this.onChanged,
    this.onMicrophoneTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Container for the background color and rounded corners
      decoration: BoxDecoration(
        color: Color(0xff2F2F39), // Dark background color for the search bar
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // Subtle shadow for depth
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ), // Padding inside the container
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ), // Text color for input
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 16.0,
          ), // Hint text color
          border: InputBorder.none, // Remove default TextField border
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12, right: 24),
            child: SvgPicture.asset('assets/search_svg.svg'),
          ), // Padding for the prefix icon
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: SvgPicture.asset('assets/mic_icon1.svg'),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14.0,
          ), // Adjust vertical padding
        ),
        cursorColor: Colors.white, // Color of the blinking cursor
      ),
    );
  }
}
