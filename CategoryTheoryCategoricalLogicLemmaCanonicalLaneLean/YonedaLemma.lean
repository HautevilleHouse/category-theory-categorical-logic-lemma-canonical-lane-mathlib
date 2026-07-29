import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean

structure YonedaLemmaPackage where
  category : Type u
  object : Type v
  hom : Type w
  presheaf : Type u → Type v
  naturalTransformation : Type w
  yonedaEmbedding : Prop
  yonedaLemmaStatement : Prop
  naturalityCondition : Prop

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  yonedaLemmaStatementClosed : Y.yonedaLemmaStatement
  naturalityConditionClosed : Y.naturalityCondition

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.yonedaEmbedding ∧ Y.yonedaLemmaStatement ∧ Y.naturalityCondition

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage) (E : YonedaLemmaEvidence Y) :
    YonedaLemmaClosed Y := by
  exact And.intro E.yonedaEmbeddingClosed (And.intro E.yonedaLemmaStatementClosed E.naturalityConditionClosed)

end CategoryTheoryCategoricalLogicLemmaCanonicalLaneLean
end HautevilleHouse