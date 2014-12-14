as yet unclassified
readFrom: aStream
	| description tag  |
	description := self class tlvDescription.
	tag := nil.

	description do: [:attribute |
		attribute isList
			ifTrue: [
				| found |
				found := true.
				[found] whileTrue: [
					found := self parseOne: aStream attribute: attribute]]
			ifFalse: [self parseOne: aStream attribute: attribute]].
	"Error handling"
	aStream atEnd ifFalse: [^self error: 'Message not consumed']