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

  getAllEvents() {
    FirebaseFirestore.instance.collection(collectionName);
  }
}
