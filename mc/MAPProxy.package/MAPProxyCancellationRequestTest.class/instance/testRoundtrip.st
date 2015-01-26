as yet unclassified
testRoundtrip
	| msg input |
	input := self exampleData.
	msg := MAPProxyMessageBase readFrom: input readStream.
	self assert: msg class equals: MAPProxyCancellationRequest.
	self assert: msg mobileIdentity fromTBCD equals: '123456789012345'.
	self assert: msg cause equals: #[0].

	self assert: msg toMessage asByteArray equals: input.

	msg mobileIdentity: '123456789012345' toTBCD.
	msg cause: #[0].
	self assert: msg toMessage asByteArray equals: input.