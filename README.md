# WikiText.jl

[![Build Status](https://travis-ci.org/dellison/WikiText.jl.svg?branch=master)](https://travis-ci.org/dellison/WikiText.jl)

[![Coverage Status](https://coveralls.io/repos/github/dellison/WikiText.jl/badge.svg?branch=master)](https://coveralls.io/github/dellison/WikiText.jl?branch=master)

[![codecov.io](http://codecov.io/github/dellison/WikiText.jl/coverage.svg?branch=master)](http://codecov.io/github/dellison/WikiText.jl?branch=master)

## About

WikiText.jl provides an interface to the [WikiText Long Term Dependency Language Modeling dataset](https://einstein.ai/research/the-wikitext-long-term-dependency-language-modeling-dataset).

## Usage

WikiText exports the following 4 types, corresponding to the 4
available datasets:

* `WikiText2v1`
* `WikiText103v1,`
* `WikiText2RawV1`
* `WikiText103RawV1`

Wikitext also exports following 3 functions: 

* `trainfile`
* `validationfile`
* `testfile`

Downloading and unzipping the datasets will happen automatically (with
your approval) when you access them for the first time, courtesy of
[DataDeps.jl](https://github.com/oxinabox/DataDeps.jl).

```julia
julia> Pkg.clone("https://github.com/dellison/WikiText.jl")
julia> using WikiText
julia> corpus = WikiText2v1()
julia> trainfile()
"/path/to/wiki.train.tokens"
julia> validfile()
"/path/to/wiki.valid.tokens"
```
