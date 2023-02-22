import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiver/strings.dart';
import 'package:mobile_apps/constants/color.dart' as color;
// import 'package:sunmotor_project/common/validations.dart';
// import 'package:sunmotor_project/ui/common/text.dart';

class ClearableTextInput extends StatefulWidget {
  final Function(String) onChange;
  final String? value;
  final String? hintText;
  final TextStyle? style;
  final TextInputType? keyboardType;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final bool? obscureText;

  const ClearableTextInput({
    required this.onChange,
    required this.hintText,
    this.value,
    this.style,
    this.keyboardType,
    this.maxLines,
    this.contentPadding,
    this.border,
    this.focusedBorder,
    this.obscureText,
  });
  @override  State<StatefulWidget> createState() => _TextInputState(value);
}
class _TextInputState extends State<ClearableTextInput> {
  final _focus = new FocusNode();
  final _controller;
  bool clearable = false;
  bool focused = false;
  _TextInputState(value)
      : _controller = isBlank(value)
      ? TextEditingController()
      : TextEditingController.fromValue(TextEditingValue(text: value));

  @override
  void initState() {
    _controller.addListener(() => isClearable());
    _controller.addListener(() => widget.onChange(_controller.text));
    _focus.addListener(() => focused = !focused);
    super.initState();
  }

  @override  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void isClearable() {
    setState(() {
      clearable = !isBlank(_controller.text);
    });
  }
  @override  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.sentences,
      obscureText: widget.obscureText ?? false,
      style: widget.style,
      keyboardType: widget.keyboardType ?? (widget.maxLines == 1 ? TextInputType.text : TextInputType.multiline),
      maxLines: widget.maxLines ?? 1,
      focusNode: _focus,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        hintText: widget.hintText,
        border: widget.border ?? const OutlineInputBorder(),
        focusedBorder: widget.focusedBorder ?? const OutlineInputBorder(),
        isDense: true,
        suffixIcon: focused ? IconButton(
          icon: const Icon(Icons.clear),
          disabledColor: Colors.transparent,
          onPressed: clearable ? () => WidgetsBinding.instance.addPostFrameCallback((_) => _controller.clear()) : null,
        ) : null,
      ),
    );
  }
}


class CustomTextFormField extends StatefulWidget {
  final Function(String?)? onSaved;
  final void Function()? onChange;
  final String? hintText;
  final String? labelText;
  final TextStyle? style;
  final TextInputType keyboardType;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscureText;
  final bool? validate;
  final bool? disabled;
  final TextAlign? textAlign;
  final String? value;
  final String? errorText;
  final InputBorder? border;
  final InputBorder? borderFocused;
  final Widget? prefixIcon;
  final double? suffixIconSize;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatter;
  final regEx = RegExp(CustomTextFormField.pattern);
  static const pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  CustomTextFormField({
    super.key,
    this.onSaved,
    this.onChange,
    this.hintText,
    this.labelText,
    this.errorText,
    this.style,
    this.keyboardType = TextInputType.text,
    this.maxLines,
    this.contentPadding,
    this.obscureText = false,
    this.validate = true,
    this.disabled = false,
    this.inputFormatter,
    this.textAlign,
    this.border,
    this.borderFocused,
    this.prefixIcon,
    this.suffixIconSize,
    this.textInputAction,
    this.value
  });

  @override  CustomTextFormFieldState createState() {
    // ignore: no_logic_in_create_state
    return CustomTextFormFieldState(value);
  }
}
class CustomTextFormFieldState extends State<CustomTextFormField> {
  // ignore: prefer_typing_uninitialized_variables
  final _controller;
  bool touched;
  bool _obscureText = true;
  CustomTextFormFieldState(value)  : _controller = isBlank(value) ? TextEditingController() : TextEditingController.fromValue(TextEditingValue(text: value)), touched = isNotEmpty(value);

