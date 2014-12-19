as yet unclassified
testReplace
	| match |
	match :=MAPProxyGT new
				imsiRange: '.*' asRegex;
				replaceStart: '12345';
				yourself.
	self assert: (match matches: '1234').
	self assert: (match prepare: '666666') equals: '123456'.