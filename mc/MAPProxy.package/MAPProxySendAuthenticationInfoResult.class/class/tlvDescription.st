as yet unclassified
tlvDescription
	^OrderedCollection new
		add: MAPProxyMobileIdentity tlvDescription;
		add: MAPProxyAuthTuple attributeTlvDescription;
		yourself.