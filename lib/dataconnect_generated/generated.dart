library dataconnect_generated;
import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';

part 'create_new_course.dart';

part 'get_courses_for_current_user.dart';

part 'enroll_in_course.dart';

part 'get_enrolled_courses_for_current_user.dart';







class ExampleConnector {
  
  
  CreateNewCourseVariablesBuilder createNewCourse ({required String title, required String description, required String difficultyLevel, }) {
    return CreateNewCourseVariablesBuilder(dataConnect, title: title,description: description,difficultyLevel: difficultyLevel,);
  }
  
  
  GetCoursesForCurrentUserVariablesBuilder getCoursesForCurrentUser () {
    return GetCoursesForCurrentUserVariablesBuilder(dataConnect, );
  }
  
  
  EnrollInCourseVariablesBuilder enrollInCourse ({required String courseId, }) {
    return EnrollInCourseVariablesBuilder(dataConnect, courseId: courseId,);
  }
  
  
  GetEnrolledCoursesForCurrentUserVariablesBuilder getEnrolledCoursesForCurrentUser () {
    return GetEnrolledCoursesForCurrentUserVariablesBuilder(dataConnect, );
  }
  

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-east4',
    'example',
    'nrityasetu',
  );

  ExampleConnector({required this.dataConnect});
  static ExampleConnector get instance {
    return ExampleConnector(
        dataConnect: FirebaseDataConnect.instanceFor(
            connectorConfig: connectorConfig,
            sdkType: CallerSDKType.generated));
  }

  FirebaseDataConnect dataConnect;
}
