as yet unclassified
baseline: spec
	<baseline>

	spec for: #'common' do: [

		spec project: 'RFB' with: [
				spec
					className: #ConfigurationOfRFB;
					versionString: '0.63';
					repository: 'http://smalltalkhub.com/mc/PharoExtras/RFB/main' ].
		spec project: 'TCAP' with: [
				spec
					className: #ConfigurationOfTCAP;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/TCAP/main/' ].
		spec project: 'OsmoGSM' with: [
				spec
					className: #ConfigurationOfOsmoGSM;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/GSM/main/' ].
		spec project: 'OsmoNetwork' with: [
				spec
					className: #ConfigurationOfOsmoNetwork;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Network/main/' ].
		spec project: 'OsmoLogging' with: [
				spec
					className: #ConfigurationOfOsmoLogging;
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/osmocom/Logging/main/' ].
		spec package: 'MAPProxy' with: [
				spec requires: #('OsmoNetwork' 'OsmoLogging' 'TCAP' 'OsmoGSM' 'RFB' ). ]. ].
