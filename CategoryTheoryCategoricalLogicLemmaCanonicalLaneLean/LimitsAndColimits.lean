import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure LimitConstruction where
  diagram : Type u â Type v
  limitObject : Type w
  limitCone : Prop
  universalProperty : Prop

structure LimitEvidence (L : LimitConstruction) where
  limitConeClosed : L.limitCone
  universalPropertyClosed : L.universalProperty

def LimitClosed (L : LimitConstruction) : Prop :=
  L.limitCone â§ L.universalProperty

theorem limit_closed_from_evidence (L : LimitConstruction) (E : LimitEvidence L) : LimitClosed L := by
  exact And.intro E.limitConeClosed E.universalPropertyClosed

structure ColimitConstruction where
  diagram : Type u â Type v
  colimitObject : Type w
  colimitCocone : Prop
  universalProperty : Prop

structure ColimitEvidence (C : ColimitConstruction) where
  colimitCoconeClosed : C.colimitCocone
  universalPropertyClosed : C.universalProperty

def ColimitClosed (C : ColimitConstruction) : Prop :=
  C.colimitCocone â§ C.universalProperty

theorem colimit_closed_from_evidence (C : ColimitConstruction) (E : ColimitEvidence C) : ColimitClosed C := by
  exact And.intro E.colimitCoconeClosed E.universalPropertyClosed

end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean
end HautevilleHouse