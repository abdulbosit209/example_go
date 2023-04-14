import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gotaxi/utils/style.dart';


class MyUtils {
  static showSnackBar(BuildContext context, String? text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text ?? ""),
        backgroundColor: Colors.blue,
      ),
    );
  }

  static Future<String> selectTime(BuildContext context)async{
    TimeOfDay? selectedTime24Hour = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
    );
    return "${selectedTime24Hour?.hour.toString().padLeft(2, "0")}:${selectedTime24Hour?.minute.toString().padLeft(2, '0')}";
  }

  static List<double> getLatLngList(String locationName){
    List<String> locationList = locationName.split(" ");
    double latitude = double.parse(locationList[0]);
    double longitude = double.parse(locationList[1]);
    return [latitude, longitude];
  }

  static Future<String> selectDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2030),
      initialDatePickerMode: DatePickerMode.day,
    );
    return "${date?.day.toString().padLeft(2, '0')}/${date?.month.toString().padLeft(2, '0')}/${date?.year}";
  }


  static getMyToast({required String message}) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey.shade300,
        textColor: Colors.black,
        fontSize: 16.0,
      );

  static showLoader(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  static String getPhoneNumber(String number) {
    return number.replaceAll(RegExp(r"\s|-|[()]+"), "");
  }

  static void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void selectImageDialog({
    required BuildContext context,
    required VoidCallback onCameraTap,
    required VoidCallback onGalleryTap,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.all(16),
              height: 150,
              child: Column(
                children: [
                  ListTile(
                      leading: Icon(
                        Icons.photo_library,
                        color: Theme.of(context).cardColor,
                      ),
                      title: Text(
                        "Gallery",
                        style: MyTextStyle.sfProRegular.copyWith(
                            fontSize: 16, color: Theme.of(context).cardColor),
                      ),
                      onTap: onGalleryTap
                  ),
                  ListTile(
                      leading: Icon(
                        Icons.photo_camera,
                        color: Theme.of(context).cardColor,
                      ),
                      title: Text(
                        "Camera",
                        style: MyTextStyle.sfProRegular.copyWith(
                            fontSize: 16, color: Theme.of(context).cardColor),
                      ),
                      onTap: onCameraTap
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


  static List<String> cityNames = [
    "Toshkent",
    "Andijan",
    "Namangan",
    "Fergana",
    "Jizzax",
    "Sirdaryo",
    "Samarqand",
    "Buxoro",
    "Navoiy",
    "Surxondaryo",
    "Qashqadaryo",
    "Xorazm",
    "Qoraqalpog'iston",
  ];
}




