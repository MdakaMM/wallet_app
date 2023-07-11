import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/bloc/inbox/inbox_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/constants/styling_helper.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
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
          BlocProvider(
            create: (context) => InboxBloc()..add(FetchInboxMessagesEvent()),
            child: Column(children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Inbox',
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: BlocBuilder<InboxBloc, InboxState>(
                  builder: (context, state) {
                    if (state is InboxLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is InboxLoadedState) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          final message = state.messages[index];
                          final formattedDate =
                              DateFormat('d MMMM yyyy, hh:mm a')
                                  .format(message.date);

                          return Card(
                            child: ListTile(
                              title: Text(
                                formattedDate,
                                style: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              ),
                              subtitle: Text(
                                message.description,
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is InboxErrorState) {
                      return Center(
                        child: Text(state.error),
                      );
                    }

                    return SizedBox.shrink();
                  },
                ),
              ),
            ]),
          ),
        ],
      )),
    );
  }
}
