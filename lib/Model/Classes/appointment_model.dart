import 'doctor_model.dart';

class Appointment {
  String? fistDate;
  String? secendDate;
  int? weekBirth;
  String? hour;
  int? appointmentNumber;
  Doctor? doctor;

  Appointment(
      {this.fistDate,
      this.secendDate,
      this.weekBirth,
      this.hour,
      this.appointmentNumber,
      this.doctor});

  Appointment.fromJson(Map<String, dynamic> json) {
    fistDate = json['fistDate'];
    secendDate = json['secendDate'];
    weekBirth = json['weekBirth'];
    hour = json['hour'];
    appointmentNumber = json['appointmentNumber'];
    doctor = json['doctor'];
  }
}
