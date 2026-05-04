import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/slide_animation.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SingnupScreenModel extends StatefulWidget {
  final VoidCallback? onTap;
  final String? title,
      subTitle,
      hintText,
      lable,
      lottie,
      backScreenPath,
      hintText2,
      lable2;

  final Function(String fastFild, String? secondFild)? onSubmitText;
  final String? Function(String? value)? validator1;
  final String? Function(String? value)? validator2;
  final bool? isShowSecondFild;

  const SingnupScreenModel({
    super.key,
    this.onTap,
    this.title,
    this.subTitle,
    this.hintText,
    this.lable,
    this.lottie,

    this.backScreenPath,

    this.validator1,
    this.validator2,
    this.hintText2,
    this.lable2,
    this.onSubmitText,
    this.isShowSecondFild = false,
  });

  @override
  State<SingnupScreenModel> createState() => _SingnupScreenModelState();
}

class _SingnupScreenModelState extends State<SingnupScreenModel> {
  // GlobalKey<FormState> textFormKey1 = GlobalKey<FormState>();
  // GlobalKey<FormState> textFormKey2 = GlobalKey<FormState>();
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
          child: Column(
            crossAxisAlignment: .center,
            mainAxisAlignment: .center,
            children: [
              SizedBox(height: 80),
              Center(
                child: Lottie.asset(
                  widget.lottie ?? Asset.phoneNumberLottie,
                  width: 300,
                  height: 300,
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
                    Form(
                      key: formKeys[0],
                      child: TextFormField(
                        controller: textEditingController,
                        onChanged: (value) {
                          if (widget.validator1 != null) {
                            formKeys[0].currentState!.validate();
                          }
                        },
                        validator: widget.validator1,
                        decoration: decorationEliment(
                          labelText: widget.lable,
                          hintText: widget.hintText,
                        ),
                        style: textStyleEliment(),
                      ).slideMotion(controller: textfield),
                    ),
                    if (widget.isShowSecondFild!) SizedBox(height: 20),
                    if (widget.isShowSecondFild!)
                      Form(
                        key: formKeys[1],
                        child: TextFormField(
                          controller: lastnameController,
                          validator: widget.validator2,
                          onChanged: (value) {
                            if (widget.validator2 != null) {
                              formKeys[1].currentState?.validate();
                            }
                          },

                          decoration: decorationEliment(
                            labelText: widget.lable2,
                            hintText: widget.hintText2,
                          ),
                          style: textStyleEliment(),
                        ).slideMotion(controller: lastname),
                      ),
                    SizedBox(height: 40),
                    JumpingButton(
                      width: double.infinity,
                      scale: 0.95,
                      isFileBoxShow: true,
                      opacity: 1,
                      onTap: animationback,

                      child: SvgPicture.asset(Asset.googleIconSVG),
                    ).slideMotion(controller: button),
                  ],
                ),
              ).slideMotion(controller: controll2),
              SizedBox(height: 40),
            ],
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

    if (widget.isShowSecondFild!) {
      lastnameController.dispose();
    }
    super.dispose();
  }

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  void animationback() {
    if (widget.onSubmitText == null) return;
    if (widget.isShowSecondFild!) {
      if (widget.validator1 != null && widget.validator2 != null) {
        if (formKeyValid()) {
          reverseAllAnimations();
          Future.delayed(Duration(milliseconds: 1000), onClick);
        }
      } else if (widget.validator1 != null || widget.validator2 != null) {
        if ((formKeys[0].currentState!.validate() ||
            formKeys[0].currentState!.validate())) {
          reverseAllAnimations();
          Future.delayed(Duration(milliseconds: 1000), onClick);
        }
      } else {
        reverseAllAnimations();
        Future.delayed(Duration(milliseconds: 1000), onClick);
      }
    } else {
      if (widget.validator1 != null) {
        if (formKeys[0].currentState!.validate()) {
          reverseAllAnimations();
          Future.delayed(Duration(milliseconds: 1000), onClick);
        }
      } else {
        reverseAllAnimations();
        Future.delayed(Duration(milliseconds: 1000), onClick);
      }
    }
  }

  bool formKeyValid() {
    for (var key in formKeys) {
      if (!key.currentState!.validate()) {
        return false;
      }
    }
    return true;
  }

  void onClick() {
    widget.onSubmitText?.call(
      textEditingController.text,
      lastnameController.text,
    );
  }

  void reverseAllAnimations() {
    controll1.reverse();
    controll2.reverse();
    title.reverse();
    textfield.reverse();
    button.reverse();
  }
}
