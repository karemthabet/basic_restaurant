import 'package:basic_restaurant/features/auth/data/auth_repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;
  Future<void>register(String userName,String email,String password)async{
    emit(SignUpLoading());
final res= await authRepo.signUp(email: email, password: password, userName: userName);
res.fold((fail)=>emit(SignUpFailure(errorMessage: fail.message)), (data)=>emit(SignUpSuccess(data)));
  }

}