  @override  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: widget.keyboardType ?? (widget.maxLines == 1 ? TextInputType.text : TextInputType.multiline),
      maxLines: widget.maxLines ?? 1,
      style: widget.style ?? TextStyle(fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color.fromRGBO(0, 0, 0, !(widget!.disabled!) ? 0.8 : 0.6)),
      inputFormatters: widget.inputFormatter,
      obscureText: widget.obscureText ? _obscureText : false,
      validator: (value) {
        if (widget.validate!) {
          return widget.keyboardType == TextInputType.emailAddress ? _validateEmail(value!) : _validateValue(value!);
        }
        return null;
      },
      onChanged: (String value) => setState(() {
        touched = isNotEmpty(value);
        widget.onChange;
      }),
      enabled: !widget.disabled!,
      onSaved: widget.onSaved,
      textAlign: widget.textAlign ?? TextAlign.start,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.lightGreen,
        // isDense: true,
        border: widget.border ?? const OutlineInputBorder(),
        contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(vertical: 17.5),
        errorStyle: const TextStyle(color: color.primary, fontSize: 14),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 1,),
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: widget.borderFocused ?? const OutlineInputBorder(),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.75),
          borderRadius: BorderRadius.circular(50),
        ),
        hintText: widget.hintText ?? "",
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        prefixIconColor: Color.fromRGBO(0, 0, 0, !(widget!.disabled!) ? 0.5 : 0.3),
        // prefixStyle: TextStyle(),
        suffixIcon: widget.obscureText == true ?
          InkWell(
            child: _obscureText ?
              Icon(Icons.visibility_off, size: widget.suffixIconSize ?? 22.5, color: Color.fromRGBO(0, 0, 0, !(widget!.disabled!) ? 0.5 : 0.3)) :
              Icon(Icons.visibility, size: widget.suffixIconSize ?? 22.5, color: Color.fromRGBO(0, 0, 0, !(widget!.disabled!) ? 0.5 : 0.3)),
            onTap: () => _toggle(),
          ) : (
            touched ? InkWell(
              child: Icon(Icons.highlight_off, size: 22.5, color: Color.fromRGBO(0, 0, 0, !(widget!.disabled!) ? 0.5 : 0.3)),
              onTap: () => _clearInput(),
            ) : null
          // touched ? GestureDetector(
          //  /* child: InkWell(
          //     child:
          //
          //   ),*/
          //   // child: SizedBox(
          //   //   width: 0,
          //   //   child: Icon(Icons.highlight_off, size: widget.suffixIconSize ?? 22.5, color: Color.fromRGBO(0, 0, 0, !(widget!.disabled!) ? 0.5 : 0.3)),
          //   // ),
          //   // child: Padding(
          //   //   padding: EdgeInsets.symmetric(horizontal: 5),
          //   //   child: Icon(Icons.highlight_off),
          //   // ),
          //   child: Container(
          //     color: Colors.red,
          //     width: 0,
          //     alignment: Alignment(-0.99, 0.0),
          //     child: Icon(Icons.highlight_off, size: widget.suffixIconSize ?? 22.5, color: Color.fromRGBO(0, 0, 0, !(widget!.disabled!) ? 0.5 : 0.3)),
          //   ),
          //   onTap: () => _clearInput(),
          // ) : null
        ),
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _clearInput() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _controller.clear());
    setState(() {
      touched = false;
    });
  }

  String? _validateValue(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return widget.errorText == null ? "    Input tidak boleh kosong." : "    ${widget.errorText!}";
    }
    return null;
  }

  String? _validateEmail(String email) {
    email = email.trim();
    if (email.isEmpty) {
      return "Email field cannot be empty";
    } else if (!widget.regEx.hasMatch(email)) {
      return "Invalid email: use 'email@provider.domain' form";
    }
    return null;
  }
}

// class EmailFormField extends StatefulWidget {
//   final regEx = RegExp(EmailFormField.pattern);
//   static const pattern =      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   final Function(String) onSaved;
//   final bool showHelpText;
//   EmailFormField({
//     required Key key,
//     required this.onSaved,
//     showHelpText
//   }) : showHelpText = showHelpText ?? true, super(key: key);
//   @override  _EmailFormFieldState createState() => _EmailFormFieldState();
// }

