as yet unclassified
returnSendAuthenticationFailureFor: aRequest on: aDelegate
	| error |
	"TODO: handle the cause better"
	error := MAPProxySendAuthenticationInfoError new.
	error mobileIdentity: aRequest mobileIdentity.
	error cause: #[2r10000].
	aDelegate sendGSUP: error toMessage asByteArray.