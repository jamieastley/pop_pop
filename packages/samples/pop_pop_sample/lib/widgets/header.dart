import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pop_pop_sample/core/ui/styles.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth <= Breakpoints.mobile) {
          Fimber.d('Breakpoint: small mobile');
          return const _HeaderRow(imageHeight: 40, fontSize: 40);
        } else if (constraints.maxWidth >= Breakpoints.mobile &&
            constraints.maxWidth <= Breakpoints.tablet) {
          Fimber.d('Breakpoint: mobile');
          return const _HeaderRow(imageHeight: 40, fontSize: 50);
        } else {
          Fimber.d('Breakpoint: tablet or higher');
          return const _HeaderRow(imageHeight: 70, fontSize: 60);
        }
      });
}

class _HeaderRow extends StatelessWidget {
  final double imageHeight;
  final double fontSize;

  const _HeaderRow({
    required this.imageHeight,
    required this.fontSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _BubbleImage(imageHeight: imageHeight),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          // padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Pop Pop',
            key: const Key('pop_pop_title'),
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: fontSize,
                  fontFamily: GoogleFonts.fredokaOne().fontFamily,
                ),
          ),
        ),
        _BubbleImage(imageHeight: imageHeight),
      ],
    );
  }
}

class _BubbleImage extends StatelessWidget {
  final double imageHeight;
  const _BubbleImage({required this.imageHeight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Image.asset(
        'assets/images/bubbles.png',
        key: const Key('bubble_image'),
        height: imageHeight,
      );
}
