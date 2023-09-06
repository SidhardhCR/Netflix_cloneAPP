import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Container(
              width: size.width * 0.34,
              height: size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w220_and_h330_face/ihBi24EIr5kwAeY2PqmsgAcCj4n.jpg'))),
            ),
          ],
        ),
        Positioned(
          bottom: -40,
          left: -8,
          child: BorderedText(
            strokeWidth: 5,
            strokeColor: Colors.white,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 140,
                  fontFamily: GoogleFonts.spaceGrotesk.toString()),
            ),
          ),
        ),
      ],
    );
  }
}
