//code to get dynamic motivations from firebase

// final snapshot = await FirebaseFirestore.instance
//     .collection('motivations')
//     .where('active', isEqualTo: true)
//     .where('academyId', isEqualTo: 'noopur_dance_academy')
//     .get();

// final docs = snapshot.docs;
// final int day = DateTime.now().day;
// final index = (day - 1) % docs.length;
// final todayMotivation = docs[index];

// Text('${todayMotivation['sanskrit']} - ${todayMotivation['english']}');
