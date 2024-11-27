// Contoh sebuah class, yaitu class StudentPrivate (anggap sebagai sebuah blueprint untuk membuat objek student)
class StudentPrivate {
  // Atribut yang dimiliki oleh class StudentPrivate, memiliki access modifier private karena nama dari atribut diawali oleh '_'
  late String _name;
  late int age;

  // Constructor, sebagai cara cepat untuk membuat objek, dan set value dari atribut-atribut objek tersebut
  StudentPrivate(this._name, this.age);

  // Method, fungsi yang dapat dijalankan oleh objek ketika dibuat

  // Getter, fungsi untuk return value dari atribut tertentu. Pada kasus ini untuk return value dari atribut _name
  String getName() {
    return this._name;
  }

  // Setter, fungsi untuk set atribut tertentu ke sebuah value baru (valuenya dari parameter). Pada kasus ini untuk set atribut _name ke value baru.
  void setName(String name) {
    this._name = name;
  }

  void printDetails() {
    print("Name: $_name Age: $age");
  }
}