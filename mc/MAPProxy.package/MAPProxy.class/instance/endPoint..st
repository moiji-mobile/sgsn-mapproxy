as yet unclassified
endPoint: anEndpoint
	endPoint := anEndpoint.
	endPoint onDialogue: [:diag |
		diag removeDefaultSubscription.
		diag onInvoke: [:inv |
			self handleInvocation: inv]]