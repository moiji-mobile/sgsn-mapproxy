as yet unclassified
readFrom: aStream with: aTLVListDescription 
	| len data contextId type apn qos chargingCharacteristics |
	self flag: #todo. "Use the TLV abstraction here"

	len := aStream next.
	data := (aStream next: len) readStream.

	data skip: 1.
	len := data next.
	contextId := (data next: len) asInteger.

	data skip: 1.
	len := data next.
	type := (data next: len).

	data skip: 1.
	len := data next.
	apn := data next: len.

	qos := #[].
	data peek = 16r13 ifTrue: [
		data skip: 1.
		len := data next.
		qos := data next: len
	].
	data peek = 16r14 ifTrue: [
		data skip: 1.
		len := data next.
		chargingCharacteristics := data next: len.
	].

	^self new
		contextId: contextId;
		type: type;
		apn: apn;
		qualityOfService: qos;
		chargingCharacteristics: chargingCharacteristics;
		yourself
	