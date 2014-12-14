as yet unclassified
testRoundtrip
	| msg input |
	input := #[10 1 8 25 50 84 118 152 16 50 84 3 34 32 16 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 33 4 33 34 35 36 34 8 49 50 51 52 53 54 55 56 3 34 32 16 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143 144 33 4 161 162 163 164 34 8 177 178 179 180 181 182 183 184].
	msg := MAPProxyMessageBase readFrom: input readStream.
	self assert: msg class equals: MAPProxySendAuthenticationInfoResult.
	self assert: msg mobileIdentity fromTBCD equals: '9123456789012345'.
	self assert: msg authTuples size equals: 2.


	self assert: msg toMessage asByteArray equals: input.