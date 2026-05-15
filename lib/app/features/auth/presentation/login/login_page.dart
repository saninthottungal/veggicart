import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'package:veggicart/app/common/extensions/context_ext.dart';
import 'package:veggicart/app/common/extensions/string_ext.dart';
import 'package:veggicart/app/common/translation/app_translation.dart';
import 'package:veggicart/app/common/widgets/modal_wrapper.dart';
import 'package:veggicart/app/common/widgets/toast.dart';
import 'package:veggicart/app/core/data/result.dart';
import 'package:veggicart/app/features/auth/presentation/login/login_provider.dart';
import 'package:veggicart/gen/assets.gen.dart';

final _loginFormKey = GlobalKey<FormBuilderState>();

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> _signIn(
    BuildContext context,
  ) async {
    final pod = context.read<LoginProvider>();
    final state = _loginFormKey.currentState;
    if (state == null || !state.saveAndValidate()) return;

    final email = state.value[_email] as String;
    final password = state.value[_password] as String;

    final res = await pod.signIn(email: email, password: password);
    if (!context.mounted) return;

    switch (res) {
      case Success():
        Toast.success(
          context,
          text: "Signed In succesfully",
        );

      case Failure(:final error, :final description):
        Toast.error(
          context,
          text: error,
          description: description,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isProcessing = context.watch<LoginProvider>().value.isProcessing;

    return ModalBarrierWrapper(
      show: isProcessing,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: .all(context.gutter),
            child: Column(
              mainAxisAlignment: .spaceAround,
              children: [
                Hero(
                  tag: 'logo-splash-login',
                  child: Assets.logos.splashLogo.image(
                    width: 200,
                    height: 60,
                  ),
                ),

                Assets.images.vegetablesBucket.image(
                  width: context.mdSize.width * .6,
                  height: 250,
                ),

                FormBuilder(
                  autovalidateMode: .onUserInteractionIfError,
                  key: _loginFormKey,
                  child: Column(
                    spacing: context.gutterSmall,
                    children: [
                      Align(
                        alignment: .centerLeft,
                        child: Text.rich(
                          TextSpan(
                            text: '${t.enterYour.capitalize} ${t.registered}',
                            children: [
                              TextSpan(
                                text: '\n${t.credentials}',
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: context.colorScheme.primary,
                                  fontWeight: .w700,
                                  fontSize: 18,
                                ),
                              ),
                              TextSpan(text: ' ${t.to} ${t.continueKey}'),
                            ],
                          ),

                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: .w700,
                            fontSize: 18,
                          ),
                          textAlign: .left,
                        ),
                      ),

                      FormBuilderTextField(
                        name: _email,
                        decoration: const InputDecoration(
                          hintText: 'Your E-mail',
                          prefixIcon: Icon(LucideIcons.mail),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),

                      const PasswordField(
                        name: _password,
                      ),

                      FilledButton(
                        onPressed: () => _signIn(context),
                        child: Text(t.login),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const String _email = 'email';
  static const String _password = 'password';
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool shouldObscure = true;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      decoration: InputDecoration(
        hintText: 'Your password',
        prefixIcon: const Icon(LucideIcons.lock),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              shouldObscure = !shouldObscure;
            });
          },
          behavior: .translucent,
          child: Icon(
            shouldObscure ? LucideIcons.eyeOff : LucideIcons.eye,
          ),
        ),
      ),
      obscureText: shouldObscure,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
      ]),
    );
  }
}
