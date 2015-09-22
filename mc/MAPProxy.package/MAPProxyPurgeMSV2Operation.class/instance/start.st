as yet unclassified
start
	| operationName invocation param |

	operationName := 'purgeMSV2'.
	param := 'PurgeMS-ArgV2' asAsn1ValueTypedIn: dialogue asn1Model.
	param imsi: imsi toTBCD.
	param vlr_Number: sgsnNumber toE164.
	
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure].
	invocation := dialogue requestTcInvokeNamed: operationName parameters:  param class: 1 timeout: 60.
	invocation
		onReturn: [self failure];
		onError: [self failure];
		onReject: [self failure];
		onLCancel: [[self failure] ensure: [ dialogue terminate]];
		onReturnLast: [:result | self successWith: [result]].
	dialogue
		requestTcBeginDestinationAddress: calledSCCPAddress
		originatingAddress: callingSCCPAddress
		applicationContextName: (dialogue applicationContextOidForOperationNamed: operationName).