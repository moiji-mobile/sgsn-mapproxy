as yet unclassified
updateGprsLocation: aRequest for: aDelegate
	| imsi gt op |

	imsi := 	aRequest mobileIdentity fromTBCD.
	gt := self gtForIMSI: imsi.
	op := MAPProxyUpdateGprsLocationOperation  new.
	op
		dialogue: self newDialogue;
		callingSCCPAddress: (self callingSCCPAddress: gt callingSSN);
		calledSCCPAddress: (self calledSCCPAddress: (gt prepare: imsi));
		imsi: imsi;
		vlrNumber: vlrNumber;
		sgsnAddress: sgsnAddress;
		onFailure: [self returnUpdateGprsLocationFailureFor: aRequest on: aDelegate];
		onSuccess: [:result | self returnUpdateGprsLocationResultFor: aRequest with: op on: aDelegate];
		start.