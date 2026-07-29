import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure LimitPackage (J C : Type u) [𝒥 : Category J] [𝒞 : Category C] (D : Functor J C) where
  cone : Cone D
  universalProperty : ∀ (c : Cone D), ∃! (f : c.pt ⟶ cone.pt), ∀ (j : J), f ≫ cone.π.app j = c.π.app j

structure LimitEvidence {J C : Type u} [𝒥 : Category J] [𝒞 : Category C] {D : Functor J C} (P : LimitPackage J C D) where
  coneClosed : P.cone = P.cone
  universalPropertyClosed : P.universalProperty = ∀ (c : Cone D), ∃! (f : c.pt ⟶ P.cone.pt), ∀ (j : J), f ≫ P.cone.π.app j = c.π.app j

def LimitClosed {J C : Type u} [𝒥 : Category J] [𝒞 : Category C] {D : Functor J C} (P : LimitPackage J C D) : Prop :=
  ∀ (c : Cone D), ∃! (f : c.pt ⟶ P.cone.pt), ∀ (j : J), f ≫ P.cone.π.app j = c.π.app j

theorem limit_closed_from_evidence {J C : Type u} [𝒥 : Category J] [𝒞 : Category C] {D : Functor J C} (P : LimitPackage J C D) (E : LimitEvidence P) : LimitClosed P :=
  by
    intro c
    exact E.universalPropertyClosed c

structure ColimitPackage (J C : Type u) [𝒥 : Category J] [𝒞 : Category C] (D : Functor J C) where
  cocone : Cocone D
  universalProperty : ∀ (c : Cocone D), ∃! (f : cocone.pt ⟶ c.pt), ∀ (j : J), cocone.ι.app j ≫ f = c.ι.app j

structure ColimitEvidence {J C : Type u} [𝒥 : Category J] [𝒞 : Category C] {D : Functor J C} (P : ColimitPackage J C D) where
  coconeClosed : P.cocone = P.cocone
  universalPropertyClosed : P.universalProperty = ∀ (c : Cocone D), ∃! (f : P.cocone.pt ⟶ c.pt), ∀ (j : J), P.cocone.ι.app j ≫ f = c.ι.app j

def ColimitClosed {J C : Type u} [𝒥 : Category J] [𝒞 : Category C] {D : Functor J C} (P : ColimitPackage J C D) : Prop :=
  ∀ (c : Cocone D), ∃! (f : P.cocone.pt ⟶ c.pt), ∀ (j : J), P.cocone.ι.app j ≫ f = c.ι.app j

theorem colimit_closed_from_evidence {J C : Type u} [𝒥 : Category J] [𝒞 : Category C] {D : Functor J C} (P : ColimitPackage J C D) (E : ColimitEvidence P) : ColimitClosed P :=
  by
    intro c
    exact E.universalPropertyClosed c

end HautevilleHouse
end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean