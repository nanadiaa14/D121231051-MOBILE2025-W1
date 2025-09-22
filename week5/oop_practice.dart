mixin A {
  void testA() => print('Test A function');
}

mixin B {
  void testB() => print('Test B function');
}

class Service with A, B {
  void doTest() {
    testA();
  }
  Service();
}

void main(){
  Service service = Service();
  service.testA();
  service.testB();
}