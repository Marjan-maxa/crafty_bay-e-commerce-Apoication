import 'package:flutter/cupertino.dart';

class MainNavProvider extends ChangeNotifier{
int _selectedIndex=0;
int get selectedIndex=>_selectedIndex;
void setIndex(int index){
  _selectedIndex=index;
  notifyListeners();
}
bool isCheckUserLoggdIn(int index)=>index==2 ||index==3;
void moveToHome(){
  setIndex(0);
}
void moveToCategoryList(){
  setIndex(1);
}

}