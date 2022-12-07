import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localization/localization.dart';
import 'package:tasu/global/widgets/animated_switch.dart';
import 'package:tasu/global/widgets/responsive.dart';
import 'package:tasu/global/widgets/tr_widget.dart';
import 'package:tasu/main.dart';

class TfTitle extends StatefulWidget {
  final String title;
  final bool isRequired;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool? isMulti;
  final bool? autofocus;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final double vertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final int? maxLength;
  final bool expands;
  final int? maxLines;
  final bool? mustValidate;
  const TfTitle({
    Key? key,
    required this.title,
    required this.isRequired,
    this.expands = false,
    this.maxLength,
    this.style,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.autocorrect = true,
    this.inputFormatters,
    this.vertical = 0,
    this.onFieldSubmitted,
    this.focusNode,
    this.hintText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onTap,
    this.isMulti = false,
    this.readOnly = false,
    this.autofocus = false,
    this.errorText,
    this.label,
    this.suffix,
    this.prefix,
    this.enabled = true,
    this.onEditingCompleted,
    this.onChanged,
    this.maxLines = 1,
    this.mustValidate,
  }) : super(key: key);

  @override
  State<TfTitle> createState() => _TdState();
}

class _TdState extends State<TfTitle> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.hintText != null) {
      controller.text = widget.hintText!;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onchange(String str) {
    widget.onChanged ?? (str);
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.title.i18n(),
                  style: const TextStyle(color: Color(0xffc8c3bc)),
                ),
                Text(
                  widget.isRequired ? '*' : '',
                  textAlign: TextAlign.start,
                  style: const TextStyle(color: Colors.red),
                )
              ],
            ),
            Container(
              width: 194,
              height: 24,
              margin: const EdgeInsets.only(top: 4),
              child: TextFormField(
                scrollPadding: const EdgeInsets.symmetric(horizontal: 4),
                controller: controller,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                maxLines: widget.maxLines,
                onChanged: onchange,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  // hintText: widget.hintText,
                  hintStyle: const TextStyle(color: Colors.white),
                  floatingLabelStyle: const TextStyle(color: Colors.white),
                  errorStyle: const TextStyle(height: .01),
                  fillColor: const Color(0xff736b5e),
                  focusColor: const Color(0xffdcd9d9),
                  hoverColor: Colors.white,

                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Color(0xff3a3f42),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Color(0xff3a3f42),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 105, 129, 158),
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

class TfStandart extends StatefulWidget {
  final bool isRequired;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool? autofocus;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final double vertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final int? maxLength;
  const TfStandart({
    Key? key,
    required this.isRequired,
    this.maxLength,
    this.style,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.autocorrect = true,
    this.inputFormatters,
    this.vertical = 0,
    this.onFieldSubmitted,
    this.focusNode,
    this.hintText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.autofocus = false,
    this.errorText,
    this.label,
    this.suffix,
    this.prefix,
    this.enabled = true,
    this.onEditingCompleted,
    this.onChanged,
  }) : super(key: key);

  @override
  State<TfStandart> createState() => _TfStandartState();
}

class _TfStandartState extends State<TfStandart> {
  late TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.hintText != null) {
      controller.text = widget.hintText!;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onchange(String str) {
    widget.onChanged ?? (str);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        width: 194,
        height: 24,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 4),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white, fontSize: 14),
          onChanged: onchange,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            // hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.white),
            floatingLabelStyle: const TextStyle(color: Colors.white),
            errorStyle: const TextStyle(height: .01),
            fillColor: const Color(0xff736b5e),
            focusColor: const Color(0xffdcd9d9),
            hoverColor: Colors.white,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(0xff3a3f42),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color(0xff3a3f42),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 105, 129, 158),
                width: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TfRich extends StatefulWidget {
  final String title;
  final bool isRequired;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool? isMulti;
  final bool? autofocus;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final double vertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final int? maxLength;
  final bool expands;
  final int? maxLines;
  final bool? mustValidate;
  const TfRich({
    Key? key,
    required this.title,
    required this.isRequired,
    this.expands = false,
    this.maxLength,
    this.style,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.autocorrect = true,
    this.inputFormatters,
    this.vertical = 0,
    this.onFieldSubmitted,
    this.focusNode,
    this.hintText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onTap,
    this.isMulti = false,
    this.readOnly = false,
    this.autofocus = false,
    this.errorText,
    this.label,
    this.suffix,
    this.prefix,
    this.enabled = true,
    this.onEditingCompleted,
    this.onChanged,
    this.maxLines = 1,
    this.mustValidate,
  }) : super(key: key);

  @override
  State<TfRich> createState() => _TfRichState();
}

