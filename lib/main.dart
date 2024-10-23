import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? ourCompanyDropdown;
  final ScrollController _scrollController =
      ScrollController(); // Add ScrollController
  final ScrollController _horizontalScrollController = ScrollController();
  final ScrollController _verticalScrollController = ScrollController();
Future<void> fetchData() async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:8080/greet'), // or change port if needed
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'name': 'Meghadeep'}),
    );

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: SingleChildScrollView(
            controller:
                _scrollController, // Assign ScrollController to SingleChildScrollView
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(22, 0, 0, 0),
                  child: SvgPicture.asset(
                    'assets/ToucanSVG.svg', // Replace with your asset path
                    height: 30,
                    width: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(300, 0, 0, 0),
                  child: Text(
                    "Product",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              color: const Color.fromRGBO(119, 111, 111, 0.69)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Text(
                    "Solutions",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              color: const Color.fromRGBO(119, 111, 111, 0.69)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Text(
                    "Our Company",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              color: const Color.fromRGBO(119, 111, 111, 0.69)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Text(
                    "Developer",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              color: const Color.fromRGBO(119, 111, 111, 0.69)),
                    ),
                  ),
                ),
                // Example of adding more widgets
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Text(
                    "Career",
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                              color: const Color.fromRGBO(119, 111, 111, 0.69)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(380, 0, 0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color of the container
                      border: Border.all(
                          color: Colors.black, width: 1), // Black border
                      borderRadius: BorderRadius.circular(32), // Rounded edges
                    ),
                    padding: const EdgeInsets.fromLTRB(
                        25, 7, 25, 7), // Padding inside the container
                    child: TextButton(
                      onPressed: () async {
                        await fetchData();
                      },
                      child: Text(
                        'Contact us',
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w200),
                        ), // Text styling
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Scrollbar(
          controller: _horizontalScrollController,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _horizontalScrollController,
            child: SizedBox(
              width: 1500, // Fixed width to allow horizontal scrolling
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: _verticalScrollController,
                child: SizedBox(
                  height: 1000, // Set a fixed height for vertical scrolling
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 30,
                          child: SvgPicture.asset(
                            'assets/Maskgroup.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Positioned(
                          left: 20,
                          right: 30,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Next-Gen ",
                                    style: GoogleFonts.poppins(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontSize: 50,
                                              fontWeight: FontWeight.w200),
                                    ),
                                  ),
                                  ShaderMask(
                                    shaderCallback: (bounds) =>
                                        const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(
                                            255, 214, 0, 1), // Yellow
                                        Color.fromRGBO(
                                            74, 168, 1, 1), // Parrot Green
                                      ],
                                      stops: [
                                        0.02,
                                        0.3
                                      ], // Control gradient stops
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ).createShader(bounds),
                                    child: Text(
                                      "Payments ",
                                      style: GoogleFonts.poppins(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  ShaderMask(
                                    shaderCallback: (bounds) =>
                                        const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(
                                            255, 214, 0, 1), // Yellow
                                        Color.fromRGBO(
                                            74, 168, 1, 1), // Parrot Green
                                      ],
                                      stops: [
                                        0.1,
                                        0.5
                                      ], // Control gradient stops
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                    ).createShader(bounds),
                                    child: Text(
                                      "Made ",
                                      style: GoogleFonts.poppins(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  ShaderMask(
                                    shaderCallback: (bounds) =>
                                        const LinearGradient(
                                      colors: [
                                        Color.fromRGBO(
                                            255, 214, 0, 1), // Yellow
                                        Color.fromRGBO(
                                            74, 168, 1, 1), // Parrot Green
                                      ],
                                      stops: [
                                        0.3,
                                        0.7
                                      ], // Control gradient stops
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                    ).createShader(bounds),
                                    child: Text(
                                      "Simple",
                                      style: GoogleFonts.poppins(
                                        fontSize: 50,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Experience the Future Now",
                                style: GoogleFonts.poppins(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                                child: Text(
                                  "Integrated end-to-end payments, data, and financial management.",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          580, 0, 20, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.transparent,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 7, 5, 7),
                                        child: Text(
                                          'Request a Demo',
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w200),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.transparent,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 7, 25, 7),
                                        child: Text(
                                          'Watch video',
                                          style: GoogleFonts.poppins(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w200),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
        // body: Scrollbar(
        //   controller: _scrollController,
        //    child: SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     controller: _horizontalScrollController,
        //     child: SingleChildScrollView(
        //       scrollDirection: Axis.vertical,
        //       controller:  _verticalScrollController,
        //       child: SizedBox(
        //         width: 1500, // Fixed width to allow horizontal scrolling
        //         child: ConstrainedBox(
        //           constraints: BoxConstraints(
        //             minHeight: MediaQuery.of(context).size.height, // Ensure content expands vertically
        //           ),
        //           child: Stack(
        //             children: [
        //               Positioned(
        //                 top: 0,
        //                 left: 30,
        //                 child: SvgPicture.asset(
        //                   'assets/Maskgroup.svg',
        //                   fit: BoxFit.contain,
        //                 ),
        //               ),
        //               Positioned(
        //                 left: 20,
        //                 right: 30,
        //                 child: Column(
        //                   children: [
        //                     Row(
        //                       mainAxisAlignment: MainAxisAlignment.center,
        //                       children: [
        //                         Text(
        //                           "Next-Gen ",
        //                           style: GoogleFonts.poppins(
        //                             textStyle: Theme.of(context)
        //                                 .textTheme
        //                                 .bodyLarge
        //                                 ?.copyWith(
        //                                     fontSize: 50,
        //                                     fontWeight: FontWeight.w200),
        //                           ),
        //                         ),
        //                         ShaderMask(
        //                           shaderCallback: (bounds) => const LinearGradient(
        //                             colors: [
        //                               Color.fromRGBO(255, 214, 0, 1),
        //                               Color.fromRGBO(74, 168, 1, 1), // Parrot Green
        //                               // Yellow
        //                             ],
        //                             stops: [0.02, 0.3],
        //                             begin: Alignment.topCenter,
        //                             end: Alignment.bottomCenter,
        //                           ).createShader(bounds),
        //                           child: Text(
        //                             "Payments ",
        //                             style: GoogleFonts.poppins(
        //                               fontSize: 50,
        //                               fontWeight: FontWeight.w400,
        //                               color: Colors
        //                                   .white, // Set text color to white for the gradient to show
        //                             ),
        //                           ),
        //                         ),
        //                         ShaderMask(
        //                           shaderCallback: (bounds) => const LinearGradient(
        //                             colors: [
        //                               Color.fromRGBO(255, 214, 0, 1),
        //                               Color.fromRGBO(74, 168, 1, 1), // Parrot Green
        //                               // Yellow
        //                             ],
        //                             stops: [0.1, 5],
        //                             begin: Alignment.topRight,
        //                             end: Alignment.bottomLeft,
        //                           ).createShader(
        //                             const Rect.fromLTWH(0, 0, 200, 70),
        //                           ),
        //                           child: Text(
        //                             "Made ",
        //                             style: GoogleFonts.poppins(
        //                               fontSize: 50,
        //                               fontWeight: FontWeight.w400,
        //                               color: Colors
        //                                   .white, // Set text color to white for the gradient to show
        //                             ),
        //                           ),
        //                         ),
        //                         ShaderMask(
        //                           shaderCallback: (bounds) => const LinearGradient(
        //                             colors: [
        //                               Color.fromRGBO(255, 214, 0, 1),
        //                               Color.fromRGBO(74, 168, 1, 1), // Parrot Green
        //                               // Yellow
        //                             ],
        //                             stops: [3, 8],
        //                             begin: Alignment.topRight,
        //                             end: Alignment.bottomLeft,
        //                           ).createShader(
        //                             const Rect.fromLTWH(0, 0, 200, 70),
        //                           ),
        //                           child: Text(
        //                             "Simple",
        //                             style: GoogleFonts.poppins(
        //                               fontSize: 50,
        //                               fontWeight: FontWeight.w400,
        //                               color: Colors
        //                                   .white, // Set text color to white for the gradient to show
        //                             ),
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                     Text(
        //                       "Experience the Future Now",
        //                       style: GoogleFonts.poppins(
        //                         fontSize: 50,
        //                         fontWeight: FontWeight.w200,
        //                         color: Colors
        //                             .black, // Set text color to white for the gradient to show
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
        //                       child: Text(
        //                         "Integrated end-to-end payments, data, and financial management.",
        //                         style: GoogleFonts.poppins(
        //                           fontSize: 14,
        //                           fontWeight: FontWeight.w300,
        //                           color: Colors
        //                               .black, // Set text color to white for the gradient to show
        //                         ),
        //                       ),
        //                     ),
        //                     Padding(
        //                       padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        //                       child: Row(
        //                         mainAxisAlignment: MainAxisAlignment.start,
        //                         children: [
        //                           Padding(
        //                             padding:
        //                                 const EdgeInsets.fromLTRB(580, 0, 20, 0),
        //                             child: Container(
        //                               decoration: BoxDecoration(
        //                                 color: Colors
        //                                     .transparent, // Background color of the container
        //                                 border: Border.all(
        //                                     color: Colors.transparent,
        //                                     width: 1), // Black border
        //                                 borderRadius: BorderRadius.circular(
        //                                     32), // Rounded edges
        //                               ),
        //                               padding: const EdgeInsets.fromLTRB(25, 7, 5,
        //                                   7), // Padding inside the container
        //                               child: Text(
        //                                 'Request a Demo',
        //                                 style: GoogleFonts.poppins(
        //                                   textStyle: Theme.of(context)
        //                                       .textTheme
        //                                       .bodyLarge
        //                                       ?.copyWith(
        //                                           fontSize: 12,
        //                                           fontWeight: FontWeight.w200),
        //                                 ), // Text styling
        //                               ),
        //                             ),
        //                           ),
        //                           Padding(
        //                             padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        //                             child: Container(
        //                               decoration: BoxDecoration(
        //                                 color: Colors
        //                                     .transparent, // Background color of the container
        //                                 border: Border.all(
        //                                     color: Colors.transparent,
        //                                     width: 1), // Black border
        //                                 borderRadius: BorderRadius.circular(
        //                                     32), // Rounded edges
        //                               ),
        //                               padding: const EdgeInsets.fromLTRB(0, 7, 25,
        //                                   7), // Padding inside the container
        //                               child: Text(
        //                                 'Watch video',
        //                                 style: GoogleFonts.poppins(
        //                                   textStyle: Theme.of(context)
        //                                       .textTheme
        //                                       .bodyLarge
        //                                       ?.copyWith(
        //                                           fontSize: 12,
        //                                           fontWeight: FontWeight.w200),
        //                                 ), // Text styling
        //                               ),
        //                             ),
        //                           )
        //                         ],
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
