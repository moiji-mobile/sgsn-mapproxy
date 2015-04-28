as yet unclassified
returnSendAuthenticationFailureFor: aRequest on: aDelegate
	| error |

	logger logError: 'sendAuthentication failed' with: { 'imsi' ->  aRequest mobileIdentity fromTBCD}.

	"TODO: handle the cause better"
	error := MAPProxySendAuthenticationInfoError new.
	error mobileIdentity: aRequest mobileIdentity.
	error cause: #[2r10000].
	aDelegate sendGSUP: error toMessage asByteArray.