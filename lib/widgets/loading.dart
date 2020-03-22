import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_filter/res/index.dart';
import './loading.i18n.dart';

/// Loading widget.
/// Display loading screen with loading Widget [widget] and Text [text]
/// default [widget] is
/// ```
/// SpinKitChasingDots(
///   size: 64,
///   color: PFColors.primary
/// )
/// ```
/// default [text] is
/// ```
/// const Text(
///   ITStrings.loading,
///   style: TextStyle(color: PFColors.greyText, fontSize: 12),
/// )
/// ```
/// {@category Widgets}
class PFLoading extends StatelessWidget {
  const PFLoading({Key key, this.text, this.widget}) : super(key: key);
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  if (widget != null)
                    widget
                  else
                    SpinKitDualRing(
                      size: 64,
                      color: PFColors.primary,
                    ),
                  Container(
                    margin: EdgeInsets.only(top: 24),
                    child: Text(
                      text ?? "Loading... please wait".i18n,
                      style: GoogleFonts.ubuntu(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: PFColors.text,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
