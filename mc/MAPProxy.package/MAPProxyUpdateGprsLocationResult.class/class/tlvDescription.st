as yet unclassified
tlvDescription
	^OrderedCollection new
		add: MAPProxyMobileIdentity tlvDescription;
		add: (MAPProxyPDPInfoComplete tlvDescription beOptional; yourself);
		add: (MAPProxyPDPInfo attributeTlvDescription beOptional; yourself);
		yourself