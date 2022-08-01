import 'package:flutter/material.dart';
import 'package:web_login_flutter/bloc/profile_bloc.dart';
import 'package:web_login_flutter/pages/profile/profile_update_form.dart';
import 'package:web_login_flutter/routes.dart';
import 'package:web_login_flutter/shared/snackbar.dart';
import 'package:web_login_flutter/shared/token_service.dart';
import 'package:web_login_flutter/widgets/lateral_drawer.dart';
import 'package:web_login_flutter/widgets/logout_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const LateralDrawer(),
        appBar: LogoutAppBar(
            context: context,
            title: "Perfil"
        ).build(),
        body: BlocProvider(
          create: (BuildContext context) => ProfileBloc(),
          child: const ProfilePageContent(),
        ),
    );
  }
}

class ProfilePageContent extends StatelessWidget {
  const ProfilePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state){
      if(state is ProfileInitial) {
        context.read<ProfileBloc>().add(ProfileRetrieve(id: TokenService().retrieveUserId()!));
        return const Center(child: CircularProgressIndicator());
      } else if (state is ProfileRetrieved) {
        return ProfileUpdateForm(user: state.user);
      } else if (state is ProfileUpdated){
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Snackbar.showInfo(context, "Usuario actualizado correctamente");
        });
        return ProfileUpdateForm(user: state.user);
      } else {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Snackbar.showError(context, "Error al recuperar el perfil");
          Navigator.of(context).pushReplacementNamed(RouteGenerator.homePage);
        });
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}

