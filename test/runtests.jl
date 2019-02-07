using WikiText, Test

for corpus in [WikiText2v1(), WikiText103v1(),
               WikiText2RawV1(), WikiText103RawV1()]
    @test isfile(trainfile(corpus))
    @test isfile(validfile(corpus))
    @test isfile(testfile(corpus))
end
