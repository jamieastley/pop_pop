import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _BubbleImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Pop Pop',
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    fontStyle: FontStyle.italic,
                    fontFamily: GoogleFonts.fredokaOne().fontFamily,
                  ),
            ),
          ),
          const _BubbleImage(),
        ],
      );
}

class _BubbleImage extends StatelessWidget {
  const _BubbleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Image.asset(
        'assets/images/bubbles.png',
        height: 70,
      );
}
