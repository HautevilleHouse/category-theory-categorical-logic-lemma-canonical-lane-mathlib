import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure MonadPackage (C : Type u) [Category.{v} C] where
  endofunctor : C ⥤ C
  unit : 𝟙 C ⟶ endofunctor
  multiplication : endofunctor ⋙ endofunctor ⟶ endofunctor
  associativity : Prop
  unitConditions : Prop
  algebras : Type (max u v)
  emComparison : Prop

structure MonadEvidence (C : Type u) [Category.{v} C] (M : MonadPackage C) where
  associativityClosed : M.associativity
  unitConditionsClosed : M.unitConditions
  emComparisonClosed : M.emComparison

def MonadClosed (C : Type u) [Category.{v} C] (M : MonadPackage C) : Prop :=
  M.associativity ∧ M.unitConditions ∧ M.emComparison

theorem monad_closed_from_evidence
    (C : Type u) [Category.{v} C] (M : MonadPackage C) (E : MonadEvidence C M) :
    MonadClosed C M := by
  exact And.intro E.associativityClosed (And.intro E.unitConditionsClosed E.emComparisonClosed)

end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean
end HautevilleHouse