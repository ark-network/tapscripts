onboarding: 
	miniscript-compiler descriptor "${shell cat ./miniscript/boarding.miniscript}"	

vtxo:
	miniscript-compiler descriptor "${shell cat ./miniscript/vtxo.miniscript}"

unroll:
	miniscript-compiler descriptor "${shell cat ./miniscript/unroll.miniscript}"