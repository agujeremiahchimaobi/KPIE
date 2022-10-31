import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogintextField extends StatelessWidget {
  const LogintextField({
    Key? key,
    this.hint,
    this.prefix,
    this.onsave,
    this.controller,
  }) : super(key: key);

  final String? hint;
  final dynamic prefix;
  final dynamic onsave;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        controller: controller,
        onChanged: onsave,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 15),
          hintText: hint!,
          hintStyle: GoogleFonts.lato(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
            color: const Color(0xff9098B1),
          ),
          prefixIcon: prefix,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    this.text,
    this.prefix,
    this.ontap,
  }) : super(key: key);

  final String? text;
  final String? prefix;
  final dynamic ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xfff2f5f9),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            Image.asset(prefix!, height: 17),
            const SizedBox(width: 80),
            Text(
              text!,
              style: GoogleFonts.lato(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
                color: const Color(0xff9098B1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
