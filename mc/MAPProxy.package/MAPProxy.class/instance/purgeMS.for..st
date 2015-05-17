as yet unclassified
purgeMS: aRequest for: aDelegate
	| imsi hlrNumber gt calledAddr |

	imsi := 	aRequest mobileIdentity fromTBCD.
	hlrNumber := aRequest hlrNumber.

	logger logDebug: 'GSUP purgeMS request' with: { 'imsi' -> imsi. 'hlrNumber' -> hlrNumber}.

	gt := self gtForIMSI: imsi.

	calledAddr := hlrNumber isNil
		ifTrue: [self calledSCCPAddress: (gt prepare: imsi) ]
		ifFalse: [self calledHLRAddress: hlrNumber fromE164].

	gt operationForPurgeMS new
		dialogue: self newDialogue;
		callingSCCPAddress: (self callingSCCPAddress: gt callingSSN);
		calledSCCPAddress: calledAddr;
		imsi: imsi;
		sgsnNumber: vlrNumber;
		onFailure: [self returnPurgeMSFailureFor: aRequest on: aDelegate];
		onSuccess: [:result | self returnPurgeMSResultFor: aRequest with: result on: aDelegate];
		start.