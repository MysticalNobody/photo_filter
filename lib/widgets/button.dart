import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:photo_filter/res/index.dart';
import './button.i18n.dart';

class PFButton extends StatefulWidget {
  const PFButton({Key key, @required this.onTap}) : super(key: key);
  final Function onTap;
  @override
  _PFButtonState createState() => _PFButtonState();
}

class _PFButtonState extends State<PFButton> {
  Function get onTap => widget.onTap;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        width: 160,
        height: 50,
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              width: isPressed ? 160 : 150,
              height: isPressed ? 50 : 45,
              color: DynamicTheme.of(context).brightness == Brightness.light
                  ? PFColors.text
                  : PFColors.primary,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOutCubic,
              child: Center(
                child: Text(
                  'Add photo'.i18n,
                  style: PFText.button.copyWith(
                    color:
                        DynamicTheme.of(context).brightness == Brightness.light
                            ? PFColors.bg
                            : PFColors.text,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                width: 150,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: DynamicTheme.of(context).brightness ==
                              Brightness.light
                          ? PFColors.text
                          : PFColors.primary,
                      width: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
