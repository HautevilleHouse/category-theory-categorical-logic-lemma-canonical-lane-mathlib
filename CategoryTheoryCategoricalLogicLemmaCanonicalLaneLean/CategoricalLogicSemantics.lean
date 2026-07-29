import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure CategoricalLogicSemanticsPackage (C : Type u) [Category.{v} C] where
  syntacticCategory : Type u
  syntacticCategoryCategory : Category.{v} syntacticCategory
  interpretation : syntacticCategory ⥤ C
  soundness : Prop
  completeness : Prop

structure CategoricalLogicSemanticsEvidence
    {C : Type u} [Category.{v} C] (S : CategoricalLogicSemanticsPackage C) where
  soundnessClosed : S.soundness
  completenessClosed : S.completeness

def CategoricalLogicSemanticsClosed {C : Type u} [Category.{v} C]
    (S : CategoricalLogicSemanticsPackage C) : Prop :=
  S.soundness ∧ S.completeness

theorem categorical_logic_semantics_closed_from_evidence
    {C : Type u} [Category.{v} C] (S : CategoricalLogicSemanticsPackage C)
    (E : CategoricalLogicSemanticsEvidence S) :
    CategoricalLogicSemanticsClosed S := by
  exact And.intro E.soundnessClosed E.completenessClosed

end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean
end HautevilleHouse