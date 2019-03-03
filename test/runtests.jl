using WikiText, Test

@testset "WikiText" begin
    for corpus in [WikiText2(), WikiText103(),
                   WikiText2Raw(), WikiText103Raw()]
        @test isfile(trainfile(corpus))
        @test isfile(validfile(corpus))
        @test isfile(testfile(corpus))
    end
end
