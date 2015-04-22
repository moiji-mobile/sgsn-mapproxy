as yet unclassified
write: anInfo on: aMessage with: anAttribute
	| info |
	self flag: #todo. "Use the TLV toMessage directly on anInfo.."
	info := ByteArray streamContents: [ :stream |
		stream nextPut: 16r10; nextPut: anInfo contextId asByteArray size; nextPutAll: anInfo contextId asByteArray.
		stream nextPut: 16r11; nextPut: anInfo type asByteArray size; nextPutAll: anInfo type asByteArray.
		stream nextPut: 16r12; nextPut: anInfo apn size; nextPutAll: anInfo apn.
		stream nextPut: 16r14; nextPut: anInfo qualityOfService size; nextPutAll: anInfo qualityOfService].
	aMessage
		nextPut: info size;
		nextPutAll: info.