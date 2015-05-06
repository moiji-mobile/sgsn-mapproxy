as yet unclassified
successWith: aBlock
	[
		| res |
		logger logDebug: 'Handling success' with: { 'dialogue' -> dialogue. 'imsi' -> imsi }.
		res := aBlock value.
		onSuccess value: res
	] ifCurtailed: [
		self failure.
	]