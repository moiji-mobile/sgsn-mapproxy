as yet unclassified
endPoint: anEndpoint
	endPoint := anEndpoint.
	endPoint onDialogue: [:diag |
		"In case we run on the HLR code or such"
		(diag dialogue respondsTo: #removeDefaultSubscription) ifTrue: [
			diag removeDefaultSubscription].
		diag onInvoke: [:inv |
			self handleInvocation: inv]]