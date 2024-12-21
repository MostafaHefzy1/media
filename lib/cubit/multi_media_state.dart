part of 'multi_media_cubit.dart';

@immutable
sealed class MultiMediaState {}

final class MultiMediaInitial extends MultiMediaState {}


final class GetImageSuccessState extends MultiMediaState {}

final class PickFileSuccessState  extends MultiMediaState {}