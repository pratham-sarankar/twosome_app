import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover"),
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.grey.shade900,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size(0, 35),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: CupertinoSearchTextField(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              prefixIcon: const Icon(IconlyLight.search),
              prefixInsets: EdgeInsets.only(left: 10),
              suffixInsets: EdgeInsets.only(right: 10),
              style: GoogleFonts.poppins(),
              placeholder: "Search for a Dot",
            ),
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        childAspectRatio: 9 / 11,
        children: [
          for (int i = 0; i < 1; i++)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA'),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            Colors.black.withAlpha(255),
                          ],
                        ).createShader(
                          Rect.fromLTRB(0, 0, bounds.width, bounds.height),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(
                            sigmaX: 100,
                            sigmaY: 100,
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black.withAlpha(00),
                                        Colors.black.withAlpha(255),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Image.network(
                                'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 12,
                    left: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hazel",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 0),
                        Row(
                          children: [
                            Icon(
                              IconlyLight.bag_2,
                              color: Colors.white70,
                              size: 15,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "Musician",
                              style: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
