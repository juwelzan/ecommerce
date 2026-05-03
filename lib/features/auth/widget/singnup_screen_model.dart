import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/slide_animation.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SingnupScreenModel extends StatefulWidget {
  final VoidCallback? onTap;
  final String? title, subTitle, hintText, lable, lottie, backScreenPath;

  final Function(String text)? onSubmit;
  final Function(String fastname, String lastName)? onSubmitName;
  final String? Function(String? value)? validator;

  const SingnupScreenModel({
    super.key,
    this.onTap,
    this.title,
    this.subTitle,
    this.hintText,
    this.lable,
    this.lottie,
    this.onSubmit,

    this.backScreenPath,

    this.onSubmitName,
    this.validator,
  });

  @override
  State<SingnupScreenModel> createState() => _SingnupScreenModelState();
}

class _SingnupScreenModelState extends State<SingnupScreenModel> {
  GlobalKey<FormState> textFormKey = GlobalKey<FormState>();
  final controll1 = SlideController(
    duration: Duration(milliseconds: 700),
    reversDuration: Duration(milliseconds: 700),
    offsetBegin: Offset(0, -5),
    offsetEnd: Offset(0, 0),
    opacity: Opacitys(begin: 0, end: 1),
  );
  final controll2 = SlideController(
    duration: Duration(milliseconds: 700),
    reversDuration: Duration(milliseconds: 700),
    offsetBegin: Offset(0, 15),
    offsetEnd: Offset(0, 0),
    opacity: Opacitys(begin: 0, end: 1),
  );

  final title = SlideController(
    duration: Duration(milliseconds: 900),
    reversDuration: Duration(milliseconds: 500),
    offsetBegin: Offset(0, 15),
    offsetEnd: Offset(0, 0),
    opacity: Opacitys(begin: 0, end: 1),
  );
  final textfield = SlideController(
    duration: Duration(milliseconds: 1100),
    reversDuration: Duration(milliseconds: 700),
    offsetBegin: Offset(0, 15),
    offsetEnd: Offset(0, 0),
    opacity: Opacitys(begin: 0, end: 1),
  );
  final lastname = SlideController(
    duration: Duration(milliseconds: 1300),
    reversDuration: Duration(milliseconds: 900),
    offsetBegin: Offset(0, 15),
    offsetEnd: Offset(0, 0),
    opacity: Opacitys(begin: 0, end: 1),
  );
  final button = SlideController(
    duration: Duration(milliseconds: 1500),
    reversDuration: Duration(milliseconds: 1100),
    offsetBegin: Offset(0, 15),
    offsetEnd: Offset(0, 0),
    opacity: Opacitys(begin: 0, end: 1),
  );

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (widget.backScreenPath != null) {
          context.pushReplacement(widget.backScreenPath!);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: textFormKey,
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .center,
              children: [
                SizedBox(height: 80),
                Center(
                  child: Lottie.asset(
                    widget.lottie ?? Asset.phoneNumberLottie,
                    width: 250,
                  ),
                ).slideMotion(controller: controll1),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: 40,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: context.theme.splashColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 2),
                  ),
                  child: Column(
                    children: [
                      AuthWidget(
                        showIcon: false,
                        title: widget.title,
                        subTitle: widget.subTitle,
                      ).slideMotion(controller: title),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: textEditingController,
                        onChanged: (value) {
                          if (widget.validator != null) {
                            textFormKey.currentState!.validate();
                          }
                        },
                        validator: widget.validator,
                        decoration: decorationEliment(
                          labelText: widget.lable,
                          hintText: widget.hintText,
                        ),
                        style: textStyleEliment(),
                      ).slideMotion(controller: textfield),
                      if (widget.onSubmitName != null) SizedBox(height: 20),
                      if (widget.onSubmitName != null)
                        TextFormField(
                          controller: lastnameController,

                          decoration: decorationEliment(
                            labelText: "Last Name",
                            hintText: "islam,roy etc",
                          ),
                          style: textStyleEliment(),
                        ).slideMotion(controller: lastname),
                      SizedBox(height: 40),
                      JumpingButton(
                        width: double.infinity,
                        scale: 0.95,
                        isFileBoxShow: true,
                        opacity: 1,

                        child: SvgPicture.asset(Asset.googleIconSVG),
                        onTap: () async {
                          // controll1.reverse();
                          // controll2.reverse();
                          // title.reverse();
                          // textfield.reverse();
                          // button.reverse();

                          await Future.delayed(
                            Duration(milliseconds: 1000),
                            () {
                              if (widget.onTap != null) widget.onTap?.call();
                              if (widget.onSubmit != null) {
                                widget.onSubmit?.call(
                                  textEditingController.text,
                                );
                              }
                              if (widget.onSubmitName != null) {}
                              if (widget.validator != null) {}
                            },
                          );
                        },
                      ).slideMotion(controller: button),
                    ],
                  ),
                ).slideMotion(controller: controll2),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextEditingController textEditingController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    controll1.controller?.dispose();
    controll2.controller?.dispose();
    title.controller?.dispose();
    textfield.controller?.dispose();
    button.controller?.dispose();
    if (widget.onSubmitName != null) {
      lastname.controller?.dispose();
      lastnameController.dispose();
    }
    super.dispose();
  }
}
