import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone_app/core/colors/constants.dart';
import 'package:netflix_clone_app/presentation/widgets/button_text_icon.dart';

const image =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/bAnHzJ6AMhOhnV3C0kTxkpCqpgM.jpg';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            height: 400,
            child: Column(
              children: [
                const Text(
                  'FEB',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '11',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.spaceGrotesk.toString()),
                )
              ],
            ),
          ),
          SizedBox(
            width: size.width - 50,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 160,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(image),
                      )),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.black.withOpacity(0.7),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.volume_off_rounded,
                                color: Colors.white,
                                size: 25,
                              ))),
                    ),
                  ],
                ),
                kHeight,
                const Row(
                  children: [
                    Text(
                      'I Am Groot',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    ButtonTextIcon(
                      icon: Icons.notifications_outlined,
                      title: 'Remind me',
                      iconSize: 25,
                      textSize: 13,
                      defColor: Colors.grey,
                    ),
                    kWidth,
                    ButtonTextIcon(
                      icon: Icons.info_outline_rounded,
                      title: 'info',
                      iconSize: 25,
                      textSize: 13,
                      defColor: Colors.grey,
                    ),
                    kWidth,
                  ],
                ),
                Text(
                  'Coming on Friday',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 20,
                  ),
                ),
                kHeight,
                const Text('I Am Groot',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
                const Text(
                  'There’s no guarding the galaxy from this mischievous toddler! Get ready as Baby Groot takes center stage in his very own collection of shorts',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
