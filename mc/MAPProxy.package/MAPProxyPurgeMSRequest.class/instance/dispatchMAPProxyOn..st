as yet unclassified
dispatchMAPProxyOn: aReadDelegate
	[
		aReadDelegate mapProxy purgeMS: self for: aReadDelegate
	] ifCurtailed: [
		aReadDelegate mapProxy returnPurgeMSFailureFor: self on: aReadDelegate
	]