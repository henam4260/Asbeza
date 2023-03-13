part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class GetDataButtonPressed extends ItemEvent{
  
  @override
  List<Object> get props => [];
}

class CartEvent extends ItemEvent {
  final Item item;
   const CartEvent({required this.item});

  @override
  List<Object> get props => [];

  get data => item;
}