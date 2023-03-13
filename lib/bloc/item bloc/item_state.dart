part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();
  
  @override
  List<Object> get props => [];
}
class ItemInitalState extends ItemState {
  @override
  List<Object> get props => [];
}

class ItemLoadingState extends ItemState {
  @override
  List<Object> get props => [];
}


class ItemLoadedState extends ItemState {
  final List item;
  final List cart;
  const ItemLoadedState({required this.item, required this.cart});
}
