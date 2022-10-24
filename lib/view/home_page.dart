import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/view_model/bloc/quote_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    fetchRandom();
  }

  void fetchRandom() {
    context.read<QuoteBloc>().add(GetRandom());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'https://i.picsum.photos/id/19/200/300.jpg?hmac=znGSIxHtiP0JiLTKW6bT7HlcfagMutcHfeZyNkglQFM',
                  ),
                  fit: BoxFit.fill),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black87,
                          Colors.black54,
                          Colors.black12,
                        ]),
                  ),
                  child: BlocBuilder<QuoteBloc, QuoteState>(
                    builder: (context, state) {
                      if (state is QuoteLoading) {
                        return Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: Colors.yellow.shade700,
                        ));
                      } else if (state is QuoteError) {
                        return Center(child: Text(state.message));
                      } else if (state is QuoteSuccess) {
                        return Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(20),
                              child: Center(
                                child: Text(
                                  state.quote.content!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Author: ${state.quote.author!}',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
                GestureDetector(
                  onTap: fetchRandom,
                  child:  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                ),
              ],
            )));
  }
}
