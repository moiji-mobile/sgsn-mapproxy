as yet unclassified
returnPurgeMSFailureFor: aRequest on: aDelegate
	| error |

	"TODO: handle the cause better"
	error := MAPProxyPurgeMSError new.
	error mobileIdentity: aRequest mobileIdentity.
	aDelegate sendGSUP: error toMessage asByteArray.