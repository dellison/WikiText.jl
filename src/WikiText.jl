module WikiText

export WikiText2v1, WikiText103v1, WikiText2RawV1, WikiText103RawV1
export trainfile, validationfile, testfile

using DataDeps

abstract type WikiTextCorpus end

function filename(w::WikiTextCorpus, set)
    @assert set in [:train, :valid, :test]
    filename = "wiki.$set.$(suffix(w))"
    return joinpath(corpusdir(w), filename)
end

trainfile(w) = filename(w, :train)
validationfile(w) = filename(w, :valid)
testfile(w) = filename(w, :test)

abstract type WikiTextWordCorpus <: WikiTextCorpus end
abstract type WikiTextCharCorpus <: WikiTextCorpus end

suffix(w::WikiTextWordCorpus) = "tokens"
suffix(w::WikiTextCharCorpus) = "raw"

struct WikiText2v1   <: WikiTextWordCorpus end
struct WikiText103v1 <: WikiTextWordCorpus end

corpusdir(w::WikiText2v1)   = datadep"WikiText-2-v1"
corpusdir(w::WikiText103v1) = datadep"WikiText-103-v1"

struct WikiText2RawV1   <: WikiTextCharCorpus end
struct WikiText103RawV1 <: WikiTextCharCorpus end

corpusdir(w::WikiText2RawV1)   = datadep"WikiText-2-raw-v1"
corpusdir(w::WikiText103RawV1) = datadep"WikiText-103-raw-v1"


function __init__()

    # utility function
    moveup(x) = mv(x, joinpath("..", x))

    register(DataDep("WikiText-2-v1",
                     """
                     Dataset: WikiText-2 word level language modeling dataset
                     Author: Stephen Merity
                     License: CC-SA 3.0
                     Website: https://einstein.ai/research/the-wikitext-long-term-dependency-language-modeling-dataset
                     
                     Wikitext-2 word level long term dependency language modeling dataset.
  
                     """,
                     "https://s3.amazonaws.com/research.metamind.io/wikitext/wikitext-2-v1.zip",
                     "92675f1d63015c1c8b51f1656a52d5bdbc33aafa60cc47a218a66e7ee817488c",
                     post_fetch_method = function (zip)
                                             unpack(zip)
                                             pth(x) = joinpath("..", x)
                                             cd("wikitext-2") do
                                                 moveup("wiki.train.tokens")
                                                 moveup("wiki.test.tokens")
                                                 moveup("wiki.valid.tokens")
                                             end
                                             rm("wikitext-2")
                                         end))


    register(DataDep("WikiText-103-v1",
                     """
                     Dataset: WikiText-103 word level language modeling dataset
                     Author: Stephen Merity
                     License: CC-SA 3.0
                     Website: https://einstein.ai/research/the-wikitext-long-term-dependency-language-modeling-dataset
                     Size: 181 MB
                     
                     Wikitext-103 word level long term dependency language modeling dataset.
      
                     """,
                     "https://s3.amazonaws.com/research.metamind.io/wikitext/wikitext-103-v1.zip",
                     "242ba0f20b329cfdf1ccc61e9e9e5b59becf189db7f7a81cd2a0e2fc31539590",
                     post_fetch_method = function (zip)
                         unpack(zip)
                         cd("wikitext-103") do
                             moveup("wiki.train.tokens")
                             moveup("wiki.valid.tokens")
                             moveup("wiki.test.tokens")
                         end
                     end))


    register(DataDep("WikiText-2-raw-v1",
                     """
                     Dataset: WikiText-2 raw character level language modeling dataset
                     Author: Stephen Merity
                     License: CC-SA 3.0
                     Website: https://einstein.ai/research/the-wikitext-long-term-dependency-language-modeling-dataset
                     
                     Wikitext-2 raw character level long term dependency language modeling dataset.
  
                     """,
                     "https://s3.amazonaws.com/research.metamind.io/wikitext/wikitext-2-raw-v1.zip",
                     "ef7edb566e3e2b2d31b29c1fdb0c89a4cc683597484c3dc2517919c615435a11",
                     post_fetch_method = function (zip)
                         unpack(zip)
                         cd("wikitext-2-raw") do
                             moveup("wiki.train.raw")
                             moveup("wiki.valid.raw")
                             moveup("wiki.test.raw")
                         end
                         rm("wikitext-2-raw")
                     end))

    
    register(DataDep("WikiText-103-raw-v1",
                     """
                     Dataset: WikiText-2 word level language modeling dataset
                     Author: Stephen Merity
                     License: CC-SA 3.0
                     Website: https://einstein.ai/research/the-wikitext-long-term-dependency-language-modeling-dataset
                     
                     Wikitext-2 word level long term dependency language modeling dataset.
  
                     """,
                     "https://s3.amazonaws.com/research.metamind.io/wikitext/wikitext-103-raw-v1.zip",
                     "91c00ae287f0d699e18605c84afc9e45c192bc6b7797ff8837e5474655a33794",
                                         post_fetch_method = function (zip)
                         unpack(zip)
                         cd("wikitext-103-raw") do
                             moveup("wiki.train.raw")
                             moveup("wiki.valid.raw")
                             moveup("wiki.test.raw")
                         end
                         rm("wikitext-103-raw")
                     end))
end

end # module
