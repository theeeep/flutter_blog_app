import 'package:blog_app/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasrc {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDatasrcImpl implements AuthRemoteDatasrc {
  final SupabaseClient supabaseClient;
  AuthRemoteDatasrcImpl(this.supabaseClient);
  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final res = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        'name': name,
      });
      if (res.user == null) {
        throw const ServerException("User is NULL!");
      }
      return res.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
