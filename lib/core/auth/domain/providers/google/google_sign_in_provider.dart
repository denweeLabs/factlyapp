import 'package:denwee/core/auth/domain/providers/google/google_sign_in_provider_result.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GoogleSignInProvider {
  final GoogleSignIn _provider;

  GoogleSignInProvider(this._provider);

  Future<GoogleSignInProviderResult?> authenticate() async {
    await _provider.signOut();

    final user = await _provider.signIn();
    if (user == null) {
      return null;
    }

    final auth = await user.authentication;
    final idToken = auth.idToken;

    if (idToken?.isEmpty == true) {
      throw 'No id token found';
    }

    final result = GoogleSignInProviderResult(
      idToken: idToken!,
      email: user.email,
    );

    return result;
  }
}
