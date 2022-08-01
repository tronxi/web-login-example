import 'package:flutter/material.dart';
import 'package:web_login_flutter/bloc/profile_bloc.dart';
import 'package:web_login_flutter/models/update_private_profile.dart';
import 'package:web_login_flutter/models/update_public_profile.dart';
import 'package:web_login_flutter/models/user.dart';
import 'package:web_login_flutter/pages/profile/profile_form_fields.dart';
import 'package:web_login_flutter/widgets/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUpdateForm extends StatelessWidget {
  final _publicKey = GlobalKey<FormState>();
  final _privateKey = GlobalKey<FormState>();
  final User _user;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _validatorNewPasswordController = TextEditingController();

  ProfileUpdateForm({Key? key, required user}) : _user = user, super(key: key);

  @override
  Widget build(BuildContext context) {
    _nameController.text = _user.name;
    _surnameController.text = _user.surname;
    _emailController.text = _user.email;
    return SizedBox(
          height: double.infinity,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _publicKey,
                    child: Column(
                      children: [
                        ProfilePublicFields(
                          emailController: _emailController,
                          nameController: _nameController,
                          surnameController: _surnameController,
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                            onPressed:() => _onUpdatePublicPressed(context.read<ProfileBloc>()),
                            text: "Actualizar"
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Form(
                    key: _privateKey,
                    child: Column(
                      children: [
                        PrivatePublicFields(
                          oldPasswordController: _oldPasswordController,
                          newPasswordController: _newPasswordController,
                          validatorNewPasswordController: _validatorNewPasswordController,
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                            onPressed:() => _onUpdatePrivatePressed(context.read<ProfileBloc>()),
                            text: "Actualizar"
                        ),
                      ],
                    ),
                  )
                ],
              )
          ),
    );
  }
  void _onUpdatePublicPressed(ProfileBloc profileBloc) {
    if (_publicKey.currentState?.validate() ?? false) {
      profileBloc.add(UpdatePublicProfileEvent(updatePublicProfile: UpdatePublicProfile(surname: _surnameController.value.text, name: _nameController.value.text, email: _emailController.value.text)));
    }
  }

  void _onUpdatePrivatePressed(ProfileBloc profileBloc) {
    if (_privateKey.currentState?.validate() ?? false) {
      profileBloc.add(UpdatePrivateProfileEvent(updatePrivateProfile: UpdatePrivateProfile(oldPassword: _oldPasswordController.value.text, newPassword: _newPasswordController.value.text)));
    }
  }
}
