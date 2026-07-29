import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure AdjointFunctorPackage (C D : Type u) [𝒞 : Category C] [𝒟 : Category D] (F : Functor C D) (G : Functor D C) where
  unitTransformation : 𝟙 C ⟹ G ∘ F
  counitTransformation : F ∘ G ⟹ 𝟙 D
  triangleIdentitiesLeft : ∀ (c : C), G.map (counitTransformation.app (F.obj c)) ∘ unitTransformation.app c = 𝟙 (G.obj (F.obj c))
  triangleIdentitiesRight : ∀ (d : D), counitTransformation.app d ∘ F.map (unitTransformation.app (G.obj d)) = 𝟙 d

structure AdjointFunctorEvidence {C D : Type u} [𝒞 : Category C] [𝒟 : Category D] {F : Functor C D} {G : Functor D C} (P : AdjointFunctorPackage C D F G) where
  unitTransformationClosed : P.unitTransformation = 𝟙 C ⟹ G ∘ F
  counitTransformationClosed : P.counitTransformation = F ∘ G ⟹ 𝟙 D
  triangleIdentitiesLeftClosed : P.triangleIdentitiesLeft = ∀ (c : C), G.map (P.counitTransformation.app (F.obj c)) ∘ P.unitTransformation.app c = 𝟙 (G.obj (F.obj c))
  triangleIdentitiesRightClosed : P.triangleIdentitiesRight = ∀ (d : D), P.counitTransformation.app d ∘ F.map (P.unitTransformation.app (G.obj d)) = 𝟙 d

def AdjointFunctorClosed {C D : Type u} [𝒞 : Category C] [𝒟 : Category D] {F : Functor C D} {G : Functor D C} (P : AdjointFunctorPackage C D F G) : Prop :=
  (∀ (c : C), G.map (P.counitTransformation.app (F.obj c)) ∘ P.unitTransformation.app c = 𝟙 (G.obj (F.obj c))) ∧
  (∀ (d : D), P.counitTransformation.app d ∘ F.map (P.unitTransformation.app (G.obj d)) = 𝟙 d)

theorem adjoint_functor_closed_from_evidence {C D : Type u} [𝒞 : Category C] [𝒟 : Category D] {F : Functor C D} {G : Functor D C} (P : AdjointFunctorPackage C D F G) (E : AdjointFunctorEvidence P) : AdjointFunctorClosed P :=
  by
    constructor
    · intro c
      exact E.triangleIdentitiesLeftClosed c
    · intro d
      exact E.triangleIdentitiesRightClosed d

end HautevilleHouse
end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean