import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tasu/client/futures/settings/view/sub/futures/organization/view/dialog/widget/title_widget.dart';

TextStyle _style = const TextStyle(
    color: Color(0XFFc8c3bc), fontSize: 12, fontWeight: FontWeight.w400);

class SignatureWidget extends StatelessWidget {
  const SignatureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      // color: Colors.amber,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          title(
            'l_Print',
          ),
          btn(),
          const Divider(
            thickness: 1.5,
            color: Colors.white,
          ),
          title(
            'l_CompanyLogotype',
          ),
          btn(),
          const Divider(
            thickness: 1.5,
            color: Colors.white,
          ),
          title(
            'l_Signature',
          ),
          btn(),
          const Divider(
            thickness: 1.5,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
    } else {}
  }

  Widget btn() => Material(
        color: Colors.transparent,
        child: Center(
          child: IconButton(
              onPressed: () {
                pickFile();
              },
              icon: const Icon(
                Icons.picture_as_pdf,
                size: 40,
              )),
        ),
      );
}
