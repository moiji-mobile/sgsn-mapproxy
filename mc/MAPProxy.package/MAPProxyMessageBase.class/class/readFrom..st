as yet unclassified
readFrom: aStream
	| type |
	type := aStream next.
	self allSubclassesDo: [:each |
		type = each messageType ifTrue: [
			^each new readFrom: aStream]].
	^self error: 'No handler for message type = ', type printString