baselines
baseline01: spec
	<version: '0.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/'.
		spec 
			project: 'Osmocom' with: [
				spec
					className: #ConfigurationOfOsmocom;
					versionString: '0.1.6';
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/' ];
			project: 'TCAP' with: [
				spec
					className: #ConfigurationOfTCAP;
					versionString: '0.2.1';
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/' ];
			project: 'CDR' with: [
				spec
					className: #ConfigurationOfCDR;
					versionString: '0.22';
					repository: 'http://smalltalkhub.com/mc/osmocom/Osmocom/main/' ];
			project: 'ASN1' with: [
				spec
					className: #ConfigurationOfASN1;
					versionString: '0.8.26';
					repository: 'http://smalltalkhub.com/mc/NorbertHartl/ASN1/main/' ];
			project: 'RFB' with: [
				spec
					className: #ConfigurationOfRFB;
					versionString: '0.63';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/RFB/main/' ].
		spec 
			package: 'OsmoSocket';
			package: 'MAPProxy' with: [
				spec requires: #('OsmoSocket' 'Osmocom' 'TCAP' 'ASN1' ). ]. ].
