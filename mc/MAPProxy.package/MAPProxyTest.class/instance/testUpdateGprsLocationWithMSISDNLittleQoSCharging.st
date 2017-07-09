tests
testUpdateGprsLocationWithMSISDNLittleQoSCharging
	| invoked resp respMsg argument |

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				| newInvocation data pdp |
				argument := invocation argument.
				invoked := true.
				data := 'InsertSubscriberDataArgV3' asAsn1ValueTypedIn: testEndPoint asn1Model.
				data beSelfExpanding.
				data msisdn: '491662345632' toE164.
				data chargingCharacteristics: #[3 4].
				data gprsSubscriptionData completeDataListIncluded: true.
				pdp := 'PDP-Context' asAsn1ValueTypedIn: testEndPoint asn1Model.
				pdp pdp_ContextId: 1.
				pdp pdp_Type: #[16r01 16r21].
				pdp qos_Subscribed: #[3 4 5].
				pdp ext_QoS_Subscribed: #[1 6 7 8 9 10 11 12 13].
				pdp ext2_QoS_Subscribed: #[14 15 16].
				pdp apn: #[16r02 16r6F 16r77].
				pdp pdp_ChargingCharacteristics: #[88 12].
				data gprsSubscriptionData gprsDataList add: pdp.
				newInvocation := diag requestTcInvokeNamed: 'insertSubscriberDataV3' parameters:  data class: 1 timeout: 500.
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
	self assert: argument sgsn_Address equals: #[4 127 0 0 1].
	self assert: respMsg pdpInfos size equals: 1.
	self assert: respMsg msisdn fromE164 equals: '491662345632'.
	self assert: respMsg chargingCharacteristics equals: #[3 4].
	self assert: respMsg pdpInfos first qualityOfService equals: #[1 3 4 5 6 7 8 9 10 11 12 13 14 15 16]. 
	self assert: respMsg pdpInfos first chargingCharacteristics equals: #[88 12].