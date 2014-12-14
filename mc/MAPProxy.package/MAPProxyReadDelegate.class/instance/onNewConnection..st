as yet unclassified
onNewConnection: aSocket
	super onNewConnection: aSocket.
	dispatcher 
	    addHandler: IPAConstants protocolOsmoGSUP
	    on: self
	    with: #handleGSUP: