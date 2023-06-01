class ProfilePageUserRequestModel {
  String username;
  String email;
  String name;
  String surname;

  ProfilePageUserRequestModel({
    required this.username,
    required this.surname,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toJson() => {
        "username": this.username,
        "email": this.email,
        "name": this.name,
        "surname": this.surname,
      };

  ProfilePageUserRequestModel.fromDomain(ProfilePageUserRequestModel domainModel)
      : username = domainModel.username,
        name = domainModel.name,
        surname = domainModel.surname,
        email = domainModel.email;
}
