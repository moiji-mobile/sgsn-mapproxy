as yet unclassified
success: aResult
	[
		onSuccess value: aResult
	] ifCurtailed: [ 
		self failure]