class _TfRichState extends State<TfRich> {
  late TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.hintText != null) {
      controller.text = widget.hintText!;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onchange(String str) {
    widget.onChanged ?? (str);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title.i18n(),
                style: const TextStyle(color: Color(0xffc8c3bc)),
              ),
              Text(
                widget.isRequired ? '*' : '',
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.red),
              )
            ],
          ),
          Container(
            width: 194,
            height: 73,
            margin: const EdgeInsets.only(top: 4),
            child: TextFormField(
              scrollPadding: const EdgeInsets.symmetric(horizontal: 4),
              controller: controller,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
              maxLines: widget.maxLines,
              onChanged: onchange,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                // hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.white),
                floatingLabelStyle: const TextStyle(color: Colors.white),
                errorStyle: const TextStyle(height: .01),
                fillColor: const Color(0xff736b5e),
                focusColor: const Color(0xffdcd9d9),
                hoverColor: Colors.white,

                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Color(0xff3a3f42),
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Color(0xff3a3f42),
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 105, 129, 158),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TfDropdown extends StatefulWidget {
  final List<String>? items;
  final bool isRequired;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool? isMulti;
  final bool? autofocus;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final double vertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final int? maxLength;
  final bool expands;
  final int? maxLines;
  final bool? mustValidate;
  const TfDropdown({
    Key? key,
    this.items,
    required this.isRequired,
    this.expands = false,
    this.maxLength,
    this.style,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.autocorrect = true,
    this.inputFormatters,
    this.vertical = 0,
    this.onFieldSubmitted,
    this.focusNode,
    this.hintText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onTap,
    this.isMulti = false,
    this.readOnly = false,
    this.autofocus = false,
    this.errorText,
    this.label,
    this.suffix,
    this.prefix,
    this.enabled = true,
    this.onEditingCompleted,
    this.onChanged,
    this.maxLines = 1,
    this.mustValidate,
  }) : super(key: key);

  @override
  State<TfDropdown> createState() => _TfDropdownState();
}

class _TfDropdownState extends State<TfDropdown> {
  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.hintText != null) {
      controller.text = widget.hintText!;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onchange(String str) {
    widget.onChanged ?? (str);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 194,
      height: 24,
      margin: const EdgeInsets.only(top: 4),
      child: DropdownButtonFormField(
        dropdownColor: Colors.black,
        alignment: Alignment.center,
        isDense: true,
        autofocus: false,
        borderRadius: BorderRadius.circular(2),
        items: widget.items == null
            ? []
            : widget.items!
                .map(
                  (e) => DropdownMenuItem(
                    alignment: Alignment.center,
                    key: ValueKey(e),
                    value: e,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2)),
                        child: Text(e)),
                  ),
                )
                .toList(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        onChanged: (s) {},
        decoration: InputDecoration(
          // hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.white),
          floatingLabelStyle: const TextStyle(color: Colors.white),
          errorStyle: const TextStyle(height: .01),
          fillColor: const Color(0xff736b5e),
          focusColor: const Color(0xffdcd9d9),
          hoverColor: Colors.white,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color(0xff3a3f42),
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color(0xff3a3f42),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 105, 129, 158),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class TfDropdownTitle extends StatefulWidget {
  final List<String>? items;
  final String title;
  final bool isRequired;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool? isMulti;
  final bool? autofocus;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final double vertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final int? maxLength;
  final bool expands;
  final int? maxLines;
  final bool? mustValidate;
  const TfDropdownTitle({
    Key? key,
    this.items,
    required this.title,
    required this.isRequired,
    this.expands = false,
    this.maxLength,
    this.style,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.autocorrect = true,
    this.inputFormatters,
    this.vertical = 0,
    this.onFieldSubmitted,
    this.focusNode,
    this.hintText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onTap,
    this.isMulti = false,
    this.readOnly = false,
    this.autofocus = false,
    this.errorText,
    this.label,
    this.suffix,
    this.prefix,
    this.enabled = true,
    this.onEditingCompleted,
    this.onChanged,
    this.maxLines = 1,
    this.mustValidate,
  }) : super(key: key);

  @override
  State<TfDropdownTitle> createState() => _TfDropdownTitleState();
}

class _TfDropdownTitleState extends State<TfDropdownTitle> {
  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.hintText != null) {
      controller.text = widget.hintText!;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onchange(String str) {
    widget.onChanged ?? (str);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 194,
      height: 24,
      margin: const EdgeInsets.only(top: 4),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.title.i18n(),
                style: const TextStyle(color: Color(0xffc8c3bc)),
              ),
              Text(
                widget.isRequired ? '*' : '',
                textAlign: TextAlign.start,
                style: const TextStyle(color: Colors.red),
              )
            ],
          ),
          DropdownButtonFormField(
            dropdownColor: Colors.black,
            alignment: Alignment.center,
            isDense: true,
            autofocus: false,
            borderRadius: BorderRadius.circular(2),
            items: widget.items == null
                ? []
                : widget.items!
                    .map(
                      (e) => DropdownMenuItem(
                        alignment: Alignment.center,
                        key: ValueKey(e),
                        value: e,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2)),
                            child: Text(e)),
                      ),
                    )
                    .toList(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            onChanged: (s) {},
            decoration: InputDecoration(
              // hintText: widget.hintText,
              hintStyle: const TextStyle(color: Colors.white),
              floatingLabelStyle: const TextStyle(color: Colors.white),
              errorStyle: const TextStyle(height: .01),
              fillColor: const Color(0xff736b5e),
              focusColor: const Color(0xffdcd9d9),
              hoverColor: Colors.white,

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xff3a3f42),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xff3a3f42),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 105, 129, 158),
                  width: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RadioWidget extends StatefulWidget {
  const RadioWidget({
    Key? key,
    required this.onchange,
    this.val,
  }) : super(key: key);
  final int? val;
  final ValueChanged<int> onchange;

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  late ValueNotifier<int> _radio;

  @override
  void initState() {
    _radio = ValueNotifier(widget.val ?? 1);
    super.initState();
  }

  @override
  void dispose() {
    _radio.dispose();
    super.dispose();
  }

  void onchage(int i) {
    _radio.value = i;
    widget.onchange(i);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Responsive.isWebOrDesktop() ? const Spacer(flex: 7) : const SizedBox(),
        Container(
            constraints: const BoxConstraints(maxHeight: 32, maxWidth: 400),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(
                  color: const Color(0xffd9d9d9),
                )),
            child: ValueListenableBuilder<int>(
              valueListenable: _radio,
              builder: (context, radio, child) => AnimatedSwitchWidget(
                duration: 300,
                child: Row(
                  key: ValueKey(radio),
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          onchage(1);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color:
                                  radio == 1 ? Colors.blue : Colors.transparent,
                            ),
                            alignment: Alignment.center,
                            child: TextButton.icon(
                              autofocus: false,
                              style: const ButtonStyle(
                                alignment: Alignment.center,
                              ),
                              onPressed: null,
                              icon: const Icon(Icons.boy),
                              label: Text(
                                'Male',
                                style: TextStyle(
                                  color:
                                      radio == 1 ? Colors.white : Colors.black,
                                ),
                              ),
                            )),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          onchage(0);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color:
                                  radio == 0 ? Colors.pink : Colors.transparent,
                            ),
                            alignment: Alignment.center,
                            child: TextButton.icon(
                              autofocus: false,
                              style: const ButtonStyle(
                                alignment: Alignment.center,
                              ),
                              onPressed: null,
                              icon: const Icon(
                                Icons.girl,
                              ),
                              label: Text(
                                'Female',
                                style: TextStyle(
                                  color:
                                      radio == 0 ? Colors.white : Colors.black,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )),
        Responsive.isWebOrDesktop() ? const Spacer(flex: 7) : const SizedBox(),
      ],
    );
  }
}

