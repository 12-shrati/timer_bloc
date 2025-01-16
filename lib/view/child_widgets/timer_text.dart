part of '../timer_view.dart';

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    String minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    String seconds = (duration % 60).floor().toString().padLeft(2, '0');
    return Text(
      "$minutes:$seconds",
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
