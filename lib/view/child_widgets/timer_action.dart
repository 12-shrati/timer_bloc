part of '../timer_view.dart';

class TimerAction extends StatelessWidget {
  const TimerAction({super.key});

  @override
  Widget build(BuildContext context) {
    final timerBloc = context.read<TimerBloc>();
    return BlocBuilder<TimerBloc, TimerState>(
        buildWhen: (previous, current) =>
            previous.runtimeType != current.runtimeType,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...switch (state) {
                TimerInitial() => [
                    FloatingActionButton(
                      onPressed: () {
                        timerBloc.add(OnTimerStarted(duration: state.duration));
                      },
                      child: Icon(Icons.play_arrow),
                    )
                  ],
                TimerInProgress() => [
                    FloatingActionButton(
                      onPressed: () {
                        timerBloc.add(OnTimerPause());
                      },
                      child: Icon(Icons.pause),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        timerBloc.add(OnTimerReset());
                      },
                      child: Icon(Icons.restore),
                    )
                  ],
                TimerPause() => [
                    FloatingActionButton(
                      onPressed: () {
                        timerBloc.add(OnTimerPlay());
                      },
                      child: Icon(Icons.play_arrow),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        timerBloc.add(OnTimerReset());
                      },
                      child: Icon(Icons.restore),
                    )
                  ],
                TimerComplete() => [
                    FloatingActionButton(
                      onPressed: () {
                        timerBloc.add(OnTimerReset());
                      },
                      child: Icon(Icons.play_arrow),
                    )
                  ]
              },
            ],
          );
        });
  }
}
