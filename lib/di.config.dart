// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i3;

import 'data/repo/repo-prouduct/proudect-repo-impl.dart' as _i5;
import 'data/repo/repo-prouduct/proudect-repo.dart' as _i4;
import 'screen/task-screen/taskscreen-viewmodel.dart' as _i6;
import 'third_party_packegs_modul.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyPackegsModul = _$ThirdPartyPackegsModul();
    gh.factory<_i3.InternetConnectionChecker>(
        () => thirdPartyPackegsModul.ProvideInternetConnectionChecker);
    gh.factory<_i4.RepoProuduct>(
        () => _i5.RepoProuductImpl(gh<_i3.InternetConnectionChecker>()));
    gh.factory<_i6.Productviewmodel>(
        () => _i6.Productviewmodel(gh<_i4.RepoProuduct>()));
    return this;
  }
}

class _$ThirdPartyPackegsModul extends _i7.ThirdPartyPackegsModul {}
