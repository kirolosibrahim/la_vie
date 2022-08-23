
abstract class HomeScreenStates {}

class HomeInitialState extends HomeScreenStates {}

class HomeChangeBottomNavBarState extends HomeScreenStates {}

class HomeChangeBottomSheetState extends HomeScreenStates {}
class LoadingProductsDataState extends HomeScreenStates {}
class SuccessProductsDataState extends HomeScreenStates {}
class SuccessSeedDataState extends HomeScreenStates {}
class SuccessPlantDataState extends HomeScreenStates {}
class SuccessToolDataState extends HomeScreenStates {}


class LoadingSeedDataState extends HomeScreenStates {}
class LoadingPlantDataState extends HomeScreenStates {}
class LoadingToolDataState extends HomeScreenStates {}


class ErrorProductsDataState extends HomeScreenStates {
  late final String error ;
  ErrorProductsDataState(this.error);
}

