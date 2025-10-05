import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app_c16_sat/models/event_data.dart';

class FirestoreServices {
  static const String collectionName = "events_table";

  static CollectionReference<EventData> getCollectionRef() {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter<EventData>(
          fromFirestore:
              (snapshot, _) => EventData.fromFirestore(snapshot.data()!),
          toFirestore: (eventData, options) => eventData.toFirestore(),
        );
  }

  static Future<void> addNewEvent(EventData eventData) {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc();
    eventData.eventID = docRef.id;
    return docRef.set(eventData);
  }

  static Future<List<EventData>> getAllEvents() async {
    var collectionRef = getCollectionRef();
    var data = await collectionRef.get();

    return data.docs.map((element) {
      return element.data();
    }).toList();
    // var dataList = data.docs;
    //
    // List<EventData> eventsList = [];
    // for (var element in dataList) {
    //   eventsList.add(element.data());
    // }
    //
    // return eventsList;
  }

  static Stream<QuerySnapshot<EventData>> getStreamOfEvents(String categoryID) {
    var collectionRef = getCollectionRef().where(
      "categoryID",
      isEqualTo: categoryID,
    );
    return collectionRef.snapshots();
  }

  static Stream<QuerySnapshot<EventData>> getStreamOfFavoritesEvents() {
    var collectionRef = getCollectionRef().where("isFavorite", isEqualTo: true);
    return collectionRef.snapshots();
  }

  static Future<void> updateEvent(EventData eventData) {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc(eventData.eventID);

    return docRef.update(eventData.toFirestore());
  }


  static Future<void> deleteEvent(EventData eventData) {
    var collectionRef = getCollectionRef();
    var docRef = collectionRef.doc(eventData.eventID);

    return docRef.delete();
  }
}
