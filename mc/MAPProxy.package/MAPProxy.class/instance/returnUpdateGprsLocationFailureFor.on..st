as yet unclassified
returnUpdateGprsLocationFailureFor: aRequest on: aDelegate
	| error |

	logger logError: 'updateGprsLocation failed' with: { 'imsi' ->  aRequest mobileIdentity fromTBCD}.

	"TODO: handle the cause better"
	error := MAPProxyUpdateGprsLocationError new.
	error mobileIdentity: aRequest mobileIdentity.
	aDelegate sendGSUP: error toMessage asByteArray.