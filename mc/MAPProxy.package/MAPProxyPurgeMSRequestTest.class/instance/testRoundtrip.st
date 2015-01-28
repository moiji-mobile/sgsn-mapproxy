as yet unclassified
testRoundtrip
	| msg input |
	input := self exampleData.
	msg := MAPProxyMessageBase readFrom: input readStream.
	self assert: msg class equals: MAPProxyPurgeMSRequest.
	self assert: msg mobileIdentity fromTBCD equals: '9123456789012345'.

	self assert: msg toMessage asByteArray equals: input.

	msg mobileIdentity: '1234' toTBCD.
	self deny: msg toMessage asByteArray = input.
	msg mobileIdentity: '9123456789012345' toTBCD.
	self assert: msg toMessage asByteArray equals: input.