part of 'generated.dart';

class GetCoursesForCurrentUserVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetCoursesForCurrentUserVariablesBuilder(this._dataConnect, );
  Deserializer<GetCoursesForCurrentUserData> dataDeserializer = (dynamic json)  => GetCoursesForCurrentUserData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetCoursesForCurrentUserData, void>> execute() {
    return ref().execute();
  }

  QueryRef<GetCoursesForCurrentUserData, void> ref() {
    
    return _dataConnect.query("GetCoursesForCurrentUser", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class GetCoursesForCurrentUserCourses {
  final String id;
  final String title;
  final String description;
  final String difficultyLevel;
  final double? price;
  final String? thumbnailUrl;
  GetCoursesForCurrentUserCourses.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']),
  title = nativeFromJson<String>(json['title']),
  description = nativeFromJson<String>(json['description']),
  difficultyLevel = nativeFromJson<String>(json['difficultyLevel']),
  price = json['price'] == null ? null : nativeFromJson<double>(json['price']),
  thumbnailUrl = json['thumbnailUrl'] == null ? null : nativeFromJson<String>(json['thumbnailUrl']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetCoursesForCurrentUserCourses otherTyped = other as GetCoursesForCurrentUserCourses;
    return id == otherTyped.id && 
    title == otherTyped.title && 
    description == otherTyped.description && 
    difficultyLevel == otherTyped.difficultyLevel && 
    price == otherTyped.price && 
    thumbnailUrl == otherTyped.thumbnailUrl;
    
  }
  @override
  int get hashCode => Object.hashAll([id.hashCode, title.hashCode, description.hashCode, difficultyLevel.hashCode, price.hashCode, thumbnailUrl.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['description'] = nativeToJson<String>(description);
    json['difficultyLevel'] = nativeToJson<String>(difficultyLevel);
    if (price != null) {
      json['price'] = nativeToJson<double?>(price);
    }
    if (thumbnailUrl != null) {
      json['thumbnailUrl'] = nativeToJson<String?>(thumbnailUrl);
    }
    return json;
  }

  GetCoursesForCurrentUserCourses({
    required this.id,
    required this.title,
    required this.description,
    required this.difficultyLevel,
    this.price,
    this.thumbnailUrl,
  });
}

@immutable
class GetCoursesForCurrentUserData {
  final List<GetCoursesForCurrentUserCourses> courses;
  GetCoursesForCurrentUserData.fromJson(dynamic json):
  
  courses = (json['courses'] as List<dynamic>)
        .map((e) => GetCoursesForCurrentUserCourses.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetCoursesForCurrentUserData otherTyped = other as GetCoursesForCurrentUserData;
    return courses == otherTyped.courses;
    
  }
  @override
  int get hashCode => courses.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['courses'] = courses.map((e) => e.toJson()).toList();
    return json;
  }

  GetCoursesForCurrentUserData({
    required this.courses,
  });
}

