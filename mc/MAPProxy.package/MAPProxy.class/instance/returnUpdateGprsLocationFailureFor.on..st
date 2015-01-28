as yet unclassified
returnUpdateGprsLocationFailureFor: aRequest on: aDelegate
	| error |

	"TODO: handle the cause better"
	error := MAPProxyUpdateGprsLocationError new.
	error mobileIdentity: aRequest mobileIdentity.
	aDelegate sendGSUP: error toMessage asByteArray.