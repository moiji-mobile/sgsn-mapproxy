as yet unclassified
newDialogue
	| diag |
	diag := endPoint newDialogue.
	(diag respondsTo: #removeDefaultSubscription) ifTrue: [
		diag removeDefaultSubscription].
	^diag