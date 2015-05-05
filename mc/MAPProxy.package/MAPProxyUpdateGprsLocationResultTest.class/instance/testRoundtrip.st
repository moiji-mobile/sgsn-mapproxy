as yet unclassified
testRoundtrip
	| input msg |
	input := self exampleData.
	msg := MAPProxyMessageBase readFrom: input readStream.
	self assert: msg class equals: MAPProxyUpdateGprsLocationResult.
	self assert: msg mobileIdentity fromTBCD equals: '1234567890'.
	self assert: msg msisdn equals: #[1 2].

	self assert: msg toMessage asByteArray equals: input.