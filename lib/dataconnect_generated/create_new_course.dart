part of 'generated.dart';

class CreateNewCourseVariablesBuilder {
  String title;
  String description;
  String difficultyLevel;
  Optional<double> _price = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _thumbnailUrl = Optional.optional(nativeFromJson, nativeToJson);

  final FirebaseDataConnect _dataConnect;  CreateNewCourseVariablesBuilder price(double? t) {
   _price.value = t;
   return this;
  }
  CreateNewCourseVariablesBuilder thumbnailUrl(String? t) {
   _thumbnailUrl.value = t;
   return this;
  }

  CreateNewCourseVariablesBuilder(this._dataConnect, {required  this.title,required  this.description,required  this.difficultyLevel,});
  Deserializer<CreateNewCourseData> dataDeserializer = (dynamic json)  => CreateNewCourseData.fromJson(jsonDecode(json));
  Serializer<CreateNewCourseVariables> varsSerializer = (CreateNewCourseVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateNewCourseData, CreateNewCourseVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateNewCourseData, CreateNewCourseVariables> ref() {
    CreateNewCourseVariables vars= CreateNewCourseVariables(title: title,description: description,difficultyLevel: difficultyLevel,price: _price,thumbnailUrl: _thumbnailUrl,);
    return _dataConnect.mutation("CreateNewCourse", dataDeserializer, varsSerializer, vars);
  }
}

@immutable
class CreateNewCourseCourseInsert {
  final String id;
  CreateNewCourseCourseInsert.fromJson(dynamic json):
  
  id = nativeFromJson<String>(json['id']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateNewCourseCourseInsert otherTyped = other as CreateNewCourseCourseInsert;
    return id == otherTyped.id;
    
  }
  @override
  int get hashCode => id.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateNewCourseCourseInsert({
    required this.id,
  });
}

@immutable
class CreateNewCourseData {
  final CreateNewCourseCourseInsert course_insert;
  CreateNewCourseData.fromJson(dynamic json):
  
  course_insert = CreateNewCourseCourseInsert.fromJson(json['course_insert']);
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateNewCourseData otherTyped = other as CreateNewCourseData;
    return course_insert == otherTyped.course_insert;
    
  }
  @override
  int get hashCode => course_insert.hashCode;
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['course_insert'] = course_insert.toJson();
    return json;
  }

  CreateNewCourseData({
    required this.course_insert,
  });
}

@immutable
class CreateNewCourseVariables {
  final String title;
  final String description;
  final String difficultyLevel;
  late final Optional<double>price;
  late final Optional<String>thumbnailUrl;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  CreateNewCourseVariables.fromJson(Map<String, dynamic> json):
  
  title = nativeFromJson<String>(json['title']),
  description = nativeFromJson<String>(json['description']),
  difficultyLevel = nativeFromJson<String>(json['difficultyLevel']) {
  
  
  
  
  
    price = Optional.optional(nativeFromJson, nativeToJson);
    price.value = json['price'] == null ? null : nativeFromJson<double>(json['price']);
  
  
    thumbnailUrl = Optional.optional(nativeFromJson, nativeToJson);
    thumbnailUrl.value = json['thumbnailUrl'] == null ? null : nativeFromJson<String>(json['thumbnailUrl']);
  
  }
  @override
  bool operator ==(Object other) {
    if(identical(this, other)) {
      return true;
    }
    if(other.runtimeType != runtimeType) {
      return false;
    }

    final CreateNewCourseVariables otherTyped = other as CreateNewCourseVariables;
    return title == otherTyped.title && 
    description == otherTyped.description && 
    difficultyLevel == otherTyped.difficultyLevel && 
    price == otherTyped.price && 
    thumbnailUrl == otherTyped.thumbnailUrl;
    
  }
  @override
  int get hashCode => Object.hashAll([title.hashCode, description.hashCode, difficultyLevel.hashCode, price.hashCode, thumbnailUrl.hashCode]);
  

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['title'] = nativeToJson<String>(title);
    json['description'] = nativeToJson<String>(description);
    json['difficultyLevel'] = nativeToJson<String>(difficultyLevel);
    if(price.state == OptionalState.set) {
      json['price'] = price.toJson();
    }
    if(thumbnailUrl.state == OptionalState.set) {
      json['thumbnailUrl'] = thumbnailUrl.toJson();
    }
    return json;
  }

  CreateNewCourseVariables({
    required this.title,
    required this.description,
    required this.difficultyLevel,
    required this.price,
    required this.thumbnailUrl,
  });
}

