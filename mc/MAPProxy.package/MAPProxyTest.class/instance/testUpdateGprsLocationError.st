as yet unclassified
testUpdateGprsLocationError
	| invoked resp respMsg |

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |

				invoked := true.
				invocation returnErrorNamed: 'unexpectedDataValue'.
				diag requestTcEnd: false]].

	self inject: MAPProxyUpdateGprsLocationTest new exampleData.
	self deny: readDelegate connection isTerminated.
	self assert: readDelegate connection writeQueue size equals: 1.

	"TODO: We should demux it here properly!"
	resp := readDelegate connection writeQueue next.
	respMsg := MAPProxyMessageBase readFrom: (resp readStream skip: 4; yourself).
	self assert: respMsg class equals: MAPProxyUpdateGprsLocationError.