class Cast {
  List<Actor> actores = new List();

  Cast.fromJsonList(List<dynamic> listaDeJson) {
    if (listaDeJson == null) return;
    listaDeJson.forEach((i) {
      final actor = Actor.fromJsonMap(i);
      actores.add(actor);
    });
  }
}

class Actor {
  bool adult;
  int gender;
  int id;
  Department knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  Department department;
  String job;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });
  Actor.fromJsonMap(Map<String, dynamic> json) {
    gender = json["gender"];
    adult = json["adult"];
    id = json["id"];
    knownForDepartment = json["known_for_department "];
    name = json["name"];
    originalName = json["original_name"];
    popularity = json["popularity"];
    profilePath = json["profile_path"];
    castId = json["cast_id"];
    character = json["character"];
    creditId = json["credit_id"];
    order = json["order"];
    department = json["department"];
    job = json["job"];
  }

  getFoto() {
    if (profilePath == null) {
      return "https://berlowrahman.scot/wp-content/uploads/2020/06/staff-no-avatar-male-500x640-1-500x500.jpg";
    } else {
      return "https://image.tmdb.org/t/p/w500/$profilePath";
    }
  }
}

enum Department {
  ACTING,
  CREW,
  COSTUME_MAKE_UP,
  WRITING,
  PRODUCTION,
  SOUND,
  DIRECTING,
  CAMERA,
  LIGHTING,
  ART,
  EDITING,
  VISUAL_EFFECTS
}
