as yet unclassified
testSendAuthenticationInfoFailure
	| invoked resp respMsg |

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invoked := true.
				invocation invocation returnErrorNamed: 'unknownSubscriber'.
				diag requestTcEnd: false]].

	self inject: MAPProxySendAuthenticationInfoTest new exampleData.
	self deny: readDelegate connection isTerminated.
	self assert: invoked.
	self assert: readDelegate connection writeQueue size equals: 1.

	"TODO: We should demux it here properly!"
	resp := readDelegate connection writeQueue next.
	respMsg := MAPProxyMessageBase readFrom: (resp readStream skip: 4; yourself).
	self assert: respMsg class equals: MAPProxySendAuthenticationInfoError.
	self assert: respMsg cause equals: #[2r10000].