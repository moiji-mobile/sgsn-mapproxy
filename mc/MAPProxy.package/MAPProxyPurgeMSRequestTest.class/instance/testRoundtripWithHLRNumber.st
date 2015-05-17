as yet unclassified
testRoundtripWithHLRNumber
	| msg input |
	input := self exampleDataWithHLRNumber.
	msg := MAPProxyMessageBase readFrom: input readStream.
	self assert: msg class equals: MAPProxyPurgeMSRequest.
	self assert: msg mobileIdentity fromTBCD equals: '123456789012345'.
	self assert: msg hlrNumber fromE164 equals: '38166213323'.

	self assert: msg toMessage asByteArray equals: input.

	msg mobileIdentity: '1234' toTBCD.
	self deny: msg toMessage asByteArray = input.
	msg mobileIdentity: '123456789012345' toTBCD.
	self assert: msg toMessage asByteArray equals: input.