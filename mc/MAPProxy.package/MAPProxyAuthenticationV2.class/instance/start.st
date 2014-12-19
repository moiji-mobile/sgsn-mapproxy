as yet unclassified
start
	| operationName invocation |

	operationName := 'sendAuthenticationInfoV2'.
	dialogue
		onPAbort: [self failure];
		onUAbort: [self failure].
	invocation := dialogue requestTcInvokeNamed: operationName parameters:  imsi toTBCD class: 1 timeout: 60.
	invocation
		onReturn: [self failure];
		onError: [self failure];
		onReject: [self failure];
		onLCancel: [[self failure] ensure: [ dialogue terminate]];
		onReturnLast: [:result | self success: result resultObject elements].
	dialogue
		requestTcBeginDestinationAddress: calledSCCPAddress
		originatingAddress: callingSCCPAddress
		applicationContextName: (dialogue applicationContextNamed: operationName).