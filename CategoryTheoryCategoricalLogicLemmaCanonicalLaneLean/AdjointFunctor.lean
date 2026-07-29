import canonicalLaneMathlib.AdjointFunctor

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure AdjointFunctorPackage where
  categoryC : Type u
  categoryD : Type v
  functorF : categoryC → categoryD
  functorG : categoryD → categoryC
  bijection : ∀ (c : categoryC) (d : categoryD), (functorF c → d) ≃ (c → functorG d)
  naturalityLeft : Prop
  naturalityRight : Prop
  unitCounit : Prop

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  naturalityLeftClosed : A.naturalityLeft
  naturalityRightClosed : A.naturalityRight
  unitCounitClosed : A.unitCounit

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.naturalityLeft ∧ A.naturalityRight ∧ A.unitCounit

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage)
    (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A := by
  exact And.intro E.naturalityLeftClosed
    (And.intro E.naturalityRightClosed E.unitCounitClosed)

end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean
end HautevilleHouse
