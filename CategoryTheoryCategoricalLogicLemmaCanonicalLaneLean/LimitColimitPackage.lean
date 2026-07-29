import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure LimitColimitPackage (J C : Type u) [Category.{v} J] [Category.{v} C] where
  diagram : J ⥤ C
  limitCone : LimitCone diagram
  colimitCocone : ColimitCocone diagram
  limitUniversal : Prop
  colimitUniversal : Prop

structure LimitColimitEvidence {J C : Type u} [Category.{v} J] [Category.{v} C]
    (L : LimitColimitPackage J C) where
  limitUniversalClosed : L.limitUniversal
  colimitUniversalClosed : L.colimitUniversal

def LimitColimitClosed {J C : Type u} [Category.{v} J] [Category.{v} C]
    (L : LimitColimitPackage J C) : Prop :=
  L.limitUniversal ∧ L.colimitUniversal

theorem limit_colimit_closed_from_evidence
    {J C : Type u} [Category.{v} J] [Category.{v} C]
    (L : LimitColimitPackage J C) (E : LimitColimitEvidence L) :
    LimitColimitClosed L := by
  exact And.intro E.limitUniversalClosed E.colimitUniversalClosed

end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean
end HautevilleHouse