class SearchingTextField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;

  final bool? isMulti;
  final bool? autofocus;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final double vertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final int? maxLength;
  final bool expands;
  final int? maxLines;
  final VoidCallback clearCall;
  const SearchingTextField(
      {Key? key,
      required this.clearCall,
      this.expands = false,
      this.maxLength,
      this.style,
      this.textAlign = TextAlign.start,
      this.textInputAction,
      this.autocorrect = true,
      // this.onSaved,
      this.inputFormatters,
      this.vertical = 0,
      this.onFieldSubmitted,
      this.focusNode,
      this.hintText,
      // this.controller,
      // this.validator,
      this.prefixIcon,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.onTap,
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      this.errorText,
      this.label,
      this.suffix,
      this.prefix,
      this.enabled = true,
      this.onEditingCompleted,
      // this.height = 30,
      // this.width = 125,
      this.onChanged,
      this.maxLines = 1})
      : super(key: key);

  @override
  State<SearchingTextField> createState() => _SearchingTextFieldState();
}

class _SearchingTextFieldState extends State<SearchingTextField> {
  late TextEditingController controller;
  late ValueNotifier<bool> clearIcon;

  @override
  void initState() {
    super.initState();
    clearIcon = ValueNotifier(false);
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    clearIcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ValueListenableBuilder<Locale>(
            valueListenable: mainState.language,
            builder: (context, value, child) =>
                // ignore: prefer_const_constructors
                _TrTitle(title: 'l_Search'),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
          Expanded(
              flex: 5,
              child: Stack(
                alignment: Alignment.centerLeft,
                fit: StackFit.passthrough,
                children: [
                  TextFormField(
                    controller: controller,
                    style: widget.style,
                    maxLength: widget.maxLength,
                    textInputAction: widget.textInputAction,
                    onSaved: (s) {
                      controller.clear();
                    },
                    inputFormatters: widget.inputFormatters,
                    onFieldSubmitted: widget.onFieldSubmitted,
                    autocorrect: widget.autocorrect,
                    textAlign: widget.textAlign,
                    onChanged: (str) {
                      widget.onChanged!(str);
                      if (str.isNotEmpty) {
                        clearIcon.value = true;
                        widget.onChanged!(str);
                      } else {
                        clearIcon.value = false;
                      }
                    },
                    onEditingComplete: widget.onEditingCompleted,
                    autofocus: widget.autofocus!,
                    expands: widget.expands,
                    maxLines: widget.maxLines,
                    decoration: InputDecoration(
                      constraints:
                          const BoxConstraints(maxHeight: 32, maxWidth: 100),
                      errorStyle: const TextStyle(height: .01),
                      fillColor: const Color(0xffd9d9d9),
                      focusColor: const Color(0xffd9d9d9),
                      hoverColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      filled: false,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(2),
                          borderSide:
                              const BorderSide(color: Color(0xffd9d9d9))),
                      hintText: widget.hintText,
                      prefixIcon: widget.prefixIcon,
                    ),
                    onTap: widget.onTap,
                    enabled: widget.enabled,
                    readOnly: widget.readOnly!,
                    obscureText: widget.obscureText!,
                    keyboardType: widget.keyboardType,
                    textAlignVertical: TextAlignVertical.center,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ValueListenableBuilder<bool>(
                          valueListenable: clearIcon,
                          builder: (context, value, child) => value
                              ? _clearBtn(() {
                                  controller.clear();
                                  clearIcon.value = false;
                                  widget.clearCall();
                                })
                              : const SizedBox()),
                    ),
                  )
                ],
              )),
          Responsive.isWebOrDesktop()
              ? const Spacer(flex: 7)
              : const SizedBox(),
        ],
      ),
    );
  }
}

