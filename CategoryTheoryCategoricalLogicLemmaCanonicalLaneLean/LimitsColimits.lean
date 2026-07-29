import canonicalLaneMathlib.LimitsColimits

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure LimitsColimitsPackage where
  category : Type u
  smallDiagrams : Type v
  limitsExist : Prop
  colimitsExist : Prop
  universalProperties : Prop

structure LimitsColimitsEvidence (L : LimitsColimitsPackage) where
  limitsExistClosed : L.limitsExist
  colimitsExistClosed : L.colimitsExist
  universalPropertiesClosed : L.universalProperties

def LimitsColimitsClosed (L : LimitsColimitsPackage) : Prop :=
  L.limitsExist ∧ L.colimitsExist ∧ L.universalProperties

theorem limits_colimits_closed_from_evidence (L : LimitsColimitsPackage)
    (E : LimitsColimitsEvidence L) : LimitsColimitsClosed L := by
  exact And.intro E.limitsExistClosed
    (And.intro E.colimitsExistClosed E.universalPropertiesClosed)

end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean
end HautevilleHouse
