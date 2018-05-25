declare option output:method "csv";
declare option output:csv "header=yes, separator=comma";

<RespondingUnits>
{
	for $runits in doc("../xml/TFS_OPEN_DATA-2011.xml")/FIRE_DATA/INCIDENT/RespondingUnits
	return
	<RespondingUnit>
		<INCIDENT_NUMBER>{$runits/../INCIDENT_NUMBER/data()}</INCIDENT_NUMBER>
		<CAD_UNIT_ID>{$runits/CAD_UNIT_ID/data()}</CAD_UNIT_ID>
		<DISPATCH_TIME>{$runits/DISPATCH_TIME/data()}</DISPATCH_TIME>
		<ENROUTE_TIME>{$runits/ENROUTE_TIME/data()}</ENROUTE_TIME>
		<ARRIVE_TIME>{$runits/ARRIVE_TIME/data()}</ARRIVE_TIME>
		<CLEAR_TIME>{$runits/CLEAR_TIME/data()}</CLEAR_TIME>
	</RespondingUnit>
}
</RespondingUnits>