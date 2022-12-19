abstract class CounterRepository {
  Future<int> process(int value);
}

class CounterService extends CounterRepository {
  @override
  Future<int> process(int value) async{
    // TODO: implement process
    return await Future.value(value + 1);
  }
}
