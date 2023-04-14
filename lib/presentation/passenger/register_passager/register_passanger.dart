import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gotaxi/global_blocs/app_bloc/app_bloc.dart';
import 'package:gotaxi/global_blocs/image_upload/image_upload_bloc.dart';
import 'package:gotaxi/global_blocs/passenger_bloc/passenger_bloc.dart';
import 'package:gotaxi/presentation/widgets/salary_text_input.dart';
import 'package:gotaxi/presentation/widgets/universal_text_input.dart';
import 'package:gotaxi/router/router.gr.dart';
import 'package:gotaxi/utils/my_utils.dart';
import 'package:gotaxi/utils/style.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/select_image.dart';

@RoutePage()
class RegisterPassenger extends StatefulWidget {
  const RegisterPassenger({Key? key}) : super(key: key);

  @override
  State<RegisterPassenger> createState() => _RegisterPassengerState();
}

const List<String> gender = <String>['erkak', 'ayol'];

class _RegisterPassengerState extends State<RegisterPassenger> {
  String personImageUrl = "";
  final ImagePicker _picker = ImagePicker();
  String dropdownValue = gender.first;

  @override
  void initState() {
    personImageUrl =
        BlocProvider.of<PassengerBloc>(context).state.fields['passenger_photo'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<ImageUploadBloc>(context).add(EmptyImageUrl());
        BlocProvider.of<PassengerBloc>(context).add(EmptyPassenger());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("RegisterScreen")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            BlocConsumer<ImageUploadBloc, ImageUploadState>(
              builder: (context, state) {
                return state.status == FormzStatus.submissionInProgress
                    ? const Center(child: CircularProgressIndicator())
                    : SelectPersonImage(
                        logoUrl: personImageUrl,
                        onEditTap: () {
                          selectImageDialog(context);
                        },
                      );
              },
              listener: (context, state) {
                if (state.imageUrl.isNotEmpty) {
                  context.read<PassengerBloc>().add(UpdateCurrentPassenger(
                      fieldKey: "passenger_photo",
                      fieldValue: state.imageUrl));
                  setState(() {
                    personImageUrl = state.imageUrl;
                  });
                }
              },
            ),
            UniversalTextInput(
              errorText: "to'liq ismingizni kiriting",
              caption: "ism sharf",
              onChanged: (value) {
                context.read<PassengerBloc>().add(
                      UpdateCurrentPassenger(
                        fieldKey: 'full_name',
                        fieldValue: value,
                      ),
                    );
              },
              initialText:
                  context.watch<PassengerBloc>().state.fields["full_name"],
              hintText: "Ex: Google",
              keyBoardType: TextInputType.text,
            ),
            const SizedBox(height: 10),
            SalaryTextInput(
              caption: "Telegram Url",
              onChanged: (value) {
                context.read<PassengerBloc>().add(UpdateCurrentPassenger(
                    fieldKey: 'telegram_url', fieldValue: value));
              },
              hintText: "falonchi",
              initialText: context
                  .watch<PassengerBloc>()
                  .state
                  .fields["telegram_url"]
                  .toString(),
              keyBoardType: TextInputType.text,
            ),
            const SizedBox(height: 15),
            DropdownButtonValue(
              valueChanged: (value) {
                setState(() {
                  dropdownValue = value;
                });
                context.read<PassengerBloc>().add(UpdateCurrentPassenger(
                      fieldKey: 'gender',
                      fieldValue: dropdownValue,
                    ));
              },
              dropdownValue: dropdownValue,
            ),
            const Expanded(child: SizedBox()),
            BlocBuilder<PassengerBloc, PassengerState>(
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      var passenger = context.read<PassengerBloc>();
                      if (isPageValidated(state.fields)) {
                        var user = context.read<AppBloc>().state.user;

                        context
                            .read<PassengerBloc>()
                            .add(UpdateCurrentPassenger(
                              fieldKey: "passenger_id",
                              fieldValue: user.id,
                            ));
                        context
                            .read<PassengerBloc>()
                            .add(UpdateCurrentPassenger(
                              fieldKey: "passenger_phone_number",
                              fieldValue: user.phone,
                            ));
                      }
                      passenger.add(AddPassenger());
                      BlocProvider.of<ImageUploadBloc>(context)
                          .add(EmptyImageUrl());
                      AutoRouter.of(context).push(const TabBoxRoute());
                    },
                    child: const Text("Register"));
              },
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  Future<void> _getFromGallery() async {
    final selectedImage = await _picker.pickImage(
      maxWidth: 720,
      maxHeight: 720,
      source: ImageSource.gallery,
    );
    if (!mounted) return;
    if (selectedImage != null) {
      context.read<ImageUploadBloc>().add(
            UploadImage(
              pickedFile: selectedImage,
              oldFileUrl: personImageUrl,
            ),
          );
    }
  }

  Future<void> _getFromCamera() async {
    final selectedImage = await _picker.pickImage(
      maxWidth: 720,
      maxHeight: 720,
      source: ImageSource.camera,
    );
    if (!mounted) return;
    if (selectedImage != null) {
      context.read<ImageUploadBloc>().add(
            UploadImage(
              pickedFile: selectedImage,
              oldFileUrl: personImageUrl,
            ),
          );
    }
  }

  void selectImageDialog(BuildContext context) {
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
                    onTap: () async {
                      await _getFromGallery().then((value) {
                        Navigator.of(context).pop();
                      });
                    },
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
                    onTap: () async {
                      await _getFromCamera().then(
                        (value) {
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

bool isPageValidated(Map<String, dynamic> fields) {
  bool isValid = false;
  String fullName = fields["full_name"];
  // String address = fields["address"];
  if (fullName.isEmpty || fullName.length <= 2) {
    MyUtils.getMyToast(message: "To'liq ism sharfingizni kiriting");
  // } else if (address == '') {
  //   MyUtils.getMyToast(message: "manzilingizni kiriting");
  } else {
    isValid = true;
  }
  return isValid;
}

class DropdownButtonValue extends StatelessWidget {
  const DropdownButtonValue(
      {Key? key, required this.dropdownValue, required this.valueChanged})
      : super(key: key);

  final String dropdownValue;
  final ValueChanged valueChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      isExpanded: true,
      onChanged: (String? value) {
        valueChanged(value);
      },
      items: gender.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
