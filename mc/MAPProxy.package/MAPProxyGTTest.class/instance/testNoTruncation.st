tests
testNoTruncation
	| match |
	match :=MAPProxyGT new
				imsiRange: '(66601).*' asRegex;
				replaceStart: '8490';
				yourself.
	self assert: (match matches: '666014100032999').
	self assert: (match prepare: '666014100032999') equals: '84904100032999'.