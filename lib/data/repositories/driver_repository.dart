import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotaxi/data/models/driver_model.dart';

class DriverRepository {
  final FirebaseFirestore _fireStore;

  DriverRepository({required FirebaseFirestore fireStore}) : _fireStore = fireStore;

  Future<void> postDriver({
    required Map<String, dynamic> json,
  }) async {
    try {
      var newDriver = await _fireStore.collection("driver").add(json);
      await _fireStore
          .collection("driver")
          .doc(newDriver.id)
          .update({"driver_id": newDriver.id});
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> updatePassenger({
    required DriverModel driverModel,
    required String docId,
  }) async {
    try {
      await _fireStore
          .collection("driver")
          .doc(docId)
          .update(driverModel.toJson());
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> deletePassenger({
    required String docId,
  }) async {
    try {
      await _fireStore.collection("driver").doc(docId).delete();
    } catch (e) {
      throw Exception();
    }
  }

}