# WikiText.jl

[![Build Status](https://travis-ci.org/dellison/WikiText.jl.svg?branch=master)](https://travis-ci.org/dellison/WikiText.jl)

[![Coverage Status](https://coveralls.io/repos/dellison/WikiText.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/dellison/WikiText.jl?branch=master)

[![codecov.io](http://codecov.io/github/dellison/WikiText.jl/coverage.svg?branch=master)](http://codecov.io/github/dellison/WikiText.jl?branch=master)

## About

This package provides an interface to the [WikiText Long Term Dependency Language Modeling dataset](https://einstein.ai/research/the-wikitext-long-term-dependency-language-modeling-dataset).

## Usage

WikiText exports the following types:

* `WikiText2v1`
* `WikiText103v1,`
* `WikiText2RawV1`
* `WikiText103RawV1`

Wikitext also exports following 3 functions: 

* `trainfile`
* `validationfile`
* `testfile`

Downloading the datasets will happen automatically (with your
approval) when you access them for the first time, courtesy of
[DataDeps.jl](https://github.com/oxinabox/DataDeps.jl).

```julia
julia> Pkg.clone("https://github.com/dellison/WikiText.jl")
julia> using WikiText
julia> corpus = WikiText2v1()
julia> trainfile(corpus)
"/path/to/wiki.train.tokens"
```

