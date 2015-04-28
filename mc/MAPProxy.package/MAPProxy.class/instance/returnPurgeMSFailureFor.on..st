as yet unclassified
returnPurgeMSFailureFor: aRequest on: aDelegate
	| error |

	logger logError: 'purgeMS failed' with: { 'imsi' ->  aRequest mobileIdentity fromTBCD}.

	"TODO: handle the cause better"
	error := MAPProxyPurgeMSError new.
	error mobileIdentity: aRequest mobileIdentity.
	aDelegate sendGSUP: error toMessage asByteArray.