class StandartTextField extends StatefulWidget {
  final String title;
  final bool isRequired;

  // final FormFieldValidator<String>? validator;
  // final FormFieldSetter<String>? onSaved;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool? isMulti;
  final bool? autofocus;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final double vertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final int? maxLength;
  final bool expands;
  final int? maxLines;
  final bool? mustValidate;

  // ignore: prefer_const_constructors_in_immutables
  StandartTextField({
    Key? key,
    required this.title,
    required this.isRequired,
    this.expands = false,
    this.maxLength,
    this.style,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.autocorrect = true,

    // this.onSaved,
    this.inputFormatters,
    this.vertical = 0,
    this.onFieldSubmitted,
    this.focusNode,
    this.hintText,
    // this.controller,
    // this.validator,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onTap,
    this.isMulti = false,
    this.readOnly = false,
    this.autofocus = false,
    this.errorText,
    this.label,
    this.suffix,
    this.prefix,
    this.enabled = true,
    this.onEditingCompleted,
    // this.height = 30,
    // this.width = 125,
    this.onChanged,
    this.maxLines = 1,
    this.mustValidate,
  }) : super(key: key);

  @override
  State<StandartTextField> createState() => _StandartTextFieldState();
}

class _StandartTextFieldState extends State<StandartTextField> {
  final TextEditingController controller = TextEditingController();
  late ValueNotifier<bool> clearIcon;
  // late ValueNotifier<bool> validated;
  @override
  void initState() {
    super.initState();
    clearIcon = ValueNotifier(false);

    // validated = ValueNotifier(true);
    //////////!
    if (widget.hintText != null) {
      controller.text = widget.hintText!;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    clearIcon.dispose();
    // validated.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant StandartTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(4.0),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
              controller: controller,
              style: widget.style,
              maxLength: widget.maxLength,
              textInputAction: widget.textInputAction,
              onSaved: (s) {
                controller.clear();
              }, //widget.onSaved,
              inputFormatters: widget.inputFormatters,
              // smartQuotesType: SmartQuotesType.enabled,
              onFieldSubmitted: widget.onFieldSubmitted,
              autocorrect: widget.autocorrect,
              textAlign: widget.textAlign,
              onChanged: (str) {
                if (str.isNotEmpty) {
                  clearIcon.value = true;
                  widget.onChanged!(str);
                } else {
                  clearIcon.value = false;
                }
              },
              onEditingComplete: widget.onEditingCompleted,
              autofocus: widget.autofocus!,
              maxLines: widget.maxLines,
              decoration: InputDecoration(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.isRequired ? "*" : '',
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                      style: const TextStyle(color: Colors.red),
                    ),
                    Flexible(
                      child: TrWidget(
                        trkey: widget.label ?? '',
                        softWrap: false,
                        alignment: null,
                      ),
                    ),
                  ],
                ),

