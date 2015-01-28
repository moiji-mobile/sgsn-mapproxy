as yet unclassified
readFrom: aStream with: anAttribute
	| len |
	len := aStream next.
	len = 0 ifFalse: [^self error: 'Unexpected length'].
	^true