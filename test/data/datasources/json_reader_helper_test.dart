import 'package:bukit_vista_flutter_assessment/data/datasources/json_reader_helper.dart';
import 'package:bukit_vista_flutter_assessment/data/models/guest_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late JsonReaderHelper jsonHelper;
  setUp(() {
    jsonHelper = JsonReaderHelper();
  });
  final testGuest = [
    GuestModel(
        0, "lady gaga", "https://dummyimage.com/400x400/000/fff", "brazil"),
    GuestModel(
        1, "orgendo", "https://dummyimage.com/400x400/000/fff", "managaskar"),
    GuestModel(2, "mayhem", "https://dummyimage.com/400x400/000/fff",
        "papua new gunie"),
    GuestModel(
        3, "somkers", "https://dummyimage.com/400x400/000/fff", "mock town"),
  ];
  test('testing2', () async {
    //act
    final result = await jsonHelper.getData();
    //assert
    expect(result, testGuest);
  });
}
