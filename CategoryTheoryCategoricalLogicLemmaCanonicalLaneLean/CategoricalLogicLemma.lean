import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure CategoricalLogicLemmaPackage where
  category : Type u
  functorCategory : Type v
  interpretation : Type w
  soundness : Prop
  completeness : Prop

structure CategoricalLogicLemmaEvidence (C : CategoricalLogicLemmaPackage) where
  soundnessClosed : C.soundness
  completenessClosed : C.completeness

def CategoricalLogicLemmaClosed (C : CategoricalLogicLemmaPackage) : Prop :=
  C.soundness ∧ C.completeness

theorem categorical_logic_lemma_closed_from_evidence (C : CategoricalLogicLemmaPackage) (E : CategoricalLogicLemmaEvidence C) :
    CategoricalLogicLemmaClosed C := by
  exact And.intro E.soundnessClosed E.completenessClosed

end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean
end HautevilleHouse