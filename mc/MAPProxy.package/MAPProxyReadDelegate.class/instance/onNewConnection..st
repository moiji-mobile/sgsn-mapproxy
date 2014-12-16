as yet unclassified
onNewConnection: aSocket
	super onNewConnection: aSocket.
	dispatcher 
	    addHandler: IPAConstants protocolOsmoGSUP on: [:msg | self handleGSUP: msg].