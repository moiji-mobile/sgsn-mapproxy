as yet unclassified
updateGprsLocation: aRequest for: aDelegate
	| imsi gt |

	imsi := 	aRequest mobileIdentity fromTBCD.
	gt := self gtForIMSI: imsi.
	MAPProxyUpdateGprsLocationOperation  new
		dialogue: self newDialogue;
		callingSCCPAddress: self callingSCCPAddress;
		calledSCCPAddress: (self calledSCCPAddress: (gt prepare: imsi));
		imsi: imsi;
		vlrNumber: vlrNumber;
		onFailure: [self returnUpdateGprsLocationFailureFor: aRequest on: aDelegate];
		onSuccess: [:result | self returnUpdateGprsLocationResultFor: aRequest with: result on: aDelegate];
		start.