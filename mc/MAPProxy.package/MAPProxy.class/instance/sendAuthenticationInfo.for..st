as yet unclassified
sendAuthenticationInfo: aRequest for: aDelegate
	| callingGT calledGT operationName dialogue invocation |

	callingGT := self localSCCPAddress.
	calledGT := self remoteSCCPAddressForIMSI: aRequest mobileIdentity fromTBCD.

	operationName := 'sendAuthenticationInfoV2'.
	dialogue := endPoint newDialogue.
	dialogue
		onPAbort: [self returnSendAuthenticationFailureFor: aRequest on: aDelegate];
		onUAbort: [self returnSendAuthenticationFailureFor: aRequest on: aDelegate].
	invocation := dialogue requestTcInvokeNamed: operationName parameters:  aRequest mobileIdentity class: 1 timeout: 60.
	invocation
		onReturn: [self returnSendAuthenticationFailureFor: aRequest on: aDelegate];
		onError: [self returnSendAuthenticationFailureFor: aRequest on: aDelegate];
		onReject: [self returnSendAuthenticationFailureFor: aRequest on: aDelegate];
		onLCancel: [self returnSendAuthenticationFailureFor: aRequest on: aDelegate];
		onReturnLast: [:result | self returnSendAuthenticationResultFor: aRequest with: result on: aDelegate].
	dialogue
		requestTcBeginDestinationAddress: calledGT
		originatingAddress: callingGT
		applicationContextName: (dialogue applicationContextNamed: operationName).