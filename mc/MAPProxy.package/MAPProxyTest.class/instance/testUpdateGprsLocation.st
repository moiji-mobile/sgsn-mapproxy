as yet unclassified
testUpdateGprsLocation
	| invoked resp respMsg |

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				| newInvocation |
				invoked := true.
				"TODO... send PDP context.."
				newInvocation := diag requestTcInvokeNamed: 'insertSubscriberDataV2' parameters:  ASN1Dictionary new class: 1 timeout: 500.
				newInvocation onReturnLast: [:ret | 
					invocation invocation returnResultLast: nil.
					diag requestTcEnd: false].
				diag requestTcContinue]].

	self inject: MAPProxyUpdateGprsLocationTest new exampleData.
	self deny: readDelegate connection isTerminated.
	self assert: readDelegate connection writeQueue size equals: 1.

	"TODO: We should demux it here properly!"
	resp := readDelegate connection writeQueue next.
	respMsg := MAPProxyMessageBase readFrom: (resp readStream skip: 4; yourself).
	self assert: respMsg class equals: MAPProxyUpdateGprsLocationResult.

	"TODO: Verify the MAP part matching the result. Current version does not do MAP yet"
	self assert: invoked.
	self assert: respMsg pdpInfos size equals: 2.