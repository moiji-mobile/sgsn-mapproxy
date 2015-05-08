as yet unclassified
testUpdateGprsLocationWithFromNetwork
	| invoked resp respMsg argument |

	testEndPoint
		onDialogue: [:diag |
			diag onInvoke: [:invocation |
				| newInvocation data pdp |
				argument := invocation argument.
				invoked := true.
				data := 'InsertSubscriberDataArgV3' asAsn1ValueTypedIn: testEndPoint asn1Model.
				data beSelfExpanding.
				data msisdn: '14383994444' toE164.
				data gprsSubscriptionData completeDataListIncluded: true.
				data subscriberStatus: 'serviceGranted'.
				data networkAccessMode: 'packetAndCircuit'.

				pdp := 'PDP-Context' asAsn1ValueTypedIn: testEndPoint asn1Model.
				pdp pdp_ContextId: 3.
				pdp pdp_Type: #[16rF1 16r21].
				pdp qos_Subscribed: #[16r23 16r92 16r1F].
				pdp apn: (ByteArray readHexFrom: '046968766d09766964656f74726f6e').
				pdp pdp_ChargingCharacteristics: #[16r08 16r00].
				data gprsSubscriptionData gprsDataList add: pdp.

				pdp := 'PDP-Context' asAsn1ValueTypedIn: testEndPoint asn1Model.
				pdp pdp_ContextId: 19.
				pdp pdp_Type: #[16rF1 16r21].
				pdp qos_Subscribed: #[16r23 16r92 16r1F].
				pdp apn: (ByteArray readHexFrom: '046968766d026e67').
				pdp pdp_ChargingCharacteristics: #[16r08 16r00].
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
	self assert: respMsg pdpInfos size equals: 2.
	self assert: respMsg msisdn fromE164 equals: '14383994444'.
	self assert: respMsg pdpInfos first qualityOfService equals: #[16r23 16r92 16r1F].