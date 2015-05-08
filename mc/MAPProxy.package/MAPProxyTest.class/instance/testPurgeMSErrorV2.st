as yet unclassified
testPurgeMSErrorV2
	| invoked resp respMsg operationName |

	(mapProxy gtForIMSI: '123')
		operationForPurgeMS: MAPProxyPurgeMSV2Operation.

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				invoked := true.
				operationName := invocation invocation operationName.
				invocation returnError: 'dataMissing' with: nil.
				diag requestTcEnd: false]].

	self inject: MAPProxyPurgeMSRequestTest new exampleData.
	self deny: readDelegate connection isTerminated.
	self assert: invoked.
	self assert: operationName equals: 'purgeMSV2'.
	self assert: readDelegate connection writeQueue size equals: 1.

	"TODO: We should demux it here properly!"
	resp := readDelegate connection writeQueue next.
	respMsg := MAPProxyMessageBase readFrom: (resp readStream skip: 4; yourself).
	self assert: respMsg class equals: MAPProxyPurgeMSError.
	