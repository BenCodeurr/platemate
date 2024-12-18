import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class CameraEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CaptureImageEvent extends CameraEvent {}

// States
abstract class CameraState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CameraInitial extends CameraState {}
class CameraLoading extends CameraState {}
class CameraSuccess extends CameraState {
  final String imagePath;
  CameraSuccess(this.imagePath);

   @override
  List<Object> get props => [imagePath];
}
class CameraError extends CameraState {
  final String error;
  CameraError(this.error);

  @override
  List<Object> get props => [error];
}

// BLoC
class CameraBloc extends Bloc<CameraEvent, CameraState> {
  final ImagePicker _imagePicker;

  CameraBloc({ImagePicker? imagePicker}) 
      : _imagePicker = imagePicker ?? ImagePicker(),
        super(CameraInitial()) {
    on<CaptureImageEvent>(_onCaptureImage);
  }

  Future<void> _onCaptureImage(
    CaptureImageEvent event,
    Emitter<CameraState> emit,
  ) async {
    try {
      emit(CameraLoading());
      final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
      
      if (image != null) {
        emit(CameraSuccess(image.path));
      } else {
        emit(CameraError('No image selected'));
      }
    } catch (e) {
      emit(CameraError(e.toString()));
    }
  }
}