as yet unclassified
dispatchMAPProxyOn: aReadDelegate
	[
		aReadDelegate mapProxy sendAuthenticationInfo: self for: aReadDelegate
	] ifCurtailed: [
		aReadDelegate mapProxy returnSendAuthenticationFailureFor: self on: aReadDelegate
	]