tests
testRoundtrip
	| input msg |
	input := self exampleData.
	msg := MAPProxyMessageBase readFrom: input readStream.
	self assert: msg class equals: MAPProxyUpdateGprsLocationResult.
	self assert: msg mobileIdentity fromTBCD equals: '1234567890'.
	self assert: msg msisdn equals: #[1 2].

	self assert: msg toMessage asByteArray equals: input.

	input := self exampleDataCharging.
	msg := MAPProxyMessageBase readFrom: input readStream.
	self assert: msg class equals: MAPProxyUpdateGprsLocationResult.
	self assert: msg mobileIdentity fromTBCD equals: '1234567890'.
	self assert: msg msisdn equals: #[1 2].
	self assert: msg chargingCharacteristics equals: #[23 42].
	self assert: msg pdpInfos first chargingCharacteristics equals: #[42 23].

	self assert: msg toMessage asByteArray equals: input.