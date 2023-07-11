import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/pages/card/widget/card_info_widget.dart';
import '../../constants/styling_helper.dart';

class CardDetail extends StatefulWidget {
  const CardDetail({super.key});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  String? _username;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString('username');
    if (username != null) {
      setState(() {
        _username = username;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My Card',
                      style: GoogleFonts.poppins(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(24)),
                  child: Stack(
                    children: [
                      Positioned(
                          right: 300,
                          top: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF6E34B8),
                                width: 6.0,
                              ),
                            ),
                            height: 210,
                            width: 110,
                          )),
                      Positioned(
                          left: 320,
                          top: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF6E34B8),
                                width: 6.0,
                              ),
                            ),
                            height: 300,
                            width: 150,
                          )),
                      Positioned(
                          left: 250,
                          top: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF6E34B8),
                                width: 6.0,
                              ),
                            ),
                            height: 100,
                            width: 150,
                          )),
                      const Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Column(
                  children: [
                    CardInfo(
                      title: 'Name:',
                      description: _username.toString(),
                    ),
                    const CardInfo(
                      title: 'Bank:',
                      description: 'My Wallet App',
                    ),
                    const CardInfo(
                      title: 'Account:',
                      description: '*** *** *** 2158',
                    ),
                    const CardInfo(
                      title: 'Status:',
                      description: 'Active',
                    ),
                    const CardInfo(
                      title: 'Expiry:',
                      description: '04/2025',
                    )
                  ],
                )
              ]),
            ),
          ),
        ],
      )),
    );
  }
}
