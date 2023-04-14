import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotaxi/global_blocs/passenger_bloc/passenger_bloc.dart';
import 'package:gotaxi/presentation/passenger/tabbox/settings_page/widget/image_select.dart';
import 'package:gotaxi/utils/style.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController textEditingController = TextEditingController();

    var data = context.select((PassengerBloc bloc) => bloc.state.passengerModel.fullName);
    textEditingController.text = data;

    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Text(
              "Profile",
              style: MyTextStyle.sfProBold.copyWith(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const ImageSelect(),
            const SizedBox(height: 15),
            Text(
              data,
              style: MyTextStyle.sfProBold.copyWith(fontSize: 25),
            ),
            const SizedBox(height: 15),
            ListTile(
              onTap: (){},
              title: Text("App Settings", style: MyTextStyle.sfProMedium.copyWith(fontSize: 20)),
              leading: const Icon(Icons.settings_sharp),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
            ),
            const SizedBox(height: 5),
            ListTile(
              onTap: () async {
                String? text = await showDialog(context: context, builder: (context){
                  return NameDialog(textEditingController: textEditingController);
                });
                if(text != null){
                  if(!context.mounted) return;
                  context.read<PassengerBloc>().add(UpdatePassengerModel(
                      passengerModel: context.read<PassengerBloc>().state.passengerModel.copyWith(fullName: text),
                      docID: context.read<PassengerBloc>().state.passengerModel.passengerDocId
                  ));
                }
              },
              title: Text("Change account name", style: MyTextStyle.sfProMedium.copyWith(fontSize: 20)),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
            ),
            const SizedBox(height: 5),
            ListTile(
              onTap: (){},
              title: Text("Change account Image", style: MyTextStyle.sfProMedium.copyWith(fontSize: 20)),
              leading: const Icon(Icons.camera_alt),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
            ),
            const SizedBox(height: 5),
            ListTile(
              onTap: (){},
              title: Text("FAQ", style: MyTextStyle.sfProMedium.copyWith(fontSize: 20)),
              leading: const Icon(Icons.account_balance),
              trailing: const Icon(Icons.arrow_forward_ios_sharp),
            ),
            const SizedBox(height: 5),
            ListTile(
              onTap: (){},
              title: Text("Logout", style: MyTextStyle.sfProMedium.copyWith(fontSize: 20, color: Colors.red)),
              leading: const Icon(Icons.logout, color: Colors.red),
              // trailing: const Icon(Icons.arrow_forward_ios_sharp),
            ),
          ],
        ),
      ),
    ));

  }
}

class NameDialog extends StatelessWidget {
  const NameDialog({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        decoration: InputDecoration(
          labelText: "Ism",
          hintText: "Ism kiriting",
          hintStyle: MyTextStyle.sfProMedium.copyWith(),
          labelStyle: MyTextStyle.sfProMedium
              .copyWith(color: Theme.of(context).hintColor),
          enabled: true,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1)),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1)),
        ),
        controller: textEditingController,
      ),
      title: const Text("Ismni kiriting"),

      actions: [
        TextButton(
          child: const Text('no', style: TextStyle(fontSize: 20),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('yes', style: TextStyle(fontSize: 20),),
          onPressed: () {
            Navigator.of(context).pop(textEditingController.text);
          },
        ),
      ],
    );
  }
}