                constraints: const BoxConstraints(maxHeight: 32, maxWidth: 400),
                errorStyle: const TextStyle(height: .01),
                fillColor: const Color(0xffd9d9d9),
                focusColor: const Color(0xffd9d9d9),
                hoverColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                // suffixIcon: ,
                // suffix: Icon(Icons.view_agenda),
                filled: false,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: const BorderSide(color: Color(0xffd9d9d9))),
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
              ),
              onTap: widget.onTap,
              enabled: widget.enabled,
              readOnly: widget.readOnly!,
              obscureText: widget.obscureText!,
              keyboardType: widget.keyboardType,
              textAlignVertical: TextAlignVertical.center,
              validator: (str) {
                if (widget.mustValidate == null) {
                  if (str!.isEmpty && widget.isRequired) {
                    // validated.value = false;
                    return "";
                  } else {
                    // validated.value = true;
                    return null;
                  }
                } else {
                  if (str!.isEmpty) {
                    // validated.value = false;
                    return "";
                  } else {
                    // validated.value = true;
                    return null;
                  }
                }
              }),
          IntrinsicWidth(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ValueListenableBuilder<bool>(
                  //   valueListenable: validated,
                  //   builder: (context, vali, child) => vali
                  //       ? const SizedBox()
                  //       : const Text("!",
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.red)),
                  // ),
                  ValueListenableBuilder<bool>(
                      valueListenable: clearIcon,
                      builder: (context, value, child) => value
                          ? _clearBtn(() {
                              controller.text = '';
                              controller.clear();

                              clearIcon.value = false;
                            })
                          : const SizedBox()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

InkWell _clearBtn(VoidCallback onTap) {
  return InkWell(
      onTap: onTap,
      child: const Icon(
        Icons.clear,
        color: Colors.lightBlue,
      ));
}

class _TrTitle extends StatelessWidget {
  final String title;
  const _TrTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var mainState = getIt<MainState>();

    // final MainState mainState = MainState();

    return ValueListenableBuilder<Locale>(
        valueListenable: mainState.language,
        builder: (context, value, child) => AnimatedSwitchWidget(
                child: Text(
              "${title.i18n()} :",
              style: const TextStyle(fontSize: 20),
              key: ValueKey(value),
              textAlign: TextAlign.right,
              maxLines: 3,
            )));
  }
}

