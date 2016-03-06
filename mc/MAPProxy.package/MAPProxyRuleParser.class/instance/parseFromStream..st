as yet unclassified
parseFromStream: aStream
	"Ignore the first line"
	aStream nextLine.
	
	[aStream atEnd] whileFalse: [
		| line |
		line := aStream nextLine.
		self handleLine: line]