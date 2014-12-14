as yet unclassified
testSendAuthenticationInfo
	| msg invoked resp respMsg |

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invoked := true.
				invocation returnResultLast: (ASN1Array new
					add: (ASN1Dictionary new
							at: 'rand' put: #[0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5];
							at: 'sres' put: #[0 1 2 3];
							at: 'kc' put: #[0 1 2 3 4 5 6 7];
							yourself);
					yourself).
				diag requestTcEnd: false]].

	msg := MAPProxyMessageBase readFrom: MAPProxySendAuthenticationInfoTest new exampleData readStream.
	msg dispatchMAPProxyOn: readDelegate.
	self deny: readDelegate connection isTerminated.
	self assert: invoked.
	self assert: readDelegate connection writeQueue size equals: 1.

	"TODO: We should inject an IPA muxed message and demux it here as well."
	resp := readDelegate connection writeQueue next.
	respMsg := MAPProxyMessageBase readFrom: (resp readStream skip: 4; yourself).
	self assert: respMsg class equals: MAPProxySendAuthenticationInfoResult.