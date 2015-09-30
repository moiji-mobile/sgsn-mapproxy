as yet unclassified
testUpdateGprsLocation
	| invoked resp respMsg argument |

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				| newInvocation data operation|
				argument := invocation argument.
				invoked := true.
				operation := diag rosOperationNamed: 'insertSubscriberDataV3'.
				data := operation newArgumentValue beSelfExpanding.

				data gprsSubscriptionData completeDataListIncluded: true.
				data gprsSubscriptionData gprsDataList addUsing: [ : pdp |.
					pdp pdp_ContextId: 1.
					pdp pdp_Type: #[16r01 16r21].
					pdp qos_Subscribed: #[16r23 16r71 16r1F].
					pdp apn: #[16r02 16r6F 16r77] ].
				newInvocation := diag requestTcInvoke: operation parameters:  data class: 1 timeout: 500.
				newInvocation onReturnLast: [:ret | 
					invocation invocation returnResultLastUsing: [ :result | 
						result at: 'hlr-Number' put: '4921313' toE164 ].
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
	self assert: argument sgsn_Address equals: #[4 127 0 0 1].
	self assert: respMsg pdpInfos size equals: 1.
	self assert: respMsg hlrNumber fromE164 equals: '4921313'