bytecode decoding
prepare: aString
	"If () is used in the expression let's replace the match with
	the prefix"
	imsiRangeMatch matches: aString.
	^((imsiRangeMatch matches: aString) and: [imsiRangeMatch subexpressionCount > 1])
		ifTrue: [
			| start end |
			start := (imsiRangeMatch subBeginning: 2) first.
			end := (imsiRangeMatch subEnd: 2) first.
			aString copyReplaceFrom: start + 1 to: end with: prefix]
		ifFalse: [
			aString copyReplaceFrom: 1 to: prefix size  with: prefix].