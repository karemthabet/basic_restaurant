import 'package:basic_restaurant/features/auth/data/auth_repo/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this.authRepo) : super(LogInInitial());
  final AuthRepo authRepo;
  Future<void>logIn(String email,String password)async{
    emit(LogInLoading());
final res= await authRepo.signIn(email: email, password: password,);
res.fold((fail)=>emit(LogInFailure(errorMessage: fail.message)), (data)=>emit(LogInSuccess(data)));
  }
}
