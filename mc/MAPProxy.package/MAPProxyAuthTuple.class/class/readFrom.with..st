as yet unclassified
readFrom: aStream with: aTLVDescription 
	| len data rand sres kc |
	
	self flag: #todo. "Use the TLV infrastructure here..."

	len := aStream next.
	data := (aStream next: len) readStream.

	"Be lazy right now.."
	data skip: 2.
	rand := data next: 16.

	data skip: 2.
	sres := data next: 4.

	data skip: 2.
	kc := data next: 8.	

	data atEnd ifFalse: [^self error: 'Parse error auth not at end' ].
	^self new
		rand: rand; sres: sres; kc: kc;
		yourself