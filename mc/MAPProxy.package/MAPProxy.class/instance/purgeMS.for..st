as yet unclassified
purgeMS: aRequest for: aDelegate
	| imsi gt |

	imsi := 	aRequest mobileIdentity fromTBCD.
	gt := self gtForIMSI: imsi.
	gt operationForPurgeMS new
		dialogue: self newDialogue;
		callingSCCPAddress: self callingSCCPAddress;
		calledSCCPAddress: (self calledSCCPAddress: (gt prepare: imsi));
		imsi: imsi;
		onFailure: [self returnPurgeMSFailureFor: aRequest on: aDelegate];
		onSuccess: [:result | self returnPurgeMSResultFor: aRequest with: result on: aDelegate];
		start.