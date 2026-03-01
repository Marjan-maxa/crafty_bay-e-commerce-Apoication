import 'dart:async';

import 'package:crafty_bay/app/extentions/applocalizations_extentions.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_color.dart';

class ResendOtpSection extends StatefulWidget {
  const ResendOtpSection({super.key});

  @override
  State<ResendOtpSection> createState() => _ResendOtpSectionState();
}

class _ResendOtpSectionState extends State<ResendOtpSection> {
  Timer? _timer;
  int _start = 40;
  bool _showresendOtpButton = true;
  void _startTimer() {
    _start = 40;
    _showresendOtpButton = false;
    setState(() {});
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        _timer?.cancel();
        _showresendOtpButton = true;
      } else {
        _start--;

      }
      setState(() {

      });
    });
  }


  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!_showresendOtpButton)
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: context.l10n.otpSendTimer,
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                TextSpan(
                  text: ' ${_start}s',
                  style: TextStyle(
                    color: AppColor.themeColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        if (_showresendOtpButton)
          TextButton(
            onPressed: _onTapOtpResendButton,
            child: Text(context.l10n.reSendButton),
          ),
      ],
    );
  }

  void _onTapOtpResendButton() {
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
