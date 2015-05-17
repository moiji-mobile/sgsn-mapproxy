as yet unclassified
testPurgeMSWithHLRNumber
	| invoked resp respMsg sgsnNumber operationName calledAddress |

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				calledAddress := diag transaction address.
				invoked := true.
				operationName := invocation invocation operationName.
				sgsnNumber := invocation argument sgsn_Number.
				invocation returnResultLast: nil.
				diag requestTcEnd: false]].

	self inject: MAPProxyPurgeMSRequestTest new exampleDataWithHLRNumber.
	self deny: readDelegate connection isTerminated.
	self assert: invoked.
	self assert: sgsnNumber notNil.
	self assert: sgsnNumber fromE164 equals: '123'.
	self assert: operationName equals: 'purgeMSV3'.
	self assert: calledAddress parseGlobalTitle address equals: '38166213323'.
	self assert: readDelegate connection writeQueue size equals: 1.

	"TODO: We should demux it here properly!"
	resp := readDelegate connection writeQueue next.
	respMsg := MAPProxyMessageBase readFrom: (resp readStream skip: 4; yourself).
	self assert: respMsg class equals: MAPProxyPurgeMSResult.
	