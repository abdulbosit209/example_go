import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gotaxi/utils/style.dart';

class UniversalTextInput extends StatefulWidget {
  const UniversalTextInput({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.caption,
    required this.initialText,
    required this.keyBoardType,
    required this.errorText,
  }) : super(key: key);

  final String hintText;
  final String initialText;
  final String caption;
  final String errorText;
  final TextInputType keyBoardType;

  final ValueChanged<String> onChanged;

  @override
  State<UniversalTextInput> createState() => _UniversalTextInputState();
}

class _UniversalTextInputState extends State<UniversalTextInput> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey key = GlobalKey();

  @override
  void initState() {
    controller.text = widget.initialText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextFormField(
          cursorColor: Colors.blue,
          keyboardType: widget.keyBoardType,
          controller: controller,
          onChanged: widget.onChanged,
          validator: (value) {
            if (widget.keyBoardType == TextInputType.text) {
              return (value!.length <= 3) ? widget.errorText : null;
            } else if (widget.keyBoardType == TextInputType.streetAddress) {
              return (value!.length > 13 || value.isEmpty)
                  ? widget.errorText
                  : null;
            }
            return null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: widget.caption,
            hintText: widget.hintText,
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
        ),
      ),
    );
  }
}
