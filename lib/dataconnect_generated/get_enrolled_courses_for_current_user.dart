part of 'generated.dart';

class GetEnrolledCoursesForCurrentUserVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  GetEnrolledCoursesForCurrentUserVariablesBuilder(this._dataConnect, );
  Deserializer<GetEnrolledCoursesForCurrentUserData> dataDeserializer = (dynamic json)  => GetEnrolledCoursesForCurrentUserData.fromJson(jsonDecode(json));
  
  Future<QueryResult<GetEnrolledCoursesForCurrentUserData, void>> execute() {
    return ref().execute();
  }

  QueryRef<GetEnrolledCoursesForCurrentUserData, void> ref() {
    
    return _dataConnect.query("GetEnrolledCoursesForCurrentUser", dataDeserializer, emptySerializer, null);
  }
}

@immutable
class GetEnrolledCoursesForCurrentUserEnrollments {
  final GetEnrolledCoursesForCurrentUserEnrollmentsCourse course;
  final Timestamp enrolledAt;
  final Timestamp? completedAt;
  final String status;
  GetEnrolledCoursesForCurrentUserEnrollments.fromJson(dynamic json):
  
  course = GetEnrolledCoursesForCurrentUserEnrollmentsCourse.fromJson(json['course']),
  enrolledAt = Timestamp.fromJson(json['enrolledAt']),
  completedAt = json['completedAt'] == null ? null : Timestamp.fromJson(json['completedAt']),
  status = nativeFromJson<String>(json['status']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEnrolledCoursesForCurrentUserEnrollments otherTyped = other as GetEnrolledCoursesForCurrentUserEnrollments;
    return course == otherTyped.course && 
    enrolledAt == otherTyped.enrolledAt && 
    completedAt == otherTyped.completedAt && 
    status == otherTyped.status;
    
  }
  @override
  int get hashCode => Object.hashAll([course.hashCode, enrolledAt.hashCode, completedAt.hashCode, status.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['course'] = course.toJson();
    json['enrolledAt'] = enrolledAt.toJson();
    if (completedAt != null) {
      json['completedAt'] = completedAt!.toJson();
    }
    json['status'] = nativeToJson<String>(status);
    return json;
  }

  GetEnrolledCoursesForCurrentUserEnrollments({
    required this.course,
    required this.enrolledAt,
    this.completedAt,
    required this.status,
  });
}

@immutable
class GetEnrolledCoursesForCurrentUserEnrollmentsCourse {
  final String id;
  final String title;
  final String description;
  final String difficultyLevel;
  final double? price;
  final String? thumbnailUrl;
  GetEnrolledCoursesForCurrentUserEnrollmentsCourse.fromJson(dynamic json):
  
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

    final GetEnrolledCoursesForCurrentUserEnrollmentsCourse otherTyped = other as GetEnrolledCoursesForCurrentUserEnrollmentsCourse;
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

  GetEnrolledCoursesForCurrentUserEnrollmentsCourse({
    required this.id,
    required this.title,
    required this.description,
    required this.difficultyLevel,
    this.price,
    this.thumbnailUrl,
  });
}

@immutable
class GetEnrolledCoursesForCurrentUserData {
  final List<GetEnrolledCoursesForCurrentUserEnrollments> enrollments;
  GetEnrolledCoursesForCurrentUserData.fromJson(dynamic json):
  
  enrollments = (json['enrollments'] as List<dynamic>)
        .map((e) => GetEnrolledCoursesForCurrentUserEnrollments.fromJson(e))
        .toList();
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final GetEnrolledCoursesForCurrentUserData otherTyped = other as GetEnrolledCoursesForCurrentUserData;
    return enrollments == otherTyped.enrollments;
    
  }
  @override
  int get hashCode => enrollments.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['enrollments'] = enrollments.map((e) => e.toJson()).toList();
    return json;
  }

  GetEnrolledCoursesForCurrentUserData({
    required this.enrollments,
  });
}

