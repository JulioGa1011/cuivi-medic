import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/personal_information.dart';
import 'package:cuivi_medic/ui/models/professional_information_model.dart';
import 'package:cuivi_medic/ui/services/doctor_services.dart';
import 'package:flutter/cupertino.dart';

class DoctorProvider extends ChangeNotifier {
  DoctorProvider();
  final List<PersonalInformation> _add = [];
  List<PersonalInformation> get add => _add;
  final List<ProfessionalInformartion> _professional = [];
  List<ProfessionalInformartion> get professional => _professional;
  Future<void> aboutMe(context) async {
    _add.clear();
    final res = await DoctorServices().personalInformationDoctor(context);
    _add.add(PersonalInformation(
      id: res.data['id'],
      userTypeId: res.data['user_type_id'],
      name: res.data['name'],
      email: res.data['email'],
      phone: res.data['phone'],
      emailVerifiedAt: res.data['email_verified_at'],
      currentTeamId: res.data['current_team_id'],
      profilePhotoPath: res.data['profile_photo_path'],
      status: res.data['status'],
      updatedAt: res.data['updated_at'],
      profilePhotoUrl: res.data['profile_photo_url'],
      qrCode: res.data["qr_code"],
      healthStaff: HealthStaff.fromJson(
        res.data['health_staff'],
      ),
    ));

    notifyListeners();
  }

  Future<void> professionalInformation(context) async {
    _professional.clear();
    final res = await DoctorServices().professionalInformationDoctor(context);
    _professional.add(ProfessionalInformartion.fromJson(res.data));
    notifyListeners();
  }
}
