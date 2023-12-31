// Mocks generated by Mockito 5.4.2 from annotations
// in flutter_blackjack/test/modules/game/domain/usecases/shuffle_deck.usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_blackjack/modules/game/domain/entities/entities.dart'
    as _i2;
import 'package:flutter_blackjack/modules/game/domain/repositories/deck.repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDeckEntity_0 extends _i1.SmartFake implements _i2.DeckEntity {
  _FakeDeckEntity_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DeckRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeckRepository extends _i1.Mock implements _i3.DeckRepository {
  @override
  _i4.Future<_i2.DeckEntity> createDeck() => (super.noSuchMethod(
        Invocation.method(
          #createDeck,
          [],
        ),
        returnValue: _i4.Future<_i2.DeckEntity>.value(_FakeDeckEntity_0(
          this,
          Invocation.method(
            #createDeck,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.DeckEntity>.value(_FakeDeckEntity_0(
          this,
          Invocation.method(
            #createDeck,
            [],
          ),
        )),
      ) as _i4.Future<_i2.DeckEntity>);

  @override
  _i4.Future<_i2.DeckEntity> shuffleDeck({required String? deckId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #shuffleDeck,
          [],
          {#deckId: deckId},
        ),
        returnValue: _i4.Future<_i2.DeckEntity>.value(_FakeDeckEntity_0(
          this,
          Invocation.method(
            #shuffleDeck,
            [],
            {#deckId: deckId},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.DeckEntity>.value(_FakeDeckEntity_0(
          this,
          Invocation.method(
            #shuffleDeck,
            [],
            {#deckId: deckId},
          ),
        )),
      ) as _i4.Future<_i2.DeckEntity>);
}
