as yet unclassified
sendAuthenticationInfo: aRequest for: aDelegate
	| imsi gt |

	imsi := 	aRequest mobileIdentity fromTBCD.
	gt := self gtForIMSI: imsi.
	gt operationForAuthentication new
		dialogue: self newDialogue;
		callingSCCPAddress: self callingSCCPAddress;
		calledSCCPAddress: (self calledSCCPAddress: (gt prepare: imsi));
		imsi: imsi;
		onFailure: [self returnSendAuthenticationFailureFor: aRequest on: aDelegate];
		onSuccess: [:result | self returnSendAuthenticationResultFor: aRequest with: result on: aDelegate];
		start.