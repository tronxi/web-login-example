import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_login_flutter/models/update_private_profile.dart';
import 'package:web_login_flutter/models/update_public_profile.dart';
import 'package:web_login_flutter/models/user.dart';
import 'package:web_login_flutter/repositories/models/update_private_profile_request.dart';
import 'package:web_login_flutter/repositories/models/update_public_profile_request.dart';
import 'package:web_login_flutter/repositories/profile_repository.dart';

import '../shared/token_service.dart';

abstract class ProfileEvent {}
class ProfileRetrieve extends ProfileEvent {
  final String _id;
  ProfileRetrieve({id}) : _id = id;

  String get id => _id;
}

class UpdatePrivateProfileEvent extends ProfileEvent {
  final UpdatePrivateProfile _updatePrivateProfile;
  UpdatePrivateProfileEvent({updatePrivateProfile}) : _updatePrivateProfile = updatePrivateProfile;

  UpdatePrivateProfile get updatePrivateProfile => _updatePrivateProfile;
}

class UpdatePublicProfileEvent extends ProfileEvent {
  final UpdatePublicProfile _updatePublicProfile;
  UpdatePublicProfileEvent({updatePublicProfile}) : _updatePublicProfile = updatePublicProfile;

  UpdatePublicProfile get updatePublicProfile => _updatePublicProfile;
}

abstract class ProfileState {}
class ProfileInitial extends ProfileState {}
class ProfileRetrieved extends ProfileState {
  final User _user;
  ProfileRetrieved({required user}) : _user = user;

  User get user => _user;
}
class ProfileUpdated extends ProfileState {
  final User _user;
  ProfileUpdated({required user}) : _user = user;

  User get user => _user;
}
class ProfileFailure extends ProfileState {}


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  late final ProfileRepository _profileRepository;
  ProfileBloc() : super(ProfileInitial()) {
    _profileRepository = ProfileRepository();
    on<ProfileRetrieve>((event, emit) async => emit(await _onJoinEvent(event.id)));
    on<UpdatePrivateProfileEvent>((event, emit) async => emit(await _onUpdatePrivateProfile(event.updatePrivateProfile)));
    on<UpdatePublicProfileEvent>((event, emit) async => emit(await _onUpdatePublicProfile(event.updatePublicProfile)));
  }

  Future<ProfileState> _onJoinEvent(String id) async {
    final response = await _profileRepository.retrieve(id);
    return response.fold(
            (left) => ProfileFailure(),
            (right) => ProfileRetrieved(user: User(id: "${right.userResponse.id}",
                name: right.userResponse.name,
                email: right.userResponse.email,
                surname: right.userResponse.surname)));
  }

  Future<ProfileState> _onUpdatePublicProfile(UpdatePublicProfile updatePublicProfile) async {
    final response = await _profileRepository.updatePublicProfile(TokenService().retrieveUserId()!,
        UpdatePublicProfileRequest(name: updatePublicProfile.name, email: updatePublicProfile.email, surname: updatePublicProfile.surname));
    return response.fold(
            (left) => ProfileFailure(),
            (right) => ProfileUpdated(user: User(id: "${right.userResponse.id}",
            name: right.userResponse.name,
            email: right.userResponse.email,
            surname: right.userResponse.surname)));
  }

  Future<ProfileState> _onUpdatePrivateProfile(UpdatePrivateProfile updatePrivateProfile) async {
    final response = await _profileRepository.updatePrivateProfile(TokenService().retrieveUserId()!,
        UpdatePrivateProfileRequest(newPassword: updatePrivateProfile.newPassword, oldPassword: updatePrivateProfile.oldPassword));
    return response.fold(
            (left) => ProfileFailure(),
            (right) => ProfileUpdated(user: User(id: "${right.userResponse.id}",
            name: right.userResponse.name,
            email: right.userResponse.email,
            surname: right.userResponse.surname)));
  }
}