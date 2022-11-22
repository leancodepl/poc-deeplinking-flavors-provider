import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_di/features/bloc_demo/current_time_cubit.dart';
import 'package:provider_di/features/time_service/random_time_service.dart';

class CurrentTimePage extends MaterialPageRoute<void> {
  CurrentTimePage.basic()
      : super(
          builder: (context) => BlocProvider(
            create: (context) => CurrentTimeCubit(
              timeService: context.read(),
            ),
            child: const CurrentTimeScreen(),
          ),
        );

  CurrentTimePage.random()
      : super(
          builder: (context) => BlocProvider(
            create: (context) => CurrentTimeCubit(
              timeService: context.read<RandomTimeService>(),
            ),
            child: const CurrentTimeScreen(),
          ),
        );
}

class CurrentTimeScreen extends StatelessWidget {
  const CurrentTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentTimeCubit, CurrentTimeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Current Time'),
          ),
          body: Center(
            child: Text(
              state.map(
                initial: (state) => 'Press the button to start',
                loading: (state) => 'Loading...',
                success: (state) => state.time.toString(),
              ),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          floatingActionButton:
              state is CurrentTimeStateLoading ? null : const _RefreshButton(),
        );
      },
    );
  }
}

class _RefreshButton extends StatelessWidget {
  const _RefreshButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: context.read<CurrentTimeCubit>().fetch,
      child: const Icon(Icons.refresh),
    );
  }
}
