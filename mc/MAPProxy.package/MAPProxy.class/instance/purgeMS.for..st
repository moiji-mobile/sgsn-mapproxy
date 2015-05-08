as yet unclassified
purgeMS: aRequest for: aDelegate
	| imsi gt |

	imsi := 	aRequest mobileIdentity fromTBCD.
	logger logDebug: 'GSUP purgeMS request' with: { 'imsi' -> imsi }.

	gt := self gtForIMSI: imsi.
	gt operationForPurgeMS new
		dialogue: self newDialogue;
		callingSCCPAddress: (self callingSCCPAddress: gt callingSSN);
		calledSCCPAddress: (self calledSCCPAddress: (gt prepare: imsi));
		imsi: imsi;
		sgsnNumber: vlrNumber;
		onFailure: [self returnPurgeMSFailureFor: aRequest on: aDelegate];
		onSuccess: [:result | self returnPurgeMSResultFor: aRequest with: result on: aDelegate];
		start.