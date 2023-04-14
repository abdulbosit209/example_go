import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gotaxi/data/models/order_passanger.dart';

class OrderRepository {
  OrderRepository({
    required FirebaseFirestore fireStore,
  }) : _fireStore = fireStore;

  final FirebaseFirestore _fireStore;

  Future<void> postOrder({
    required Map<String, dynamic> json,
  }) async {
    try {
      var newOrder = await _fireStore.collection("orders").add(json);
      await _fireStore
          .collection("orders")
          .doc(newOrder.id)
          .update({"order_doc_id": newOrder.id});
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> updateOrder({
    required OrderPassenger orderPassenger,
    required String docId,
  }) async {
    try {
      await _fireStore
          .collection("orders")
          .doc(docId)
          .update(orderPassenger.toJson());
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> deleteOrder({
    required String docId,
  }) async {
    try {
      await _fireStore.collection("orders").doc(docId).delete();
    } catch (e) {
      throw Exception();
    }
  }
}
