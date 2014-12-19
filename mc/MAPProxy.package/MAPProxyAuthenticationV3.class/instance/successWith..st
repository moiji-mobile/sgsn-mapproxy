as yet unclassified
successWith: aBlock
	[
		| res |
		res := aBlock value.
		onSuccess value: res
	] ifCurtailed: [
		self failure.
	]