logging
formatForLogging
	^String streamContents: [:stream |
		stream nextPutAll: self class printString;
			nextPut: $(;
			nextPutAll: 'vlrNumber=';
			nextPutAll: (vlrNumber ifNil: ['nil']);
			nextPut: $)].