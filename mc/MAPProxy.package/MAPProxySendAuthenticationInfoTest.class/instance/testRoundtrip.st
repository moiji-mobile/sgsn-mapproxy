as yet unclassified
testRoundtrip
	| msg input |
	input := self exampleData.
	msg := MAPProxyMessageBase readFrom: input readStream.
	self assert: msg class equals: MAPProxySendAuthenticationInfo.
	self assert: msg mobileIdentity fromTBCD equals: '9123456789012345'.

	self assert: msg toMessage asByteArray equals: input.