// Untuk menggambarkan kegunaan dari access modifier private, maka file untuk class Motorcycle dipisah sendiri

import 'Student.dart';

/*
Perbedan dari public dan private:
- Access modifier public berarti atribut tersebut bisa diakses dari mana saja ketika objeknya dibuat
- Access modifier private berarti atribut tersebut hanya bisa diakses dari dalam class tersebut ketika objeknya dibuat (hanya bisa digunakan oleh method)

Untuk mengakses atribut public, bisa memanggil dengan format ObjectName.AttributeName

Karena atribut private tidak bisa diakses dari luar class, maka perlu dibuat method khusus yaitu getter dan setter
Getter adalah method yang akan return value dari atribut itu.
Setter adalah method untuk set atribut tersebut ke value baru.
*/

/*
Perbedaan dari Class dan Object:
- Class sendiri bisa dianggap sebagai sebuah blueprint atau gambaran umum tentang suatu Object (seperti sebuah Class Car menggambarkan tentang apa saja atribut yang dimiliki mobil, serta apa saja yang bisa dilakukannya (method))
- Object sendiri merupakan sebuah objek yang kita bisa lihat di dunia nyata, merupakan perwujudan asli dari Class.

Bisa dianggap bahwa ketika di dunia nyata, Class itu kita tidak dapat "lihat" secara langsung (seperti Class Car, kita tidak pernah melihat mobil panggilannya hanya "Car", pasti ada sebutannya seperti Calya)
Sedangkan Object kita bisa lihat secara langsung.
*/

// Contoh sebuah class, yaitu class Student (anggap sebagai sebuah blueprint untuk membuat objek student)
class Student {
  // Atribut yang dimiliki oleh class Student, memiliki access modifier public karena nama dari atribut tidak diawali oleh '_'
  late String name;
  late int age;

  // Constructor, sebagai cara cepat untuk membuat objek, dan set value dari atribut-atribut objek tersebut
  Student(this.name, this.age);

  // Method, fungsi yang dapat dijalankan oleh objek ketika dibuat
  void printDetails() {
    print("Name: $name Age: $age");
  }
}

void main() {
  // Object Constructor Default (jika tidak ada constructor, ini bisa dijalankan)
  // Student myStudent = Student();
  // myStudent.name = "Rich";
  // myStudent.age = 18;
  // myStudent.printDetails();

  // Object Constructor
  Student myStudent = Student("Rich", 18);
  myStudent.name = "Jackson";
  myStudent.printDetails();

  StudentPrivate privateStudent = StudentPrivate("Rich", 18);
  privateStudent.printDetails();

  privateStudent.setName("John");
  print(privateStudent.getName());
  // print(privateStudent._name); // ini akan menghasilkan error jika kalian uncomment karena atribut _name dianggap "tidak ada" karena memiliki access modifier private

  /*
  Perbedaan utama dari List, Set, dan Map
  Segi Kegunaan
  - List sendiri hanya menyimpan kumpulan value yang memiliki tipe data yang sama, dan value tersebut bisa berulang
  - Set sendiri hanya menyimpan kumpulan value yang memiliki tipe data yang sama, tetapi nilai yang disimpan hanya boleh nilai unik
  - Map sendiri menyimpan pair antara key dan juga value. Key dianggap sebagai "index" dari map untuk mengakses valuenya. Key dan value bisa memiliki tipe data yang sama, ataupun berbeda

  List dan Map sendiri bisa diakses menggunakan "index" 
  - List menggunakan [index], di mana index akan dimulai dari 0 untuk anggota pertama dan n - 1 (n itu jumlah elemen di List) untuk anggota terakhir
  - Map menggunakan [key], di mana key berupa pairingan yang diset (seperti "David": "08123456789", maka keynya itu "David" dan valuenya itu "08123456789")

  Set perlu diakses menggunakan for loop atau for-each

  Segi "Visual"
  - List sendiri ketika diinisialisasi menggunakan kurung kotak []
  - Set dan Map diinisialisasi menggunakan kurung curly {}

  - List dan Set hanya bisa menyimpan satu tipe data (dapat dilihat dari kurung lancip atau panah, List dan Set hanya menyimpan 1 tipe data)
  - Map menyimpan 2 tipe data, bisa sama ataupun beda (dapat dilihat dari kurung lancip atau panah, Map menyimpan 2 tipe data)
  */

  // List
  List<int> myList = [];

  // Adding a member to List
  myList.add(1);
  myList.add(2);
  myList.add(3);
  myList.add(1);

  myList[0] = 10;

  // Deleting a member from List
  myList.remove(1);

  // Print members of List
  for (int element in myList) {
    print(element);
  }

  // Set
  Set<int> uniqueList = {};

  // Add member
  uniqueList.add(1);
  uniqueList.add(2);
  uniqueList.add(3);

  // Remove
  uniqueList.remove(1);

  // Print members
  for (int element in uniqueList) {
    print(element);
  }

  // Map
  Map<String, int> grades = {};

  // Add members
  grades["Rich"] = 70;
  grades["Jackson"] = 100;
  
  // Remove members
  grades.remove("Rich");

  // Print members
  for (String key in grades.keys) {
    print("${key} = ${grades[key]}");
  }

  // 2D array
  List<List<int>> test = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];

  for (List<int> list in test) {
    for (int element in list) {
      print(element);
    }
  }
}