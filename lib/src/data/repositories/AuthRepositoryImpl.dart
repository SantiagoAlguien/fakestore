import 'package:fakestore/src/data/datasources/UserRemote.dart';
import 'package:fakestore/src/data/mapper/ProductMapper.dart';
import 'package:fakestore/src/domain/entities/user/User.dart';
import 'package:fakestore/src/domain/gateway/user_gateway.dart';

class AuthRepositoryImpl implements AuthGateway {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<User> login(String email, String password) async {
    var userMapper = await dataSource.login(email, password);
    
    return User(
      id: userMapper.id,
      email: userMapper.email,
      password: userMapper.password,
      username: userMapper.username,
      phone: userMapper.phone,
      name: Name(
        firstname: userMapper.name.firstname, 
        lastname: userMapper.name.lastname
      ),
      address: Address(
        city: userMapper.address.city, 
        street: userMapper.address.street, 
        number: userMapper.address.number, 
        zipcode: userMapper.address.zipcode, 
        geolocation: Geolocation(lat: userMapper.address.geolocation.lat, long: userMapper.address.geolocation.long)
        )
      );
  }
  
  @override
  Future<User> register(
      String email,
      String username,
      String password,
      String phone,
      String firstName,
      String lastName,
      String city,
      String street,
      int number,
      String zipcode,
      String lat,
      String long,
    ) async{
    var userMapper = await dataSource.register(
      email, 
      username, 
      password, 
      phone, 
      firstName, 
      lastName, 
      city, 
      street as int, 
      number as String, 
      zipcode, 
      lat, 
      long
    );
    return User(
      id: userMapper.id,
      email: userMapper.email,
      password: userMapper.password,
      username: userMapper.username,
      phone: userMapper.phone,
      name: Name(
        firstname: userMapper.name.firstname, 
        lastname: userMapper.name.lastname
      ),
      address: Address(
        city: userMapper.address.city, 
        street: userMapper.address.street, 
        number: userMapper.address.number, 
        zipcode: userMapper.address.zipcode, 
        geolocation: Geolocation(lat: userMapper.address.geolocation.lat, long: userMapper.address.geolocation.long)
        )
      );
  }

  // @override
  // Future<User> register(
  //   String email, 
  //   String password, ...) async {
  //   final userMapper = await remoteDataSource.register(email, password, username,);
  //   // Convertir UserMapper a User
  //   return User(...);
  // }
}
