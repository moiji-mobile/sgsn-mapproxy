as yet unclassified
start
	| operationName invocation saiArg |

	saiArg := 'SendAuthenticationInfoArgV3' asAsn1ValueTypedIn: dialogue asn1Model.
	saiArg imsi: imsi toTBCD.
	saiArg numberOfRequestedVectors: 4.
	operationName := 'sendAuthenticationInfoV3'.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure].
	invocation := dialogue requestTcInvokeNamed: operationName parameters: saiArg class: 1 timeout: 60.
	invocation
		onReturn: [self failure];
		onError: [self failure];
		onReject: [self failure];
		onLCancel: [[self failure] ensure: [ dialogue terminate]];
		onReturnLast: [:result | self successWith: [result resultObject authenticationSetList tripletList elements]].
	dialogue
		requestTcBeginDestinationAddress: calledSCCPAddress
		originatingAddress: callingSCCPAddress
		applicationContextName: (dialogue applicationContextNamed: operationName).