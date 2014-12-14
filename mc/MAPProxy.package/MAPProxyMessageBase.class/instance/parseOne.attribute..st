as yet unclassified
parseOne: aStream attribute: anAttribute
	| tag |
	aStream atEnd ifTrue: [^false].

	"Get the tag"
	tag := aStream peek.

	"Is this the attribute we want to parse? Then move on."
	tag = anAttribute tag ifTrue: [
		aStream skip: 1.
		self doParse: anAttribute stream: aStream.
		^true].
	^false
