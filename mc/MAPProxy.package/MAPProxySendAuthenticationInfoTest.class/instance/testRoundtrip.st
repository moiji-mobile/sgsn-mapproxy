as yet unclassified
testRoundtrip
	| msg input |
	input := #[8 1 8 25 50 84 118 152 16 50 84].
	msg := MAPProxyMessageBase readFrom: input readStream.
	self assert: msg class equals: MAPProxySendAuthenticationInfo.
	self assert: msg mobileIdentity fromTBCD equals: '9123456789012345'.

	self assert: msg toMessage asByteArray equals: input.