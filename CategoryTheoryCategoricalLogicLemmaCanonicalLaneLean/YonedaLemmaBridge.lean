import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure YonedaLemmaPackage (C : Type u) [𝒞 : Category C] (X : C) (F : Functor C Set) where
  naturalIsomorphism : (Yoneda.obj X) ≅ F
  evaluationAtIdentity : (naturalIsomorphism.hom.app X) (𝟙 X) = F.map (𝟙 X) (F.obj X)
  naturalityCondition : ∀ (Y : C) (f : X ⟶ Y) (g : Yoneda.obj X).obj Y, (F.map f) ((naturalIsomorphism.hom.app Y) g) = (naturalIsomorphism.hom.app X) (g ∘ f)

structure YonedaLemmaEvidence {C : Type u} [𝒞 : Category C] {X : C} {F : Functor C Set} (P : YonedaLemmaPackage C X F) where
  evaluationAtIdentityClosed : P.evaluationAtIdentity = (P.naturalIsomorphism.hom.app X) (𝟙 X) = F.map (𝟙 X) (F.obj X)
  naturalityConditionClosed : P.naturalityCondition = ∀ (Y : C) (f : X ⟶ Y) (g : (Yoneda.obj X).obj Y), (F.map f) ((P.naturalIsomorphism.hom.app Y) g) = (P.naturalIsomorphism.hom.app X) (g ∘ f)

def YonedaLemmaClosed {C : Type u} [𝒞 : Category C] {X : C} {F : Functor C Set} (P : YonedaLemmaPackage C X F) : Prop :=
  P.evaluationAtIdentity ∧ P.naturalityCondition

theorem yoneda_lemma_closed_from_evidence {C : Type u} [𝒞 : Category C] {X : C} {F : Functor C Set} (P : YonedaLemmaPackage C X F) (E : YonedaLemmaEvidence P) : YonedaLemmaClosed P :=
  by
    exact And.intro E.evaluationAtIdentityClosed E.naturalityConditionClosed

end HautevilleHouse
end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean