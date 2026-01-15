# dataconnect_generated SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
ExampleConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### GetCoursesForCurrentUser
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.getCoursesForCurrentUser().execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetCoursesForCurrentUserData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getCoursesForCurrentUser();
GetCoursesForCurrentUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.getCoursesForCurrentUser().ref();
ref.execute();

ref.subscribe(...);
```


### GetEnrolledCoursesForCurrentUser
#### Required Arguments
```dart
// No required arguments
ExampleConnector.instance.getEnrolledCoursesForCurrentUser().execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetEnrolledCoursesForCurrentUserData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await ExampleConnector.instance.getEnrolledCoursesForCurrentUser();
GetEnrolledCoursesForCurrentUserData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = ExampleConnector.instance.getEnrolledCoursesForCurrentUser().ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateNewCourse
#### Required Arguments
```dart
String title = ...;
String description = ...;
String difficultyLevel = ...;
ExampleConnector.instance.createNewCourse(
  title: title,
  description: description,
  difficultyLevel: difficultyLevel,
).execute();
```

#### Optional Arguments
We return a builder for each query. For CreateNewCourse, we created `CreateNewCourseBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreateNewCourseVariablesBuilder {
  ...
   CreateNewCourseVariablesBuilder price(double? t) {
   _price.value = t;
   return this;
  }
  CreateNewCourseVariablesBuilder thumbnailUrl(String? t) {
   _thumbnailUrl.value = t;
   return this;
  }

  ...
}
ExampleConnector.instance.createNewCourse(
  title: title,
  description: description,
  difficultyLevel: difficultyLevel,
)
.price(price)
.thumbnailUrl(thumbnailUrl)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<CreateNewCourseData, CreateNewCourseVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.createNewCourse(
  title: title,
  description: description,
  difficultyLevel: difficultyLevel,
);
CreateNewCourseData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String title = ...;
String description = ...;
String difficultyLevel = ...;

final ref = ExampleConnector.instance.createNewCourse(
  title: title,
  description: description,
  difficultyLevel: difficultyLevel,
).ref();
ref.execute();
```


### EnrollInCourse
#### Required Arguments
```dart
String courseId = ...;
ExampleConnector.instance.enrollInCourse(
  courseId: courseId,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<EnrollInCourseData, EnrollInCourseVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await ExampleConnector.instance.enrollInCourse(
  courseId: courseId,
);
EnrollInCourseData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String courseId = ...;

final ref = ExampleConnector.instance.enrollInCourse(
  courseId: courseId,
).ref();
ref.execute();
```

