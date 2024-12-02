// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$collectionPagingRepositoryHash() =>
    r'b1665b30dbb3a0ea0607d6c342936820297304d8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [collectionPagingRepository].
@ProviderFor(collectionPagingRepository)
const collectionPagingRepositoryProvider = CollectionPagingRepositoryFamily();

/// See also [collectionPagingRepository].
class CollectionPagingRepositoryFamily
    extends Family<CollectionPagingRepository<Todo>> {
  /// See also [collectionPagingRepository].
  const CollectionPagingRepositoryFamily();

  /// See also [collectionPagingRepository].
  CollectionPagingRepositoryProvider call(
    CollectionParam<Todo> query,
  ) {
    return CollectionPagingRepositoryProvider(
      query,
    );
  }

  @override
  CollectionPagingRepositoryProvider getProviderOverride(
    covariant CollectionPagingRepositoryProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'collectionPagingRepositoryProvider';
}

/// See also [collectionPagingRepository].
class CollectionPagingRepositoryProvider
    extends AutoDisposeProvider<CollectionPagingRepository<Todo>> {
  /// See also [collectionPagingRepository].
  CollectionPagingRepositoryProvider(
    CollectionParam<Todo> query,
  ) : this._internal(
          (ref) => collectionPagingRepository(
            ref as CollectionPagingRepositoryRef,
            query,
          ),
          from: collectionPagingRepositoryProvider,
          name: r'collectionPagingRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$collectionPagingRepositoryHash,
          dependencies: CollectionPagingRepositoryFamily._dependencies,
          allTransitiveDependencies:
              CollectionPagingRepositoryFamily._allTransitiveDependencies,
          query: query,
        );

  CollectionPagingRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final CollectionParam<Todo> query;

  @override
  Override overrideWith(
    CollectionPagingRepository<Todo> Function(
            CollectionPagingRepositoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CollectionPagingRepositoryProvider._internal(
        (ref) => create(ref as CollectionPagingRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<CollectionPagingRepository<Todo>> createElement() {
    return _CollectionPagingRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionPagingRepositoryProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CollectionPagingRepositoryRef
    on AutoDisposeProviderRef<CollectionPagingRepository<Todo>> {
  /// The parameter `query` of this provider.
  CollectionParam<Todo> get query;
}

class _CollectionPagingRepositoryProviderElement
    extends AutoDisposeProviderElement<CollectionPagingRepository<Todo>>
    with CollectionPagingRepositoryRef {
  _CollectionPagingRepositoryProviderElement(super.provider);

  @override
  CollectionParam<Todo> get query =>
      (origin as CollectionPagingRepositoryProvider).query;
}

String _$todoControllerHash() => r'01b4dc554c81628798cfb113a81160330e3a7d4b';

/// See also [TodoController].
@ProviderFor(TodoController)
final todoControllerProvider =
    AutoDisposeAsyncNotifierProvider<TodoController, List<Todo>>.internal(
  TodoController.new,
  name: r'todoControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todoControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TodoController = AutoDisposeAsyncNotifier<List<Todo>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
