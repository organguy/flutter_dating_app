import 'package:dating_app/blocs/swipe_bloc.dart';
import 'package:dating_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  static Route route(){
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state){
          if(state is SwipeLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is SwipeLoaded){
            return Column(
              children: [
                Draggable(
                  feedback: UserCard(user: state.users[0]),
                  childWhenDragging: UserCard(user: state.users[1]),
                  onDragEnd: (drag) {
                    if(drag.velocity.pixelsPerSecond.dx < 0){
                      context.read<SwipeBloc>().add(SwipeLeftEvent(user: state.users[0]));
                      debugPrint('Swiped left');
                    }else{
                      context.read<SwipeBloc>().add(SwipeRightEvent(user: state.users[0]));
                      debugPrint('Swiped right');
                    }
                  },
                  child: UserCard(user: state.users[0]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 60
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ChoiceButton(
                        width: 60,
                        height: 60,
                        size: 25,
                        color: Theme.of(context).colorScheme.secondary,
                        hasGradient: false,
                        icon: Icons.clear_rounded,
                      ),
                      const ChoiceButton(
                        width: 80,
                        height: 80,
                        size: 30,
                        color: Colors.white,
                        hasGradient: true,
                        icon: Icons.favorite,
                      ),
                      ChoiceButton(
                        width: 60,
                        height: 60,
                        size: 25,
                        color: Theme.of(context).primaryColor,
                        hasGradient: false,
                        icon: Icons.watch_later,
                      )
                    ],
                  ),
                ),
              ],
            );
          }else{
             return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}






