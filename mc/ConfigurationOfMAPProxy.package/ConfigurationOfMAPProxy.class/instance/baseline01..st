baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/MAPProxy/main/'.
		spec 
			project: 'TCAP' with: [
				spec
					className: #ConfigurationOfTCAP;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/TCAP/main/' ];
			project: 'CDR' with: [
				spec
					className: #ConfigurationOfCDR;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/ChargingDataRecord/main/' ];
			project: 'ASN1' with: [
				spec
					className: #ConfigurationOfASN1;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main/' ];
			project: 'RFB' with: [
				spec
					className: #ConfigurationOfRFB;
					versionString: '0.63';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/RFB/main/' ];
			project: 'HLR' with: [
				spec
					className: #ConfigurationOfHLR;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/HomeLocationRegister/main/' ];
			project: 'OsmoCrashReportClient' with: [
				spec
					className: #ConfigurationOfOsmoCrashReportClient;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/OsmoCrashReport/main/' ];
			project: 'OsmoNetwork' with: [
				spec
					className: #ConfigurationOfOsmoNetwork;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Network/main/' ];
			project: 'OsmoLogging' with: [
				spec
					className: #ConfigurationOfOsmoLogging;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Logging/main/' ];
			project: 'OsmoGSM' with: [
				spec
					className: #ConfigurationOfOsmoGSM;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/GSM/main/' ].
		spec package: 'MAPProxy' with: [
				spec requires: #('OsmoNetwork' 'OsmoLogging' 'TCAP' 'ASN1' 'OsmoGSM' ). ]. ].
