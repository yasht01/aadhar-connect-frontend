import 'package:flutter/material.dart';
import 'package:sih_frontend/constants/presentation_constants.dart';

class PillButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;
  final bool isEnabled;
  final EdgeInsets? margin;
  final double? width;
  final bool? visible;

  const PillButton({
    Key? key,
    required this.text,
    this.onTap,
    this.isEnabled = true,
    this.margin,
    this.width,
    this.visible = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (visible != null && visible == true) ? Container(
      margin: margin ??
          const EdgeInsets.symmetric(
            vertical: 6.0,
            horizontal: 12.0,
          ),
      child: SizedBox(
        width: width ?? double.infinity,
        height: 52,
        child: ElevatedButton(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
          onPressed: isEnabled ? onTap : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return kDisabledColor;
                }
                return kEnabledColor;
              },
            ),
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(52),
              ),
            ),
          ),
        ),
      ),
    ) : const SizedBox();
  }
}
