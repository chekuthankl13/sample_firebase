import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_firebase/core/utils/utils.dart';
import 'package:sample_firebase/features/home/presentation/cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabCntr;

  @override
  void initState() {
    tabCntr = TabController(length: 2, vsync: this);
    context.read<HomeCubit>().fetchDummy1();
    context.read<HomeCubit>().fetchDummy2();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        bottom: TabBar(
            controller: tabCntr,
            labelColor: Colors.white,
            indicatorColor: Colors.green,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4,
            tabs: const [
              Tab(
                text: "Data 1",
              ),
              Tab(
                text: "Data 2",
              ),
            ]),
      ),
      body: TabBarView(controller: tabCntr, children: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.error1.isNotEmpty) {
              return error(state.error1);
            }

            return tab(state.dummy1);
          },
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.error2.isNotEmpty) {
             return error(state.error2);
            }

            return tab(state.dummy2);
          },
        ),
      ]),
    );
  }

  StreamBuilder<List<Map<String, dynamic>>> tab(
      Stream<List<Map<String, dynamic>>> items) {
    return StreamBuilder(
      stream: items,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loading();
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return error('No data available');
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var data = snapshot.data![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                tileColor: Colors.blueGrey.withOpacity(.2),
                title: Text(data['name']),
              ),
            );
          },
        );
      },
    );
  }
}
