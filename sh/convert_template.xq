declare option output:method "csv";
declare option output:csv "header=yes, separator=comma";

for $incident in doc("../xml/TFS_OPEN_DATA-2011.xml")/FIRE_DATA/INCIDENT
return
<csv>
	<record>
		<INCIDENT_NUMBER>{$incident/INCIDENT_NUMBER/data()}</INCIDENT_NUMBER>
	    <EVENT_TYPE>{$incident/EVENT_TYPE/data()}</EVENT_TYPE>
	    <DISPATCH_DATE>{$incident/ARRIVE_DATE/data()}</DISPATCH_DATE>
	    <ARRIVE_DATE>{$incident/ARRIVE_DATE/data()}</ARRIVE_DATE>
	    <EVENT_TYPE_CD>{$incident/EVENT_TYPE_CD/data()}</EVENT_TYPE_CD>
	    <MAIN_STREET>{$incident/MAIN_STREET/data()}</MAIN_STREET>
	    <CROSS_STREET>{$incident/CROSS_STREET/data()}</CROSS_STREET>
	    <FSA>{$incident/FSA/data()}</FSA>
	    <RESPONDING_UNITS>{$incident/RESPONDING_UNITS/data()}</RESPONDING_UNITS>
	    <FD_STATION>{$incident/FD_STATION/data()}</FD_STATION>
	    <OFM_INVESTIGATIONS_CONTACTED>{$incident/OFM_INVESTIGATIONS_CONTACTED/data()}</OFM_INVESTIGATIONS_CONTACTED>
	    <AID_TO_FROM_OTHER_DEPTS>{$incident/AID_TO_FROM_OTHER_DEPTS/data()}</AID_TO_FROM_OTHER_DEPTS>
	    <INCIDENT_DATE>{$incident/INCIDENT_DATE/data()}</INCIDENT_DATE>
	    <INITIAL_CALL_HOUR>{$incident/INITIAL_CALL_HOUR/data()}</INITIAL_CALL_HOUR>
	    <INITIAL_CALL_MIN>{$incident/INITIAL_CALL_MIN/data()}</INITIAL_CALL_MIN>
	    <INITIAL_CALL_SEC>{$incident/INITIAL_CALL_SEC/data()}</INITIAL_CALL_SEC>
	    <DISPATCH_HOUR>{$incident/DISPATCH_HOUR/data()}</DISPATCH_HOUR>
	    <DISPATCH_MIN>{$incident/DISPATCH_MIN/data()}</DISPATCH_MIN>
	    <DISPATCH_SEC>{$incident/DISPATCH_SEC/data()}</DISPATCH_SEC>
	    <ONSCENE_HOUR>{$incident/ONSCENE_HOUR/data()}</ONSCENE_HOUR>
	    <ONSCENE_MIN>{$incident/ONSCENE_MIN/data()}</ONSCENE_MIN>
	    <ONSCENE_SEC>{$incident/ONSCENE_SEC/data()}</ONSCENE_SEC>
	    <INITIAL_UNIT_PERSONNEL>{$incident/INITIAL_UNIT_PERSONNEL/data()}</INITIAL_UNIT_PERSONNEL>
	    <TOTAL_NUM_PERSONNEL>{$incident/TOTAL_NUM_PERSONNEL/data()}</TOTAL_NUM_PERSONNEL>
	    <EST_KM>{$incident/EST_KM/data()}</EST_KM>
	    <ALARM_TO_FD>{$incident/ALARM_TO_FD/data()}</ALARM_TO_FD>
	    <RESPONSE_TYPE>{$incident/RESPONSE_TYPE/data()}</RESPONSE_TYPE>
	    <RESCUES>{$incident/RESCUES/data()}</RESCUES>
	    <FF_INJURIES>{$incident/FF_INJURIES/data()}</FF_INJURIES>
	    <FF_FATALITIES>{$incident/FF_FATALITIES/data()}</FF_FATALITIES>
	    <AGENT_APP_HOUR>{$incident/AGENT_APP_HOUR/data()}</AGENT_APP_HOUR>
	    <AGENT_APP_MIN>{$incident/AGENT_APP_MIN/data()}</AGENT_APP_MIN>
	    <AGENT_APP_SEC>{$incident/AGENT_APP_SEC/data()}</AGENT_APP_SEC>
	    <CONTROL_DATE>{$incident/CONTROL_DATE/data()}</CONTROL_DATE>
	    <CONTROL_HOUR>{$incident/CONTROL_HOUR/data()}</CONTROL_HOUR>
	    <CONTROL_MIN>{$incident/CONTROL_MIN/data()}</CONTROL_MIN>
	    <CONTROL_SEC>{$incident/CONTROL_SEC/data()}</CONTROL_SEC>
	    <STATUS_ON_ARRIVAL>{$incident/STATUS_ON_ARRIVAL/data()}</STATUS_ON_ARRIVAL>
	    <WATER>{$incident/WATER/data()}</WATER>
	    <FIRE_CONTROL>{$incident/FIRE_CONTROL/data()}</FIRE_CONTROL>
	    <PROPERTY>{$incident/PROPERTY/data()}</PROPERTY>
	    <AREA_OF_ORIGIN>{$incident/AREA_OF_ORIGIN/data()}</AREA_OF_ORIGIN>
	    <IGNITION_SOURCE>{$incident/IGNITION_SOURCE/data()}</IGNITION_SOURCE>
	    <FUEL_OF_IGNITION_SOURCE>{$incident/FUEL_OF_IGNITION_SOURCE/data()}</FUEL_OF_IGNITION_SOURCE>
	    <OBJECT_OR_MATERIAL_FIRST_IGNITED>{$incident/OBJECT_OR_MATERIAL_FIRST_IGNITED/data()}</OBJECT_OR_MATERIAL_FIRST_IGNITED>
	    <POSSIBLE_CAUSE>{$incident/POSSIBLE_CAUSE/data()}</POSSIBLE_CAUSE>
	    <VEH_PURPOSE>{$incident/VEH_PURPOSE/data()}</VEH_PURPOSE>
	    <VEH_FUEL>{$incident/VEH_FUEL/data()}</VEH_FUEL>
	    <EST_LOSS>{$incident/EST_LOSS/data()}</EST_LOSS>
	    <INSURANCE_ESTIMATE>{$incident/INSURANCE_ESTIMATE/data()}</INSURANCE_ESTIMATE>
	    <EST_VALUE_AT_RISK>{$incident/EST_VALUE_AT_RISK/data()}</EST_VALUE_AT_RISK>
	    <CIVILIAN_FIRE_INJURY>{$incident/CIVILIAN_FIRE_INJURY/data()}</CIVILIAN_FIRE_INJURY>
	    <CIVILIAN_FIRE_FATALITY>{$incident/CIVILIAN_FIRE_FATALITY/data()}</CIVILIAN_FIRE_FATALITY>
	    <RESCUED_CHILDREN>{$incident/RESCUED_CHILDREN/data()}</RESCUED_CHILDREN>
	    <RESCUED_ADULTS>{$incident/RESCUED_ADULTS/data()}</RESCUED_ADULTS>
	    <RESCUED_SENIORS>{$incident/RESCUED_SENIORS/data()}</RESCUED_SENIORS>
	    <PHYSICAL_CONDITION_1>{$incident/PHYSICAL_CONDITION_1/data()}</PHYSICAL_CONDITION_1>
	    <PHYSICAL_CONDITION_2>{$incident/PHYSICAL_CONDITION_2/data()}</PHYSICAL_CONDITION_2>
	    <PHYSICAL_CONDITION_3>{$incident/PHYSICAL_CONDITION_3/data()}</PHYSICAL_CONDITION_3>
	    <CIV_FIRE_CONTROL>{$incident/CIV_FIRE_CONTROL/data()}</CIV_FIRE_CONTROL>
	    <CIV_EVACUATION>{$incident/CIV_EVACUATION/data()}</CIV_EVACUATION>
	    <CIV_EVACUATION_REASON_1>{$incident/CIV_EVACUATION_REASON_1/data()}</CIV_EVACUATION_REASON_1>
	    <CIV_EVACUATION_REASON_2>{$incident/CIV_EVACUATION_REASON_2/data()}</CIV_EVACUATION_REASON_2>
	    <OPP>{$incident/OPP/data()}</OPP>
	    <MOE>{$incident/MOE/data()}</MOE>
	    <TSSA>{$incident/TSSA/data()}</TSSA>
	    <ESA>{$incident/ESA/data()}</ESA>
	    <MOL>{$incident/MOL/data()}</MOL>
	    <EMS>{$incident/EMS/data()}</EMS>
	    <CANUTEC>{$incident/CANUTEC/data()}</CANUTEC>
	    <GAS>{$incident/GAS/data()}</GAS>
	    <HYDRO>{$incident/HYDRO/data()}</HYDRO>
	    <MUNICIPAL_BUILDING_OFFICE>{$incident/MUNICIPAL_BUILDING_OFFICE/data()}</MUNICIPAL_BUILDING_OFFICE>
	    <MUNICIPAL_HEALTH_OFFICE>{$incident/MUNICIPAL_HEALTH_OFFICE/data()}</MUNICIPAL_HEALTH_OFFICE>
	    <MUNICIPAL_POLICE>{$incident/MUNICIPAL_POLICE/data()}</MUNICIPAL_POLICE>
	    <OTHER>{$incident/OTHER/data()}</OTHER>
	    <INITIAL_DETECTION>{$incident/INITIAL_DETECTION/data()}</INITIAL_DETECTION>
	    <EXTENT_FIRE>{$incident/EXTENT_FIRE/data()}</EXTENT_FIRE>
	    <EXTENT_SMOKE>{$incident/EXTENT_SMOKE/data()}</EXTENT_SMOKE>
	    <EST_NUM_PERSONS_DISPLACED>{$incident/EST_NUM_PERSONS_DISPLACED/data()}</EST_NUM_PERSONS_DISPLACED>
	    <POSSIBLE_BUSINESS_IMPACT>{$incident/POSSIBLE_BUSINESS_IMPACT/data()}</POSSIBLE_BUSINESS_IMPACT>
	    <COMPLEX>{$incident/COMPLEX/data()}</COMPLEX>
	    <OCC_STATUS>{$incident/OCC_STATUS/data()}</OCC_STATUS>
	    <OCC_TYPE>{$incident/OCC_TYPE/data()}</OCC_TYPE>
	    <BLD_STATUS>{$incident/BLD_STATUS/data()}</BLD_STATUS>
	    <BLD_HEIGHT>{$incident/BLD_HEIGHT/data()}</BLD_HEIGHT>
	    <LEVEL_OF_ORIGIN>{$incident/LEVEL_OF_ORIGIN/data()}</LEVEL_OF_ORIGIN>
	    <AGE_OF_STRUCTURE>{$incident/AGE_OF_STRUCTURE/data()}</AGE_OF_STRUCTURE>
	    <SMOKE_ALARM_PRESENCE_AND_OPERATION_MAIN_FLOOR>{$incident/SMOKE_ALARM_PRESENCE_AND_OPERATION_MAIN_FLOOR/data()}</SMOKE_ALARM_PRESENCE_AND_OPERATION_MAIN_FLOOR>
	    <SMOKE_ALARM_FAILURE_TO_OPERATE>{$incident/SMOKE_ALARM_FAILURE_TO_OPERATE/data()}</SMOKE_ALARM_FAILURE_TO_OPERATE>
	    <SMOKE_ALARM_TYPE>{$incident/SMOKE_ALARM_TYPE/data()}</SMOKE_ALARM_TYPE>
	    <SMOKE_ALARM_OTHER_FLOOR_PRESENCE>{$incident/SMOKE_ALARM_OTHER_FLOOR_PRESENCE/data()}</SMOKE_ALARM_OTHER_FLOOR_PRESENCE>
	    <SMOKE_ALARM_ON_ALL_FLOORS>{$incident/SMOKE_ALARM_ON_ALL_FLOORS/data()}</SMOKE_ALARM_ON_ALL_FLOORS>
	    <SMOKE_ALARM_IMPACT_ON_EVAC>{$incident/SMOKE_ALARM_IMPACT_ON_EVAC/data()}</SMOKE_ALARM_IMPACT_ON_EVAC>
	    <SMOKE_ALARM_IMPACT_ON_NUM_EVAC>{$incident/SMOKE_ALARM_IMPACT_ON_NUM_EVAC/data()}</SMOKE_ALARM_IMPACT_ON_NUM_EVAC>
	    <FIRE_ALARM_SYSTEM_PRESENCE>{$incident/FIRE_ALARM_SYSTEM_PRESENCE/data()}</FIRE_ALARM_SYSTEM_PRESENCE>
	    <FIRE_ALARM_SYSTEM_OPERATION>{$incident/FIRE_ALARM_SYSTEM_OPERATION/data()}</FIRE_ALARM_SYSTEM_OPERATION>
	    <FIRE_ALARM_SYSTEM_IMPACT>{$incident/FIRE_ALARM_SYSTEM_IMPACT/data()}</FIRE_ALARM_SYSTEM_IMPACT>
	    <SPRINKLER_SYSTEM_PRESENCE>{$incident/SPRINKLER_SYSTEM_PRESENCE/data()}</SPRINKLER_SYSTEM_PRESENCE>
	    <SPRINKLER_SYSTEM_ACTIVATION>{$incident/SPRINKLER_SYSTEM_ACTIVATION/data()}</SPRINKLER_SYSTEM_ACTIVATION>	    
	</record>
</csv>
