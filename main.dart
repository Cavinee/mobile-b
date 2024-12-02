/*
4 Pillars of Object Oriented Programming (OOP):
1. Encapsulation = membungkus attribut dan method ke dalam 1 "kapsul" yaitu class untuk merahasiakan data dan mencegah akses yang tidak diinginkan (seperti melihat atau mengubah data).
Dapat dicapai dengan mengggunakan access modifier, seperti private ('_') dan public

Jika sebuah data diberikan private access modifier, maka untuk melihat dan mengubah data tersebut perlu dibuat method khusus, yaitu getter untuk melihat dan setter untuk mengubah data 

2. Inheritance = mewariskan sifat atau ciri khas (atribut dan method) dari parent class (super class) ke child class (sub class) agar code kalian bisa menjadi reusable dan lebih modular
Dapat dicapai dengan menggunakan keyword extends

3. Polymorphism = bagaimana sebuah object bisa bersifat layaknya class-class lain (seperti bagaimana kita manusia bisa "berubah bentuk" menjadi mahasiswa, anak, orang tua, dan lain-lain) sehingga code kalian bisa menjadi lebih fleksibel
Dapat dicapai dengan menggunakan method overriding (override method dari interface yang diimplementasikan ataupun method dari parent class)

4. Abstraction = menyembunyikan detail implementasi dari program kalian, hanya menampilkan detail implementasi yang diperlukan oleh user sehingga user bisa berfokus kepada implementasi yang penting bagi program kita yang complex dapat dimengerti oleh pengguna kita
Dapat dicapai dengan menggunakan keyword abstract pada sebuah class untuk membuat abstract class ataupun bisa dengan membuat abstract method (method yang belum ada implementasinya)

Jika abstract method dimiliki oleh class normal (bukan abstract), maka method tersebut harus di override (method overriding) di mana implementasi dari method tersebut harus ditambahkan

Bonus information:
Pada Dart, inheritance hanya bisa dilakukan sekali saja karena bisa terjadi tabrakan antara data yang diturunkan.

Alternatif dari multiple inheritance adalah kita bisa menggunakan interface untuk melakukan mulitple implementation dari berbagai interface

Perbedaan dari interface dan class normal untuk inheritance adalah:
- Inheritance hanya boleh sekali sedangkan implementation bisa berulang-ulang
- Inheritance menggunakan keyword extends implementation menggunakan keyword implements
*/

// Inheritance: pewarisan sifat dari parent class ke sub class, dapat dilihat dari keyword extends
// Polymorphism: object bisa memiliki banyak bentuk, dapat dilihat dari implementasi @override, di mana dilakukan method overriding

// Abstraction: menyembunyikan detail implementasi, dapat dilihat dari keyword abstract yang digunakan serta abstract method di mana implementasinya tidak dinyatakan
abstract class Vehicle {
  String name;
  int maxSpeed;
  int fuelCapacity;
  int price;

  Vehicle(this.name, this.maxSpeed, this.fuelCapacity, this.price);

  void startEngine();
  void drive();  
}

// Inheritance: pewarisan sifat dari parent class ke sub class, dapat dilihat dari keyword extends
// Polymorphism: object bisa memiliki banyak bentuk, dapat dilihat dari implementasi @override, di mana dilakukan method overriding
class Car extends Vehicle {
  bool isHypercar;

  Car(super.name, super.maxSpeed, super.fuelCapacity, super.price, this.isHypercar);
  
  @override
  void startEngine() {
    print("${name} is starting...");
    print("${name} is ready to go!");
  }

  @override
  void drive() {
    print("${name} is moving at ${maxSpeed} km/h.");
  }
}

// Inheritance: pewarisan sifat dari parent class ke sub class, dapat dilihat dari keyword extends
// Polymorphism: object bisa memiliki banyak bentuk, dapat dilihat dari implementasi @override, di mana dilakukan method overriding
class Motorcycle extends Vehicle {
  bool isHyperbike;

  Motorcycle(super.name, super.maxSpeed, super.fuelCapacity, super.price, this.isHyperbike);

  @override
  void startEngine() {
    print("${name} is revving it's engine...");
    print("${name} is ready!");
  }

  @override
  void drive() {
    print("${name} is tearing up the streets at ${maxSpeed}");
  }
}

// Polymorphism: object bisa memiliki banyak bentuk, dapat dilihat dari implementasi @override, di mana dilakukan generalisasi di mana Car dan Motorcycle disimpan ke dalam 1 list yang sama dengan tipe data Vehicle
// Encapsulation: menyembunyikan data penting dengan private access modifier (atribut _vehicleList di mana '_' ditambahkan ke awal nama atributnya), untuk mengakses dan mengubah atribut vehicleList, dibuat getter (getVehicles) dan juga setter (addVehicles)
class Customer {
  String name;
  List<Vehicle> _vehicleList;

  Customer(this.name, this._vehicleList);

  List<Vehicle> getVehicles() {
    return _vehicleList;
  }
  
  // List<Vehicle> get getVehicles => _vehicleList;

  void addVehicles(Vehicle vehicle) {
    _vehicleList.add(vehicle);
  }

  // void addVehicles(Vehicle vehicle) => _vehicleList.add(vehicle);

  void pay(int amount) {
    int totalPrice = 0;
    int totalVehicle = 0;

    for (Vehicle vehicle in _vehicleList) {
      totalPrice += vehicle.price;
      totalVehicle++;
    }

    if (amount >= totalPrice) {
      print("You've successfully purchased ${totalVehicle} vehicle(s). Remaining money: ${amount - totalPrice}.");
    } else {
      print("The amount you paid is not enough.");
    }
  }
}

class VehicleNamed {
  String name;
  int maxSpeed;
  int fuelCapacity;
  int price;

  // Named Constructor
  VehicleNamed({required this.name, required this.maxSpeed, required this.fuelCapacity, required this.price});
}

void main() {
  Car myCar = Car("LaFerrari", 200, 300, 1000000, true);

  Motorcycle myMotorcycle = Motorcycle("Harley", 150, 500, 500000, true);

  myCar.startEngine();
  myMotorcycle.startEngine();
  myMotorcycle.drive();

  Customer myCustomer = Customer("John", []);
  myCustomer.addVehicles(myCar);
  myCustomer.addVehicles(myMotorcycle);

  for (Vehicle vehicle in myCustomer.getVehicles()) {
    print(vehicle.name);
  }

  myCustomer.pay(2000000);

  // Contoh Named Constructor ketika dipanggil
  VehicleNamed test = VehicleNamed(name: "Test", maxSpeed: 10, fuelCapacity: 90, price: 5000);
  print("${test.name} ${test.maxSpeed} ${test.fuelCapacity} ${test.price}");
}