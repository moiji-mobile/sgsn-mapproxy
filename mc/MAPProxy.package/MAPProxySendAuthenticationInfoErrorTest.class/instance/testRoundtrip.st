as yet unclassified
testRoundtrip
	| msg input |
	input := #[9 1 8 25 50 84 118 152 16 50 84 2 1 7].
	msg := MAPProxyMessageBase readFrom: input readStream.
	self assert: msg class equals: MAPProxySendAuthenticationInfoError.
	self assert: msg mobileIdentity fromTBCD equals: '9123456789012345'.
	self assert: msg cause equals: #[7].

	self assert: msg toMessage asByteArray equals: input.