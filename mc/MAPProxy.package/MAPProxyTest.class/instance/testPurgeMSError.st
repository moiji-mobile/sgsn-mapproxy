as yet unclassified
testPurgeMSError
	| invoked resp respMsg |

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invoked := true.
				invocation returnError: 'dataMissing' with: nil.
				diag requestTcEnd: false]].

	self inject: MAPProxyPurgeMSRequestTest new exampleData.
	self deny: readDelegate connection isTerminated.
	self assert: invoked.
	self assert: readDelegate connection writeQueue size equals: 1.

	"TODO: We should demux it here properly!"
	resp := readDelegate connection writeQueue next.
	respMsg := MAPProxyMessageBase readFrom: (resp readStream skip: 4; yourself).
	self assert: respMsg class equals: MAPProxyPurgeMSError.
	