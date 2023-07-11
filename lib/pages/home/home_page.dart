import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wallet_app/bloc/transaction/transaction_bloc.dart';

import 'package:wallet_app/constants/styling_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallet_app/model/transaction_model.dart';
import 'package:wallet_app/pages/home/widget/icon_btn_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  //Json Code Texting
  // var data = [
  //   {
  //     'icon': 'assets/images/netflix.png',
  //     'title': 'Netfix',
  //     'subtitle': 'Month subscription',
  //     'amount': 'R325'
  //   },
  //   {
  //     'icon': 'assets/images/wallet.png',
  //     'title': 'Pay',
  //     'subtitle': 'External Payment',
  //     'amount': 'R652'
  //   },
  //   {
  //     'icon': 'assets/images/paypal.png',
  //     'title': 'Paypal',
  //     'subtitle': 'General',
  //     'amount': 'R296'
  //   },
  //   {
  //     'icon': 'assets/images/netflix.png',
  //     'title': 'Netfix',
  //     'subtitle': 'Month subscription',
  //     'amount': 'R325'
  //   },
  //   {
  //     'icon': 'assets/images/wallet.png',
  //     'title': 'Pay',
  //     'subtitle': 'External Payment',
  //     'amount': 'R652'
  //   },
  //   {
  //     'icon': 'assets/images/paypal.png',
  //     'title': 'Paypal',
  //     'subtitle': 'General',
  //     'amount': 'R296'
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    double minAmount = 5.00;
    double maxAmount = 1000000.00;

    Random random = Random();
    double randomAmount =
        minAmount + random.nextDouble() * (maxAmount - minAmount);

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: BlocProvider(
              create: (context) => TransactionBloc()..loadTransactions(),
              child: Container(
                padding: const EdgeInsets.all(defaultPadding),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wallet',
                            style: GoogleFonts.poppins(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Active',
                            style: GoogleFonts.poppins(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/profile.jpg',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/card');
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 140,
                      decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Stack(
                        children: [
                          Positioned(
                              top: 0,
                              left: 10,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xFF6E34B8),
                                    shape: BoxShape.circle),
                                height: 30,
                                width: 40,
                              )),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Balance',
                                          style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          'R ${randomAmount.toStringAsFixed(2)}',
                                          style: GoogleFonts.poppins(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(height: 20),
                                        Text(
                                          'Linked To Balance',
                                          style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )),
                                const SizedBox(height: 20),
                                const Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.arrow_forward_ios,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonWidget(
                        text: 'Profile',
                        icon: Iconsax.profile_circle,
                        callback: () {
                          Navigator.pushReplacementNamed(context, '/profile');
                        },
                      ),
                      ButtonWidget(
                        text: 'Inbox',
                        icon: Iconsax.notification,
                        callback: () {
                          Navigator.pushReplacementNamed(context, '/inbox');
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Recent Transactions',
                        style: GoogleFonts.poppins(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  BlocBuilder<TransactionBloc, List<Transaction>>(
                    builder: (context, transactions) {
                      if (transactions.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: transactions.length,
                            itemBuilder: (context, index) {
                              final transaction = transactions[index];

                              return ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.asset(
                                    transaction.icon,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                    // transaction.type.toString().split('.')[1],
                                    transaction.type.name.toUpperCase(),
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(transaction.subtitle),
                                trailing: Text('\R${transaction.amount}',
                                    style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              );
                            });
                      }
                    },
                  ),
                ]),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
