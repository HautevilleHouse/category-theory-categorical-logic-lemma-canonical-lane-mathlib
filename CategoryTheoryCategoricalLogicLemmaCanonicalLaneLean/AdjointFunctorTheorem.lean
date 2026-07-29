import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure AdjointFunctorTheoremPackage where
  categoryC : Type u
  categoryD : Type v
  functorF : Type u → Type v
  functorG : Type v → Type u
  adjunctionIso : Prop
  unitCounitCondition : Prop
  triangularIdentities : Prop

structure AdjointFunctorTheoremEvidence (A : AdjointFunctorTheoremPackage) where
  adjunctionIsoClosed : A.adjunctionIso
  unitCounitConditionClosed : A.unitCounitCondition
  triangularIdentitiesClosed : A.triangularIdentities

def AdjointFunctorTheoremClosed (A : AdjointFunctorTheoremPackage) : Prop :=
  A.adjunctionIso ∧ A.unitCounitCondition ∧ A.triangularIdentities

theorem adjoint_functor_theorem_closed_from_evidence (A : AdjointFunctorTheoremPackage) (E : AdjointFunctorTheoremEvidence A) :
    AdjointFunctorTheoremClosed A := by
  exact And.intro E.adjunctionIsoClosed (And.intro E.unitCounitConditionClosed E.triangularIdentitiesClosed)

end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean
end HautevilleHouse