class PasswordTextField extends StatefulWidget {
  final String title;
  // final FormFieldValidator<String>? validator;
  // final FormFieldSetter<String>? onSaved;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool? isMulti;
  final bool? autofocus;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final double vertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final int? maxLength;

  // ignore: prefer_const_constructors_in_immutables
  PasswordTextField(
      {Key? key,
      required this.title,
      this.maxLength,
      this.style,
      this.textAlign = TextAlign.start,
      this.textInputAction,
      this.autocorrect = true,
      // this.onSaved,
      this.inputFormatters,
      this.vertical = 0,
      this.onFieldSubmitted,
      this.focusNode,
      this.hintText,
      // this.controller,
      // this.validator,
      this.prefixIcon,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.onTap,
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      this.errorText,
      this.label,
      this.suffix,
      this.prefix,
      this.enabled = true,
      this.onEditingCompleted,
      // this.height = 30,
      // this.width = 125,
      this.onChanged})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  late ValueNotifier<bool> _show;
  late TextEditingController controller;
  late ValueNotifier<bool> validated;

  void show() {
    _show.value = !_show.value;
  }

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    _show = ValueNotifier(true);
    validated = ValueNotifier(true);
    if (widget.hintText != null) {
      controller.text = widget.hintText!;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    _show.dispose();
    validated.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Container(
          alignment: Alignment.center,
          child: ValueListenableBuilder<bool>(
            valueListenable: _show,
            builder: (context, showPass, child) => Stack(
              alignment: Alignment.centerRight,
              children: [
                TextFormField(
                  controller: controller,
                  style: widget.style,
                  maxLength: widget.maxLength,
                  textInputAction: widget.textInputAction,
                  inputFormatters: widget.inputFormatters,
                  // smartQuotesType: SmartQuotesType.enabled,

                  onFieldSubmitted: widget.onFieldSubmitted,
                  autocorrect: widget.autocorrect,
                  textAlign: widget.textAlign,
                  onChanged: widget.onChanged,
                  onEditingComplete: widget.onEditingCompleted,
                  autofocus: widget.autofocus!,
                  decoration: InputDecoration(
                    constraints:
                        const BoxConstraints(maxHeight: 32, maxWidth: 400),
                    errorStyle: const TextStyle(height: .01),
                    fillColor: const Color(0xffd9d9d9),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    filled: false,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2),
                      gapPadding: 7,
                      borderSide: const BorderSide(color: Color(0xffd9d9d9)),
                    ),
                    hintText: widget.hintText,
                    prefixIcon: widget.prefixIcon,
                  ),
                  onTap: widget.onTap,
                  enabled: widget.enabled,
                  readOnly: widget.readOnly!,
                  obscureText: showPass,
                  keyboardType: widget.keyboardType,
                  onSaved: (s) {
                    controller.clear();
                  },
                  validator: (str) {
                    if (str!.isEmpty) {
                      validated.value = false;
                      return "";
                    } else {
                      validated.value = true;
                      return null;
                    }
                  },
                ),
                IntrinsicWidth(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ValueListenableBuilder<bool>(
                        //   valueListenable: validated,
                        //   builder: (context, vali, child) => vali
                        //       ? const SizedBox()
                        //       : const Padding(
                        //           padding: EdgeInsets.only(right: 4),
                        //           child: Text("!",
                        //               style: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   color: Colors.red)),
                        //         ),
                        // ),
                        InkWell(
                          autofocus: false,
                          onTap: () {
                            show();
                          },
                          child: ValueListenableBuilder<bool>(
                              valueListenable: _show,
                              builder: (context, value, child) => Icon(value
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class RichTextField extends StatefulWidget {
  final bool isRequired;
  final String title;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;

  final bool? autofocus;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final double vertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final int? maxLength;
  final bool? expands;

  final int? maxLines;

  // ignore: prefer_const_constructors_in_immutables
  RichTextField(
      {Key? key,
      required this.title,
      this.maxLength,
      this.style,
      this.textAlign = TextAlign.start,
      this.textInputAction,
      this.autocorrect = true,
      this.onSaved,
      this.inputFormatters,
      this.vertical = 0,
      this.onFieldSubmitted,
      this.focusNode,
      this.hintText,
      // this.controller,
      this.validator,
      this.prefixIcon,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.onTap,
      this.readOnly = false,
      this.autofocus = false,
      this.errorText,
      this.label,
      this.suffix,
      this.prefix,
      this.enabled = true,
      this.onEditingCompleted,
      // this.height = 30,
      // this.width = 125,
      this.onChanged,
      required this.isRequired,
      this.expands,
      this.maxLines})
      : super(key: key);

  @override
  State<RichTextField> createState() => _RichTextFieldState();
}

class _RichTextFieldState extends State<RichTextField> {
  late TextEditingController controller;
  late ValueNotifier<bool> clearIcon;

  @override
  void initState() {
    super.initState();
    clearIcon = ValueNotifier(false);
    controller = TextEditingController();
    if (widget.hintText != null) {
      controller.text = widget.hintText!;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    clearIcon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(4.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          TextFormField(
              minLines: widget.maxLines,
              controller: controller,
              style: widget.style,
              maxLength: widget.maxLength,
              textInputAction: widget.textInputAction,
              onSaved: widget.onSaved,
              inputFormatters: widget.inputFormatters,
              // smartQuotesType: SmartQuotesType.enabled,
              onFieldSubmitted: widget.onFieldSubmitted,
              autocorrect: widget.autocorrect,
              textAlign: widget.textAlign,
              onChanged: (str) {
                if (str.isNotEmpty) {
                  clearIcon.value = true;
                  widget.onChanged!(str);
                } else {
                  clearIcon.value = false;
                }
              },
              onEditingComplete: widget.onEditingCompleted,
              autofocus: widget.autofocus!,
              // expands: widget.expands!,
              maxLines: widget.maxLines,
              decoration: InputDecoration(
                label: TrWidget(
                  trkey: widget.label!,
                  softWrap: false,
                  alignment: null,
                ),
                constraints:
                    const BoxConstraints(maxHeight: 100, maxWidth: 400),
                errorStyle: const TextStyle(height: .4),
                fillColor: const Color(0xffd9d9d9),
                focusColor: const Color(0xffd9d9d9),
                hoverColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                filled: false,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                    borderSide: const BorderSide(color: Color(0xffd9d9d9))),
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
              ),
              onTap: widget.onTap,
              enabled: widget.enabled,
              readOnly: widget.readOnly!,
              obscureText: widget.obscureText!,
              keyboardType: widget.keyboardType,
              validator: widget.validator),
          IntrinsicWidth(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ValueListenableBuilder<bool>(
                  valueListenable: clearIcon,
                  builder: (context, value, child) => value
                      ? _clearBtn(
                          () {
                            controller.clear();
                            clearIcon.value = false;
                          },
                        )
                      : const SizedBox()),
            ),
          ),
        ],
      ),
    );
  }
}

class PickFileWidget extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  PickFileWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<PickFileWidget> createState() => _PickFileWidgetState();
}

class _PickFileWidgetState extends State<PickFileWidget> {
  late final ValueNotifier<Uint8List?> imageFile;
  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      imageFile.value = file.bytes;
    } else {
      imageFile.value = null;
    }
  }

  @override
  void initState() {
    super.initState();
    imageFile = ValueNotifier(null);
  }

  @override
  void dispose() {
    imageFile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(4.0),
      child: Container(
        height: 77,
        padding: const EdgeInsets.all(4),
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 77),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(2)),
        child: ValueListenableBuilder<Uint8List?>(
          valueListenable: imageFile,
          builder: (context, value, child) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              value == null
                  ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.image),
                    )
                  : Image.memory(value),
              TextButton.icon(
                icon: const Icon(Icons.file_open),
                label:
                    TrWidget(trkey: 'l_PickImage', alignment: Alignment.center),
                onPressed: () {
                  pickFile();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
