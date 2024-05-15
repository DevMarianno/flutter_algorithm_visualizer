void main() {
  // final a = [12, 3, 7, 9, 6, 5, 4, 2, 8, 1];
  final b = [12, 443, 27, 9, 66, 588, 454, 2, 81, 1];
  // final b = [1, 2, 3, 4, 5, 7, 9, 6, 8];

  // print(countSort(a, 1));
  // print(452.toString().length);
  print(radix(b));
}

List<int> radix(List<int> list) {
  int max = 0;
  for (int n in list) {
    int digits = n.toString().length;
    if (digits > max) {
      max = digits;
    }
  }

  for (int i = 0; i < max; i++) {
    list = countSort(list, i);
  }
  return list;
}

List<int> countSort(List<int> l, int lookAt) {
  List<List<int>> buckets = [[], [], [], [], [], [], [], [], [], []];
  //count
  for (int n in l) {
    String number = n.toString();
    int dig = (number.length - 1 - lookAt) < 0 ? 0 : int.parse(number[number.length - 1 - lookAt]);

    buckets[dig].add(int.parse(number));
  }
  // rebuild
  List<int> nl = [];
  for (int b = 0; b < buckets.length; b++) {
    for (int q = 0; q < buckets[b].length; q++) {
      nl.add(buckets[b][q]);
    }
  }

  return nl;
}
