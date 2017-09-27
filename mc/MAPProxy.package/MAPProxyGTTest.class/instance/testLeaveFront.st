tests
testLeaveFront
	| match |
	match :=MAPProxyGT new
				imsiRange: '6(6601).*' asRegex;
				replaceStart: '8490';
				yourself.
	self assert: (match matches: '666014100032999').
	self assert: (match prepare: '666014100032999') equals: '684904100032999'.

	self assert: (match prepare: '666014100032999') equals: '684904100032999'.
	self assert: (match prepare: '888888888888888') equals: '849088888888888'.