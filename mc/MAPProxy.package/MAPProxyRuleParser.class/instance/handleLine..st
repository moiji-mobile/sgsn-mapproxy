as yet unclassified
handleLine: aLine
	| parts imsi replace ssn operation gt |
	parts := aLine subStrings: ','.
	parts size = 4 ifFalse: [
		logger logError: 'Line does not have right amount of columns' with: { 'line' -> aLine. 'size' -> parts size }.
		^self].

	imsi := parts at: 1.
	replace := parts at: 2.
	ssn := parts at: 3.
	operation := parts at: 4.

	logger logNotice: 'Trying to add rule' with: { 'imsiRange' -> imsi. 'replaceStart' -> replace. 'callingSSN' -> ssn. 'operation' -> operation }.
	gt := MAPProxyGT new
			imsiRange: imsi asRegex;
			replaceStart: replace;
			callingSSN: (SCCPAddress perform: ssn asSymbol);
			operationForAuthentication: operation asSymbol asClass;
			yourself.
	mapProxy addGT: gt.