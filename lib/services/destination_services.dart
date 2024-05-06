import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_airplane/models/destination_model.dart';

class DestinationServices {
  CollectionReference _destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationModel>> fectDestinations() async {
    try {
      QuerySnapshot result = await _destinationReference.get();

      List<DestinationModel> destinations = result.docs.map((e) {
        return DestinationModel.fromJson(
          e.id,
          e.data() as Map<String, dynamic>,
        );
      }).toList();

      return destinations;
    } catch (e) {
      throw e;
    }
  }
}
