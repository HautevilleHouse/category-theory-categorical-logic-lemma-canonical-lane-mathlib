import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure CategoryObject where
  carrier : Type u
  identityMorphism : carrier → carrier
  compositionLaw : (carrier → carrier → carrier) → Prop

structure AdmittedCategoryObject where
  object : CategoryObject
  hasLimits : Prop
  hasColimits : Prop
  yonedaEmbedding : Prop
  conclusion : hasLimits ∧ hasColimits ∧ yonedaEmbedding

def CategoryWitnessClosed (O : AdmittedCategoryObject) : Prop :=
  O.hasLimits ∧ O.hasColimits ∧ O.yonedaEmbedding

end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean
end HautevilleHouse