import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure LimitColimitConstructionPackage where
  diagram : Type u
  cone : Type v
  limitObject : Type w
  universalProperty : Prop
  colimitObject : Type w
  cocone : Type v
  colimitUniversalProperty : Prop

structure LimitColimitConstructionEvidence (L : LimitColimitConstructionPackage) where
  limitObjectClosed : L.universalProperty
  colimitObjectClosed : L.colimitUniversalProperty

def LimitColimitConstructionClosed (L : LimitColimitConstructionPackage) : Prop :=
  L.universalProperty ∧ L.colimitUniversalProperty

theorem limit_colimit_construction_closed_from_evidence (L : LimitColimitConstructionPackage) (E : LimitColimitConstructionEvidence L) :
    LimitColimitConstructionClosed L := by
  exact And.intro E.limitObjectClosed E.colimitObjectClosed

end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean
end HautevilleHouse