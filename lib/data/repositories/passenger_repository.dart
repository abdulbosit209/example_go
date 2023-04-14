import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotaxi/data/models/passenger_model.dart';

class PassengerRepository {
  final FirebaseFirestore _fireStore;

  PassengerRepository({required FirebaseFirestore firestore})
      : _fireStore = firestore;

  Future<PassengerModel> updatePassengerModel({
    required PassengerModel passengerModel,
    required String docId,
  }) async {
    await _fireStore
        .collection("passenger")
        .doc(docId)
        .update(passengerModel.toJson());
    var data = await _fireStore.collection("passenger").doc(docId).get();
    PassengerModel passenger = PassengerModel.fromJson(data.data()!);

    return passenger;
  }

  Future<void> postPassenger({
    required Map<String, dynamic> json,
  }) async {
    try {
      var newPassenger = await _fireStore.collection("passenger").add(json);
      await _fireStore
          .collection("passenger")
          .doc(newPassenger.id)
          .update({"passenger_doc_id": newPassenger.id});
    } catch (e) {
      throw Exception();
    }
  }

  Future<PassengerModel> getUserData({required String userId}) async {
    var userData = await _fireStore
        .collection('passenger')
        .where('passenger_id', isEqualTo: userId)
        .get()
        .then(
          (snapshot) => snapshot.docs
              .map((e) => PassengerModel.fromJson(e.data()))
              .toList()
              .first,
        );
    return userData;
  }

  Future<void> updatePassenger({
    required PassengerModel passengerModel,
    required String docId,
  }) async {
    try {
      await _fireStore
          .collection("passenger")
          .doc(docId)
          .update(passengerModel.toJson());
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> deletePassenger({
    required String docId,
  }) async {
    try {
      await _fireStore.collection("passenger").doc(docId).delete();
    } catch (e) {
      throw Exception();
    }
  }
}

/*
  Stream<List<VacancyModel>> getVacancies({required String categoryId}) async* {
    if (categoryId.isNotEmpty) {
      yield* _fireStore
          .collection('vacancies')
          .where("category_id", isEqualTo: categoryId)
          .where("is_valid", isEqualTo: true)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => VacancyModel.fromJson(doc.data()))
                .toList(),
          );
    } else {
      yield* _fireStore
          .collection('vacancies')
          .where("is_valid", isEqualTo: true)
          .snapshots()
          .map(
            (snapshot) => snapshot.docs
                .map((doc) => VacancyModel.fromJson(doc.data()))
                .toList(),
          );
    }
  }
 */
