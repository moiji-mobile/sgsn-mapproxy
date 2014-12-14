as yet unclassified
write: anAuthTuple on: aMessage with: anAttribute
	| tuple |
	tuple := ByteArray streamContents: [:stream |
		stream
			nextPut: 16r20; nextPut: anAuthTuple rand size; nextPutAll: anAuthTuple rand;
			nextPut: 16r21; nextPut: anAuthTuple sres size; nextPutAll: anAuthTuple sres;
			nextPut: 16r22; nextPut: anAuthTuple kc size; nextPutAll: anAuthTuple kc].
	aMessage
		nextPut: tuple size;
		nextPutAll: tuple.