// class _EmailFormFieldState extends State<EmailFormField> {
//   final _controller = TextEditingController();
//   bool touched = false;
//   @override  void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   @override  Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           FormTitleText(text: "Email"),
//           if (widget.showHelpText)
//             Text(
//               "The address should be of a form email@provider.domain. "              "For example: email@example.com",
//               style: Theme.of(context).textTheme.body1.copyWith(fontSize: 14),
//             ),
//           TextFormField(
//             controller: _controller,
//             maxLines: 1,
//             keyboardType: TextInputType.emailAddress,
//             autofocus: false,
//             validator: (value) => _validateEmail(value),
//             onChanged: (String value) => setState(() {
//               this.touched = isNotEmpty(value);
//             }),
//             onSaved: (value) => widget.onSaved(value),
//             decoration: touched                ? InputDecoration(
//               suffixIcon: InkWell(
//                 child: Icon(Icons.clear, color: Colors.grey),
//                 onTap: () => _clearInput(),
//               ),
//             )
//                 : null,
//           ),
//         ],
//       ),
//     );
//   }
//   void _clearInput() {
//     WidgetsBinding.instance.addPostFrameCallback((_) => _controller.clear());
//     setState(() {
//       touched = false;
//     });
//   }
//   String _validateEmail(String email) {
//     email = email.trim();
//     if (email.length == 0) {
//       return "Email field cannot be empty";
//     } else if (!widget.regEx.hasMatch(email)) {
//       return "Invalid email: use 'email@provider.domain' form";
//     } else {
//       return null;
//     }
//   }
// }
// class SignInPasswordFormField extends StatefulWidget {
//   final Function(String) onSaved;
//   final bool showHelpText;
//   SignInPasswordFormField({Key key, @required this.onSaved, showHelpText})
//       : this.showHelpText = showHelpText ?? true,
//         super(key: key);
//   @override  _SignInPasswordFormFieldState createState() =>      _SignInPasswordFormFieldState();
// }
// class _SignInPasswordFormFieldState extends State<SignInPasswordFormField> {
//   final _controller = TextEditingController();
//   bool hideText = true;
//   bool touched = false;
//   @override  Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           FormTitleText(text: "Password", padding: EdgeInsets.only(top: 8.0)),
//           RevealableTextFormField(
//             controller: _controller,
//             onValidate: validatePassword,
//             onSaved: widget.onSaved,
//           ),
//         ],
//       ),
//     );
//   }
// }
// class RegistrationPasswordFormField extends StatefulWidget {
//   final Function(String) onSaved;
//   RegistrationPasswordFormField({Key key, @required this.onSaved, showHelpText})
//       : super(key: key);
//   @override  _RegistrationPasswordFormFieldState createState() =>      _RegistrationPasswordFormFieldState();
// }
// class _RegistrationPasswordFormFieldState    extends State<RegistrationPasswordFormField> {
//   final _passwordController = TextEditingController();
//   final _repetitionController = TextEditingController();
//   bool hideText = true;
//   bool touched = false;
//   @override  Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           FormTitleText(text: "Password", padding: EdgeInsets.only(top: 8.0)),
//           Text(
//             "Make sure to use a strong password: use lowercase and capital "            "letters, special symbols, numbers.",
//             style: Theme.of(context).textTheme.body1.copyWith(fontSize: 14),
//           ),
//           RevealableTextFormField(
//             controller: _passwordController,
//             onValidate: validatePassword,
//             onSaved: widget.onSaved,
//           ),
//           FormTitleText(
//             text: "Repeat the password",
//             padding: EdgeInsets.only(top: 24.0),
//           ),
//           Text(
//             "Make sure that the password matches the one above.",
//             style: Theme.of(context).textTheme.body1.copyWith(fontSize: 14),
//           ),
//           RevealableTextFormField(
//             controller: _repetitionController,
//             onValidate: _ensureSamePassword,
//             onSaved: (_) => null,
//           ),
//         ],
//       ),
//     );
//   }
//   String _ensureSamePassword(String password) {
//     if (_passwordController.text != _repetitionController.text) {
//       return "Passwords must match";
//     }
//     return null;
//   }
// }
// class RevealableTextFormField extends StatefulWidget {
//   final TextEditingController controller;
//   final Function(String) onValidate;
//   final Function(String) onSaved;
//   RevealableTextFormField({
//     Key key,
//     @required this.controller,
//     @required this.onValidate,
//     @required this.onSaved,
//   }) : super(key: key);
//   @override  State<StatefulWidget> createState() => RevealableTextFormFieldState();
// }
// class RevealableTextFormFieldState extends State<RevealableTextFormField> {
//   bool hideText = true;
//   bool touched = false;
//   @override  Widget build(BuildContext context) {
//     return TextFormField(
//       key: widget.key,
//       controller: widget.controller,
//       maxLines: 1,
//       obscureText: hideText,
//       autofocus: false,
//       validator: (value) => widget.onValidate(value),
//       onSaved: (value) => widget.onSaved(value),
//       onChanged: (String value) => setState(() {
//         this.touched = isNotEmpty(value);
//       }),
//       decoration: touched          ? InputDecoration(
//         suffixIcon: InkWell(
//             child: Icon(
//               Icons.remove_red_eye,
//               color: hideText ? Colors.grey : Colors.blue,
//             ),
//             onTap: () => setState(() {
//               this.hideText = !hideText;
//             })),
//       )
//           : null,
//     );
//   }
// }